package com.minshang.erp.modules.brandarea.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.dao.BrandAreaDao;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.service.BrandAreaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 品牌区域接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class BrandAreaServiceImpl implements BrandAreaService {

    @Resource
    private BrandAreaDao brandAreaDao;

    @Override
    public BrandAreaDao getRepository() {
        return brandAreaDao;
    }

    @Override
    public Page<BrandArea> findByCondition(BrandArea brandArea, SearchVo searchVo, Pageable pageable) {
        return brandAreaDao.findAll(new Specification<BrandArea>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<BrandArea> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据品牌名字查询
                Path<String> nameField = root.get("brandname");
                Path<Date> createTimeField=root.get("createTime");
                //根据区域名字查询
                Path<String> areaname = root.get("areaname");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(brandArea.getAreaname())) {
                    list.add(cb.like(areaname, '%' + brandArea.getAreaname() + '%'));
                }
                if(StrUtil.isNotBlank(brandArea.getBrandname())) {
                    list.add(cb.like(nameField, '%' + brandArea.getBrandname() + '%'));
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

    @Override
    public BrandArea findByBrandname(String brandname) {
        List<BrandArea> list = brandAreaDao.findByBrandname(brandname);
        if(list!=null&&list.size()>0){
            BrandArea brandArea = list.get(0);
            return brandArea;
        }
        return null;
    }
}