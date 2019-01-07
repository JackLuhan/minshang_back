package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品管理接口")
@RequestMapping("/minshang/foods")
@Transactional
public class FoodsController extends MinShangBaseController<Foods, String>{

    @Resource
    private FoodsService foodsService;

    @Override
    public FoodsService getService() {
        return foodsService;
    }

    @RequestMapping(value = "/saveFoods",method = RequestMethod.POST)
    @ApiOperation(value = "添加菜品")
    public Result<Foods> saveFood(@ModelAttribute Foods foods){

        Foods food = foodsService.saveFoods(foods);
        return new ResultUtil<Foods>().setData(food);
    }

    @RequestMapping(value = "/editFoods",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品")
    public Result<Object> editFoods(@ModelAttribute Foods foods){
        if(foodsService.editFoods(foods) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品失败");
        }
    }

    @RequestMapping(value = "/getAllFoodsList/{foodLibId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过菜品库id获取全部菜品")
    public Result<List<Foods>> getAllFoodsList(@PathVariable String foodLibId){

        List<Foods> foodsList = foodsService.findByFoodLibId(foodLibId);
        for (Foods foods : foodsList) {
            Integer level = foods.getLevel();
            if (level.equals(CommonConstant.LEVEL_ONE)){
                // 一级
                List<Foods> list = foodsService.findByLevelAndFoodLibId(foods.getLevel(),foodLibId);
                // 二级
                for(Foods p1 : list){
                    List<Foods> children1 = foodsService.findByParentId(p1.getId());
                    p1.setChildren(children1);
                    // 三级
                    for(Foods p2 : children1){
                        List<Foods> children2 = foodsService.findByParentId(p2.getId());
                        p2.setChildren(children2);
                    }
                }
                return new ResultUtil<List<Foods>>().setData(list);
            }
        }
        return new ResultUtil<List<Foods>>().setErrorMsg(200,"未知错误");
    }


    @RequestMapping(value = "/getAllFoodsListByPage",method = RequestMethod.GET)
    @ApiOperation(value = "根据父id获取分页获取全部菜品")
    public Result<Page<Foods>> getAllFoodsListByPage(@ModelAttribute Foods foods, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        List<Foods> foodsList = foodsService.findByParentId(foods.getParentId());
        for (Foods foods1 : foodsList) {
            if (!foods1.getLevel().equals(CommonConstant.LEVEL_ONE) ){
                Page<Foods> page = foodsService.findByCondition(foods, searchVo, PageUtil.initPage(pageVo));
                return new ResultUtil<Page<Foods>>().setData(page);
            }
        }
        return new ResultUtil<Page<Foods>>().setErrorMsg("请传递正确的父id");
    }
}
