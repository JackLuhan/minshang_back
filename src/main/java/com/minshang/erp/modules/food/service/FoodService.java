package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Food;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品接口
 * @author 后羿i
 */
public interface FoodService extends MinShangBaseService<Food,String> {
    /**
     * @Author 后羿i
     * @Description 根据条件分页查询 
     * @Date  13:41 
     * @Param [food, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.Food>
     **/
    Page<Food> findByCondition(Food food, SearchVo searchVo, Pageable pageable);

    /**
     * @Author 后羿i
     * @Description //TODO 保存菜品
     * @Date  13:42
     * @Param [food]
     * @Return com.minshang.erp.modules.food.entity.Food
     **/
    Food saveFood(Food food);

    /**
     * @Author 后羿i
     * @Description //TODO 修改菜品
     * @Date  14:49
     * @Param [food]
     * @Return com.minshang.erp.modules.food.entity.Food
     **/
    Food editFood(Food food);

    List<Food> findByFoodTypeId(String foodTypeId);

}