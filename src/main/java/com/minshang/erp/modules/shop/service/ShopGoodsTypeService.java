package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopGoodsType;
import com.minshang.erp.modules.shop.entity.ShopStorage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 物品类别接口
 * @author Y 。
 */
public interface ShopGoodsTypeService extends MinShangBaseService<ShopGoodsType,String> {
    Page<ShopGoodsType> findByCondition(ShopGoodsType shopGoodsType, SearchVo searchVo, Pageable pageable);
}