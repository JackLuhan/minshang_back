package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodSpec;
import com.minshang.erp.modules.food.entity.FoodType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品规格接口
 * @author 后羿i
 */
public interface FoodSpecService extends MinShangBaseService<FoodSpec,String> {
    /**
     * @Author 后羿i
     * @Description //TODO 分页查询
     * @Date
     * @Param
     * @Return
     **/
    Page<FoodSpec> findByCondition(FoodSpec foodSpec, SearchVo searchVo, Pageable pageable);

    //根据id修改菜品分类
    FoodSpec editFoodSpec(FoodSpec foodSpec);
}