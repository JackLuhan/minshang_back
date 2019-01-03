package com.minshang.erp.modules.food.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.food.entity.Food;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * 菜品数据处理层
 * @author 后羿i
 */
public interface FoodDao extends MinShangBaseDao<Food,String> {

    @Query(value = "select f from Food f where f.foodTypeId =?1")
    List<Food> foodList(String foodTypeId);

}