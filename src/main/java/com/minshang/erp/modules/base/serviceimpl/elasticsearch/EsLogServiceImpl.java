package com.minshang.erp.modules.base.serviceimpl.elasticsearch;

import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.base.dao.elasticsearch.EsLogDao;
import com.minshang.erp.modules.base.entity.elasticsearch.EsLog;
import com.minshang.erp.modules.base.service.elasticsearch.EsLogService;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author houyi
 */
@Service
@Transactional
@Slf4j
public class EsLogServiceImpl implements EsLogService {

    @Autowired
    private EsLogDao logDao;

    @Override
    public EsLog saveLog(EsLog esLog) {

        return logDao.save(esLog);
    }

    @Override
    public void deleteLog(String id) {

        logDao.deleteById(id);
    }

    @Override
    public void deleteAll() {

        logDao.deleteAll();
    }

    @Override
    public Page<EsLog> getLogList(Pageable pageable) {

        return logDao.findAll(pageable);
    }

    @Override
    public Page<EsLog> searchLog(String key, SearchVo searchVo, Pageable pageable) {

        if(StrUtil.isBlank(key)&&StrUtil.isBlank(searchVo.getStartDate())){
            return null;
        }

        QueryBuilder qb;


        QueryBuilder qb1 = QueryBuilders.multiMatchQuery(key, "requestUrl", "requestType","requestParam","username","ip","ipInfo");

        //仅有key
        if(StrUtil.isNotBlank(key)&&StrUtil.isBlank(searchVo.getStartDate())&&StrUtil.isBlank(searchVo.getEndDate())){
            qb = qb1;
        }else if(StrUtil.isBlank(key)&&StrUtil.isNotBlank(searchVo.getStartDate())&&StrUtil.isNotBlank(searchVo.getEndDate())){
            //仅有时间范围
            Long start = DateUtil.parse(searchVo.getStartDate()).getTime();
            Long end = DateUtil.endOfDay(DateUtil.parse(searchVo.getEndDate())).getTime();
            QueryBuilder qb2 = QueryBuilders.rangeQuery("timeMillis").gte(start).lte(end);
            qb = qb2;
        }else{
            //两者都有
            Long start = DateUtil.parse(searchVo.getStartDate()).getTime();
            Long end = DateUtil.endOfDay(DateUtil.parse(searchVo.getEndDate())).getTime();
            QueryBuilder qb2 = QueryBuilders.rangeQuery("timeMillis").gte(start).lte(end);
            qb = QueryBuilders.boolQuery().must(qb1).must(qb2);
        }

        //多字段搜索
        return logDao.search(qb, pageable);
    }
}
