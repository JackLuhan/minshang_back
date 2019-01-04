package com.minshang.erp.modules.shop.service;


import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 门店物品单位接口
 * @author 后羿i
 */
public interface ShopUnitService extends MinShangBaseService<ShopUnit,String> {

    Page<ShopUnit> findByCondition(ShopUnit shopUnit, SearchVo searchVo, Pageable pageable);

}