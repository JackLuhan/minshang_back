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

    List<Foods> findByFoodLibId(String foodLibId);

}