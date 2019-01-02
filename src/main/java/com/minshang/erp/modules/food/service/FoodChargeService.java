package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodCharge;
import com.minshang.erp.modules.food.entity.FoodCharge;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜品加料接口
 * @author 后羿i
 */
public interface FoodChargeService extends MinShangBaseService<FoodCharge,String> {
    /**
     * @Author 后羿i
     * @Description //TODO 根据条件分页查询菜品加料
     * @Date  10:05
     * @Param [foodPractice, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.FoodCharge>
     **/
    Page<FoodCharge> findByCondition(FoodCharge foodPractice, SearchVo searchVo, Pageable pageable);

}