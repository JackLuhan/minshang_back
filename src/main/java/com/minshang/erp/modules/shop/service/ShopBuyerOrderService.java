package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopBuyerOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 门店采购订单接口
 * @author Y。
 */
public interface ShopBuyerOrderService extends MinShangBaseService<ShopBuyerOrder,String> {
    //采购订单保存
    ShopBuyerOrder saveShopBuyerOrder(ShopBuyerOrder shopBuyerOrder);
    //采购订单修改
    ShopBuyerOrder editShopBuyerOrder(ShopBuyerOrder shopBuyerOrder);
    //多条件分页获取
    Page<ShopBuyerOrder>findByCondition(ShopBuyerOrder shopBuyerOrder, SearchVo searchVo, Pageable pageable);

}