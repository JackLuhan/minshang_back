package com.minshang.erp.modules.shop.serviceImpl;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
import com.minshang.erp.modules.shop.dao.ShopGoodsOrderDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopGoodsOrder;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopGoodsOrderService;
import com.minshang.erp.modules.shop.service.ShopUnitService;
import io.micrometer.core.lang.Nullable;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 门店物品订单接口实现
 * @author Y。
 */
@Slf4j
@Service
@Transactional
public class ShopGoodsOrderServiceImpl implements ShopGoodsOrderService {

    @Autowired
    private ShopGoodsOrderDao shopGoodsOrderDao;
    @Autowired
    private ShopGoodsOrderService shopGoodsOrderService;
    @Autowired
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public ShopGoodsOrderDao getRepository() {
        return shopGoodsOrderDao;
    }

    @Override
    public ShopGoodsOrder saveShopGoodsOrder(ShopGoodsOrder shopGoodsOrder) {
        ShopUnit shopUnit = shopUnitService.get(shopGoodsOrder.getShopUnitId());
        Organization organization = organizationService.get(shopGoodsOrder.getOrgId());
        shopGoodsOrder.setOrgName(organization.getOrgName());
        shopGoodsOrder.setShopUnitName(shopUnit.getShopUnitName());
        shopGoodsOrder.setDocumentNum(shopGoodsOrder.getDocumentNum());
        shopGoodsOrder.setIndentNum(shopGoodsOrder.getIndentNum());
        shopGoodsOrder.setTotalDelivered(shopGoodsOrder.getTotalDelivered());
        return shopGoodsOrderDao.save(shopGoodsOrder);
    }

    @Override
    public ShopGoodsOrder editShopGoodsOrder(ShopGoodsOrder shopGoodsOrder) {
        ShopGoodsOrder shopGoodsOrderOne = shopGoodsOrderDao.getOne(shopGoodsOrder.getId());
        ShopUnit shopUnit = shopUnitDao.getOne(shopGoodsOrder.getShopUnitId());
        Organization organization = organizationDao.getOne(shopGoodsOrder.getOrgId());
        shopGoodsOrderOne.setOrgName(organization.getOrgName());
        shopGoodsOrderOne.setShopUnitName(shopUnit.getShopUnitName());
        shopGoodsOrderOne.setIndentNum(shopGoodsOrder.getIndentNum());
        shopGoodsOrderOne.setDocumentNum(shopGoodsOrder.getDocumentNum());
        shopGoodsOrderOne.setTotalDelivered(shopGoodsOrder.getTotalDelivered());
        return shopGoodsOrderService.update(shopGoodsOrderOne);
    }

    @Override
    public Page<ShopGoodsOrder> findByCondition(ShopGoodsOrder shopGoodsOrder, SearchVo searchVo, Pageable pageable) {
        return shopGoodsOrderDao.findAll(new Specification<ShopGoodsOrder>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopGoodsOrder> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据订货门店查询
                Path<String> nameField = root.get("orgName");
                //根据单据号查询
                Path<String> numField = root.get("documentNum");

                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //根据订货门店查询
                if(StrUtil.isNotBlank(shopGoodsOrder.getOrgName())) {
                    list.add(cb.like(nameField, '%' + shopGoodsOrder.getOrgName() + '%'));
                }
                //根据单据号搜索
                if(StrUtil.isNotBlank(shopGoodsOrder.getDocumentNum())) {
                    list.add(cb.like(numField, '%' + shopGoodsOrder.getDocumentNum() + '%'));
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