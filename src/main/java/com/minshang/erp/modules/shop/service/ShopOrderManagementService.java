package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopOrderManagement;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 门店订单管理接口
 * @author Y。
 */
public interface ShopOrderManagementService extends MinShangBaseService<ShopOrderManagement,String> {
    //保存订单
    ShopOrderManagement saveShopOrderManagement(ShopOrderManagement shopOrderManagement);
    //根据id修改订单
    ShopOrderManagement editShopOrderManagement(ShopOrderManagement shopOrderManagement);
    //分页
    Page<ShopOrderManagement> findByCondition(ShopOrderManagement shopOrderManagement, SearchVo searchVo, Pageable pageable);
}