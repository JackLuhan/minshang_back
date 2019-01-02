package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodChargeType;
import com.minshang.erp.modules.food.entity.FoodPractice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品加料分类接口
 * @author 后羿i
 */
public interface FoodChargeTypeService extends MinShangBaseService<FoodChargeType,String> {
    /**
     * @Author 后羿i
     * @Description //TODO 根据条件分页查询菜品加料分类
     * @Date  9:42
     * @Param [foodChargeType, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.FoodChargeType>
     **/
    Page<FoodChargeType> findByCondition(FoodChargeType foodChargeType, SearchVo searchVo, Pageable pageable);

}