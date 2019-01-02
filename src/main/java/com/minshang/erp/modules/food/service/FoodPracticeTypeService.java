package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodPractice;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品做法分类接口
 * @author 后羿i
 */
public interface FoodPracticeTypeService extends MinShangBaseService<FoodPracticeType,String> {
    /**
     * @Author 后羿i
     * @Description //TODO 分页查询
     * @Date
     * @Param
     * @Return
     **/
    Page<FoodPracticeType> findByCondition(FoodPracticeType foodPracticeType, SearchVo searchVo, Pageable pageable);
    //添加菜品做法
    FoodPracticeType editFoodPracticeType(FoodPracticeType foodPracticeType);

}