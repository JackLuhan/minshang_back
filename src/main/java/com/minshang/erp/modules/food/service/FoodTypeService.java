package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.food.entity.FoodType;

/**
 * 菜品分类接口
 * @author 后羿i
 */
public interface FoodTypeService extends MinShangBaseService<FoodType,String> {

    //根据id修改菜品分类
    FoodType editFoodType(FoodType foodType);
}