package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopBuyerStat;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 门店采购统计接口
 * @author Y。
 */
public interface ShopBuyerStatService extends MinShangBaseService<ShopBuyerStat,String> {
    //添加采购统计
    ShopBuyerStat saveShopBuyerStat(ShopBuyerStat shopBuyerStat);
    //修改采购
    ShopBuyerStat editShopBuyerStat(ShopBuyerStat shopBuyerStat);
    //多条件查询分页
    Page<ShopBuyerStat> findByCondition(ShopBuyerStat shopBuyerStat, SearchVo searchVo, Pageable pageable);
}