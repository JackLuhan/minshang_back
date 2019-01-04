package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.shop.entity.ShopGoods;

/**
 * 原材料接口
 * @author Y。
 */
public interface ShopGoodsService extends MinShangBaseService<ShopGoods,String> {

    ShopGoods saveShopGoods(ShopGoods shopGoods);
}