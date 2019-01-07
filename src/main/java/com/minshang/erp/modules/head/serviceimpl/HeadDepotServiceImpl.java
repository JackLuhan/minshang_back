package com.minshang.erp.modules.head.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.dao.HeadDepotDao;
import com.minshang.erp.modules.head.entity.HeadDepot;
import com.minshang.erp.modules.head.service.HeadDepotService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 总部仓库接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadDepotServiceImpl implements HeadDepotService {

    @Autowired
    private HeadDepotDao headDepotDao;

    @Override
    public HeadDepotDao getRepository() {
        return headDepotDao;
    }

    @Override
    public Page<HeadDepot> findByCondition(HeadDepot headDepot, SearchVo searchVo, Pageable pageable) {
        return headDepotDao.findAll(new Specification<HeadDepot>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<HeadDepot> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据总部仓库名字查询
                Path<String> nameField = root.get("depotName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(headDepot.getDepotName())) {
                    list.add(cb.like(nameField, '%' + headDepot.getDepotName() + '%'));
                }
                //创建时间
                if(StrUtil.isNotBlank(searchVo.getStartDate())&&StrUtil.isNotBlank(searchVo.getEndDate())){
                    Date start = DateUtil.parse(searchVo.getStartDate());
                    Date end = DateUtil.parse(searchVo.getEndDate());
                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }
}