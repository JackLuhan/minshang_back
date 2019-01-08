package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
import com.minshang.erp.modules.head.dao.HeadSupplierDao;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.service.HeadSupplierService;
import com.minshang.erp.modules.shop.dao.ShopBuyerOrderDao;
import com.minshang.erp.modules.shop.dao.ShopGoodsOrderDao;
import com.minshang.erp.modules.shop.entity.ShopBuyerOrder;
import com.minshang.erp.modules.shop.entity.ShopGoodsOrder;
import com.minshang.erp.modules.shop.service.ShopBuyerOrderService;
import com.minshang.erp.modules.shop.service.ShopGoodsOrderService;
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
 * 门店采购订单接口实现
 * @author Y。
 */
@Slf4j
@Service
@Transactional
public class ShopBuyerOrderServiceImpl implements ShopBuyerOrderService {

    @Autowired
    private ShopBuyerOrderDao shopBuyerOrderDao;
    @Autowired
    private ShopBuyerOrderService shopBuyerOrderService;
    @Autowired
    private ShopGoodsOrderService shopGoodsOrderService;
    @Autowired
    private ShopGoodsOrderDao shopGoodsOrderDao;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private HeadSupplierDao supplierDao;
    @Autowired
    private HeadSupplierService supplierService;

    @Override
    public ShopBuyerOrderDao getRepository() {
        return shopBuyerOrderDao;
    }

    @Override
    public ShopBuyerOrder saveShopBuyerOrder(ShopBuyerOrder shopBuyerOrder) {
        Organization organization = organizationService.get(shopBuyerOrder.getOrgId());
        HeadSupplier supplier = supplierService.get(shopBuyerOrder.getSupplierId());
        ShopGoodsOrder shopGoodsOrder = shopGoodsOrderService.get(shopBuyerOrder.getShopGoodsOrderId());
        shopBuyerOrder.setOrgName(organization.getOrgName());
        shopBuyerOrder.setSupplierName(supplier.getSupplierName());
        shopBuyerOrder.setDocumentNum(shopGoodsOrder.getDocumentNum());
        shopBuyerOrder.setOrderType(shopBuyerOrder.getOrderType());
        shopBuyerOrder.setPrice(shopBuyerOrder.getPrice());
        shopBuyerOrder.setAuditDate(shopBuyerOrder.getAuditDate());
        shopBuyerOrder.setDeliveryTime(shopBuyerOrder.getDeliveryTime());
        shopBuyerOrder.setPurchaseDate(shopBuyerOrder.getPurchaseDate());
        return shopBuyerOrderDao.save(shopBuyerOrder);
    }

    @Override
    public ShopBuyerOrder editShopBuyerOrder(ShopBuyerOrder shopBuyerOrder) {
        ShopBuyerOrder shopBuyerOrderOne = shopBuyerOrderDao.getOne(shopBuyerOrder.getId());
        Organization organization = organizationDao.getOne(shopBuyerOrder.getOrgId());
        ShopGoodsOrder shopGoodsOrder = shopGoodsOrderDao.getOne(shopBuyerOrder.getShopGoodsOrderId());
        HeadSupplier headSupplier = supplierDao.getOne(shopBuyerOrder.getSupplierId());
        shopBuyerOrderOne.setOrgName(organization.getOrgName());
        shopBuyerOrderOne.setDocumentNum(shopGoodsOrder.getDocumentNum());
        shopBuyerOrderOne.setSupplierName(headSupplier.getSupplierName());
        shopBuyerOrderOne.setOrderType(shopBuyerOrder.getOrderType());
        shopBuyerOrderOne.setPrice(shopBuyerOrder.getPrice());
        shopBuyerOrderOne.setAuditDate(shopBuyerOrder.getAuditDate());
        shopBuyerOrderOne.setDeliveryTime(shopBuyerOrder.getDeliveryTime());
        shopBuyerOrderOne.setPurchaseDate(shopBuyerOrder.getPurchaseDate());

        return shopBuyerOrderService.update(shopBuyerOrderOne);
    }

    @Override
    public Page<ShopBuyerOrder> findByCondition(ShopBuyerOrder shopBuyerOrder, SearchVo searchVo, Pageable pageable) {
        return shopBuyerOrderDao.findAll(new Specification<ShopBuyerOrder>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopBuyerOrder> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据订货门店查询
                Path<String> nameField = root.get("orgName");
                //根据单据号查询
                Path<String> numField = root.get("documentNum");

                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //根据订货门店查询
                if(StrUtil.isNotBlank(shopBuyerOrder.getOrgName())) {
                    list.add(cb.like(nameField, '%' + shopBuyerOrder.getOrgName() + '%'));
                }
                //根据单据号搜索
                if(StrUtil.isNotBlank(shopBuyerOrder.getDocumentNum())) {
                    list.add(cb.like(numField, '%' + shopBuyerOrder.getDocumentNum() + '%'));
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