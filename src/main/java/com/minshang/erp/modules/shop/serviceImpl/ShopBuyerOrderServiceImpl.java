package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
import com.minshang.erp.modules.shop.dao.ShopBuyerOrderDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopBuyerOrder;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopBuyerOrderService;
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
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public ShopBuyerOrderDao getRepository() {
        return shopBuyerOrderDao;
    }

    @Override
    public ShopBuyerOrder saveShopBuyerOrder(ShopBuyerOrder shopBuyerOrder) {
        ShopUnit shopUnit = shopUnitService.get(shopBuyerOrder.getShopUnitId());
        Organization organization = organizationService.get(shopBuyerOrder.getOrgId());
        shopBuyerOrder.setOrgName(organization.getOrgName());
        shopBuyerOrder.setShopUnitName(shopUnit.getShopUnitName());
        shopBuyerOrder.setDocumentNum(shopBuyerOrder.getDocumentNum());
        shopBuyerOrder.setIndentNum(shopBuyerOrder.getIndentNum());
        shopBuyerOrder.setTotalDelivered(shopBuyerOrder.getTotalDelivered());
        return shopBuyerOrderDao.save(shopBuyerOrder);
    }

    @Override
    public ShopBuyerOrder editShopBuyerOrder(ShopBuyerOrder shopBuyerOrder) {
        ShopBuyerOrder shopBuyerOrderOne = shopBuyerOrderDao.getOne(shopBuyerOrder.getId());
        ShopUnit shopUnit = shopUnitDao.getOne(shopBuyerOrder.getShopUnitId());
        Organization organization = organizationDao.getOne(shopBuyerOrder.getOrgId());
        shopBuyerOrderOne.setOrgName(organization.getOrgName());
        shopBuyerOrderOne.setShopUnitName(shopUnit.getShopUnitName());
        shopBuyerOrderOne.setIndentNum(shopBuyerOrder.getIndentNum());
        shopBuyerOrderOne.setDocumentNum(shopBuyerOrder.getDocumentNum());
        shopBuyerOrderOne.setTotalDelivered(shopBuyerOrder.getTotalDelivered());
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