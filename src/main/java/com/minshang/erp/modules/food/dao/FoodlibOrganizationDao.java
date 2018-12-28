package com.minshang.erp.modules.food.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.food.entity.FoodlibOrganization;

/**
 * 菜品库机构表数据处理层
 * @author 后羿i
 */
public interface FoodlibOrganizationDao extends MinShangBaseDao<FoodlibOrganization,String> {

     FoodlibOrganization findByFoodLibId(String foodLibId);
}