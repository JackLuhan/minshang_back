package com.minshang.erp.modules.food.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.food.entity.Foods;

import java.util.List;

/**
 * 菜品数据处理层
 * @author 后羿i
 */
public interface FoodsDao extends MinShangBaseDao<Foods,String> {

    /**
     * 通过层级查找
     * 默认升序
     * @param level
     * @return
     */
    List<Foods> findByLevelAndFoodLibId(Integer level,String foodLibId);

    /**
     * 通过parendId查找
     * @param parentId
     * @return
     */
    List<Foods> findByParentId(String parentId);

    /**
     * @Author 后羿i
     * @Description  通过菜品库id查询
     * @Date  15:33
     * @Param [foodLibId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    List<Foods> findByFoodLibId(String foodLibId);

    /**
     * @Author 后羿i
     * @Description 根据菜品库id和菜品规格id查询属于该规格下的菜品数据
     * @Date  16:24
     * @Param [foodLibId, foodSpecId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    List<Foods> findByFoodLibIdAndFoodSpecId(String foodLibId,String foodSpecId);

}