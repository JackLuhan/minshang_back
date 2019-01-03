package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Foods;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品接口
 * @author 后羿i
 */
public interface FoodsService extends MinShangBaseService<Foods,String> {
    Foods saveFoods(Foods foods);

    /**
     * 通过层级查找
     * 默认升序
     * @param level
     * @return
     */
    List<Foods> findByLevel(Integer level);

    /**
     * 通过parendId查找
     * @param parentId
     * @return
     */
    List<Foods> findByParentId(String parentId);
}