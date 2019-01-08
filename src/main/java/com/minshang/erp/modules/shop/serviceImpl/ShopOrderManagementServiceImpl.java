package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.dao.ShopGoodsDao;
import com.minshang.erp.modules.shop.dao.ShopOrderManagementDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopGoods;
import com.minshang.erp.modules.shop.entity.ShopOrderManagement;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopGoodsService;
import com.minshang.erp.modules.shop.service.ShopOrderManagementService;
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
 * 门店订单管理接口实现
 * @author Y。
 */
@Slf4j
@Service
@Transactional
public class ShopOrderManagementServiceImpl implements ShopOrderManagementService {

    @Autowired
    private ShopOrderManagementDao shopOrderManagementDao;
    @Autowired
    private ShopGoodsDao shopGoodsDao;
    @Autowired
    private ShopGoodsService shopGoodsService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopOrderManagementService shopOrderManagementService;
    @Override
    public ShopOrderManagementDao getRepository() {
        return shopOrderManagementDao;
    }

    @Override
    public ShopOrderManagement saveShopOrderManagement(ShopOrderManagement shopOrderManagement) {
        ShopUnit shopUnit = shopUnitService.get(shopOrderManagement.getShopUnitId());
        ShopGoods shopGoods = shopGoodsService.get(shopOrderManagement.getShopGoodsId());
        shopOrderManagement.setGoodsName(shopGoods.getGoodsName());
        shopOrderManagement.setGoodsCode(shopGoods.getGoodsCode());
        shopOrderManagement.setGoodsPrice(shopGoods.getGoodsPrice());
        shopOrderManagement.setShopUnitName(shopUnit.getShopUnitName());
        shopOrderManagement.setDeliveryAmount(shopOrderManagement.getDeliveryAmount());
        shopOrderManagement.setHeadquartersRemark(shopOrderManagement.getHeadquartersRemark());
        shopOrderManagement.setIndentNum(shopOrderManagement.getIndentNum());
        shopOrderManagement.setQuantityShipped(shopOrderManagement.getQuantityShipped());
        shopOrderManagement.setShopRemark(shopOrderManagement.getShopRemark());
        return shopOrderManagementDao.save(shopOrderManagement);
    }

    @Override
    public ShopOrderManagement editShopOrderManagement(ShopOrderManagement shopOrderManagement) {
        ShopOrderManagement shopOrderManagementOne = shopOrderManagementDao.getOne(shopOrderManagement.getId());
        ShopUnit shopUnit = shopUnitDao.getOne(shopOrderManagement.getShopUnitId());
        ShopGoods shopGoods = shopGoodsDao.getOne(shopOrderManagement.getShopGoodsId());
        shopOrderManagementOne.setGoodsName(shopGoods.getGoodsName());
        shopOrderManagementOne.setGoodsCode(shopGoods.getGoodsCode());
        shopOrderManagementOne.setGoodsPrice(shopGoods.getGoodsPrice());
        shopOrderManagementOne.setShopUnitName(shopUnit.getShopUnitName());
        shopOrderManagementOne.setShopRemark(shopOrderManagement.getShopRemark());
        shopOrderManagementOne.setHeadquartersRemark(shopOrderManagement.getHeadquartersRemark());
        shopOrderManagementOne.setQuantityShipped(shopOrderManagement.getQuantityShipped());
        shopOrderManagementOne.setIndentNum(shopOrderManagement.getIndentNum());
        shopOrderManagementOne.setDeliveryAmount(shopOrderManagement.getDeliveryAmount());
        return shopOrderManagementService.update(shopOrderManagementOne);
    }

    @Override
    public Page<ShopOrderManagement> findByCondition(ShopOrderManagement shopOrderManagement, SearchVo searchVo, Pageable pageable) {
        return shopOrderManagementDao.findAll(new Specification<ShopOrderManagement>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopOrderManagement> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据原材料名字查询
                Path<String> nameField = root.get("goodsName");
                //根据原材料名字查询
                Path<String> codeField = root.get("goodsCode");

                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(shopOrderManagement.getGoodsName())) {
                    list.add(cb.like(nameField, '%' + shopOrderManagement.getGoodsName() + '%'));
                }
                //根据原材料编码搜索
                if(StrUtil.isNotBlank(shopOrderManagement.getGoodsCode())) {
                    list.add(cb.like(nameField, '%' + shopOrderManagement.getGoodsCode() + '%'));
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