package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.service.FoodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品管理接口")
@RequestMapping("/minshang/food")
@Transactional
public class FoodController extends MinShangBaseController<Food, String>{

    @Resource
    private FoodService foodService;

    @Override
    public FoodService getService() {
        return foodService;
    }

    @RequestMapping(value = "/saveFood",method = RequestMethod.POST)
    @ApiOperation(value = "添加菜品")
    public Result<Object> saveFood(@ModelAttribute Food food){
        if(foodService.saveFood(food) !=null){
            return new ResultUtil<>().setSuccessMsg("添加菜品成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加菜品失败");
        }
    }

    @RequestMapping(value = "/editFood",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品")
    public Result<Object> editFood(@ModelAttribute Food food){
        if(foodService.editFood(food) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品失败");
        }
    }

    @RequestMapping(value = "/getFoodByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品")
    public Result<Page<Food>> getFoodLibList(@ModelAttribute Food food, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<Food> page = foodService.findByCondition(food, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<Food>>().setData(page);
    }

    /*@RequestMapping(value = "/getFoodByFoodTypeId", method = RequestMethod.POST)
    @ApiOperation(value = "根据菜品分类id分页获取菜品")
    public Result<Page<Food>> getFoodByFoodTypeId(@ModelAttribute Food food, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        String foodTypeId = food.getFoodTypeId();
        Page<Food> page = foodService.findByFoodTypeId(foodTypeId, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<Food>>().setData(page);
    }*/

}
