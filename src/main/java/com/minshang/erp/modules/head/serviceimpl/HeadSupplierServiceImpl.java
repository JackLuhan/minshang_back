package com.minshang.erp.modules.head.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.dao.HeadSupplierDao;
import com.minshang.erp.modules.head.entity.HeadDepot;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.service.HeadSupplierService;
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
 * 总部供应商接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadSupplierServiceImpl implements HeadSupplierService {

    @Autowired
    private HeadSupplierDao headSupplierDao;

    @Override
    public HeadSupplierDao getRepository() {
        return headSupplierDao;
    }

    @Override
    public Page<HeadSupplier> findByCondition(HeadSupplier headSupplier, SearchVo searchVo, Pageable pageable) {
        return headSupplierDao.findAll(new Specification<HeadSupplier>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<HeadSupplier> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据总部供应商名字查询
                Path<String> nameField = root.get("supplierName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(headSupplier.getSupplierName())) {
                    list.add(cb.like(nameField, '%' + headSupplier.getSupplierName() + '%'));
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
    public HeadSupplier findBySupplierName(String supplierName) {
        List<HeadSupplier> list = headSupplierDao.findBySupplierName(supplierName);
        if(list!=null&&list.size()>0){
            HeadSupplier headSupplier = list.get(0);
            return headSupplier;
        }
        return null;
    }

    @Override
    public HeadSupplier findBySupplierCode(String supplierCode) {
        List<HeadSupplier> list = headSupplierDao.findBySupplierCode(supplierCode);
        if(list!=null&&list.size()>0){
            HeadSupplier headSupplier = list.get(0);
            return headSupplier;
        }
        return null;
    }
}