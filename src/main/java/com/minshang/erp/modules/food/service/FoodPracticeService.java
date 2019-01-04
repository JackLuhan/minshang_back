package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodPractice;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品做法接口
 * @author 后羿i
 */
public interface FoodPracticeService extends MinShangBaseService<FoodPractice,String> {
    /**
     * @Author 后羿i
     * @Description 分页查询
     * @Date
     * @Param
     * @Return
     **/
    Page<FoodPractice> findByCondition(FoodPractice foodPractice, SearchVo searchVo, Pageable pageable);
    //添加菜品做法
    FoodPractice saveFoodPractice(FoodPractice foodPractice);

}