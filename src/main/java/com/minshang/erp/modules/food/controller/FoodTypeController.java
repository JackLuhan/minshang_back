package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品分类管理接口")
@RequestMapping("/minshang/foodType")
@Transactional
public class FoodTypeController extends MinShangBaseController<FoodType, String> {

    private final FoodTypeService foodTypeService;

    @Autowired
    public FoodTypeController(FoodTypeService foodTypeService) {
        this.foodTypeService = foodTypeService;
    }

    @Override
    public FoodTypeService getService() {
        return foodTypeService;
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品分类")
    public Result<Object> updateStatus(@ModelAttribute FoodType foodType){
        if(foodTypeService.editFoodType(foodType) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品分类成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品分类失败");
        }
    }



}
