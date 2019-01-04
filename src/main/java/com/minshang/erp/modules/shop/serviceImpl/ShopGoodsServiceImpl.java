package com.minshang.erp.modules.shop.serviceImpl;

import com.minshang.erp.modules.shop.dao.ShopGoodsDao;
import com.minshang.erp.modules.shop.entity.ShopGoods;
import com.minshang.erp.modules.shop.entity.ShopGoodsType;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopGoodsService;
import com.minshang.erp.modules.shop.service.ShopGoodsTypeService;
import com.minshang.erp.modules.shop.service.ShopUnitService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 原材料接口实现
 * @author Y。
 */
@Slf4j
@Service
@Transactional
public class ShopGoodsServiceImpl implements ShopGoodsService {

    @Autowired
    private ShopGoodsDao shopGoodsDao;
    @Autowired
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopGoodsTypeService shopGoodsTypeService;

    @Override
    public ShopGoodsDao getRepository() {
        return shopGoodsDao;
    }

    @Override
    public ShopGoods saveShopGoods(ShopGoods shopGoods) {
        ShopUnit shopUnit = shopUnitService.get(shopGoods.getShopUnitId());
        ShopGoodsType shopGoodsType = shopGoodsTypeService.get(shopGoods.getShopGoodsTypeId());
//        ShopGoods shopGoodsOne = shopGoodsDao.getOne(shopGoods.getId());
        shopGoods.setGoodsTypeName(shopGoodsType.getGoodsTypeName());
        shopGoods.setShopUnitName(shopUnit.getShopUnitName());
        shopGoods.setGoodsName(shopGoods.getGoodsName());
        shopGoods.setCheckType(shopGoods.getCheckType());
        shopGoods.setGoodsCode(shopGoods.getGoodsCode());
        shopGoods.setGoodsPrice(shopGoods.getGoodsPrice());
        shopGoods.setHeadquartersMinimumInventory(shopGoods.getHeadquartersMinimumInventory());
        shopGoods.setHeadquartersHighestInventory(shopGoods.getHeadquartersHighestInventory());
        shopGoods.setOrderType(shopGoods.getOrderType());
        return shopGoodsDao.save(shopGoods);

    }
}