package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.modules.food.entity.FoodCombo;
import com.minshang.erp.modules.food.service.FoodComboService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品套餐管理接口")
@RequestMapping("/minshang/foodCombo")
@Transactional
public class FoodComboController extends MinShangBaseController<FoodCombo, String>{

    @Resource
    private FoodComboService foodComboService;

    @Override
    public FoodComboService getService() {
        return foodComboService;
    }

}
