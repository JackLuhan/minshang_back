package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.dao.ShopVendorDao;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import com.minshang.erp.modules.shop.service.ShopVendorService;
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
 * 门店供应商接口实现
 * @author Y 。
 */
@Slf4j
@Service
@Transactional
public class ShopVendorServiceImpl implements ShopVendorService {

    @Autowired
    private ShopVendorDao shopVendorDao;

    @Override
    public ShopVendorDao getRepository() {
        return shopVendorDao;
    }

    @Override
    public Page<ShopVendor> findByCondition(ShopVendor shopVendor, SearchVo searchVo, Pageable pageable) {
        return shopVendorDao.findAll(new Specification<ShopVendor>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopVendor> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据仓库名称查询
                Path<String> nameField = root.get("vendorName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(shopVendor.getVendorName())) {
                    list.add(cb.like(nameField, '%' + shopVendor.getVendorName() + '%'));
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