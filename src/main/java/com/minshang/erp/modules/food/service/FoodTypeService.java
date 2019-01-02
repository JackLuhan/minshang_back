package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.entity.FoodType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 菜品分类接口
 * @author 后羿i
 */
public interface FoodTypeService extends MinShangBaseService<FoodType,String> {

    //根据id修改菜品分类
    FoodType editFoodType(FoodType foodType);

    /**
     * @Author 后羿i
     * @Description //TODO 分页查询
     * @Date
     * @Param
     * @Return
     **/
    Page<FoodType> findByCondition(FoodType foodType, SearchVo searchVo, Pageable pageable);
}