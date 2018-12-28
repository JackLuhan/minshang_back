package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 菜品库接口
 * @author 后羿i
 */
public interface FoodLibService extends MinShangBaseService<FoodLib,String> {
    /**
     * @Author 后羿i
     * @Description //TODO 分页查询
     * @Date
     * @Param
     * @Return
     **/
    Page<FoodLib> findByCondition(FoodLib foodLib, SearchVo searchVo, Pageable pageable);
    //根据id 更新状态
    FoodLib updateById(FoodLib foodLib);
}