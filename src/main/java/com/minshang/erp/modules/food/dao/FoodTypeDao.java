package com.minshang.erp.modules.food.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.food.entity.FoodType;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 菜品分类数据处理层
 * @author 后羿i
 */
public interface FoodTypeDao extends MinShangBaseDao<FoodType,String> {

}