package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopGoodsOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 门店物品订单接口
 * @author Y。
 */
public interface ShopGoodsOrderService extends MinShangBaseService<ShopGoodsOrder,String> {
    //门店物品订单保存
    ShopGoodsOrder saveShopGoodsOrder(ShopGoodsOrder shopGoodsOrder);
    //门店物品订单修改
    ShopGoodsOrder editShopGoodsOrder(ShopGoodsOrder shopGoodsOrder);
    //多条件分页获取
    Page<ShopGoodsOrder> findByCondition(ShopGoodsOrder shopGoodsOrder, SearchVo searchVo, Pageable pageable);

}