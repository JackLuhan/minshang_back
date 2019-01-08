package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.food.entity.Foods;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品接口
 * @author 后羿i
 */
public interface FoodsService extends MinShangBaseService<Foods,String> {
    /**
     * @Author 后羿i
     * @Description 保存菜品
     * @Date  14:41
     * @Param [foods]
     * @Return com.minshang.erp.modules.food.entity.Foods
     **/
    Foods saveFoods(Foods foods);

    /**
     * @Author 后羿i
     * @Description 修改菜品
     * @Date  14:49
     * @Param [food]
     * @Return com.minshang.erp.modules.food.entity.Food
     **/
    Foods editFoods(Foods foods);

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
     * @Description 通过菜品库id查询
     * @Date  15:31
     * @Param [foodLibId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    List<Foods> findByFoodLibId(String foodLibId);

    /**
     * @Author 后羿i
     * @Description 根据菜品库id和菜品规格id查询属于该规格下的菜品数据
     * @Date  15:31
     * @Param [foodLibId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    List<Foods> findByFoodLibIdAndFoodSpecId(String foodLibId,String foodSpecId);


    /*Page<Foods> findByLevel(Integer level);
    Page<Foods> findByParentId(String parentId);*/

    /**
     * @Author 后羿i
     * @Description 根据条件分页查询
     * @Date  13:41
     * @Param [food, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.Food>
     **/
    Page<Foods> findByCondition(Foods foods, SearchVo searchVo, Pageable pageable);

}