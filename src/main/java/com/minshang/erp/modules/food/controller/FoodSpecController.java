package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodSpec;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodSpecService;
import com.minshang.erp.modules.food.service.FoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品规格管理接口")
@RequestMapping("/minshang/foodSpec")
@Transactional
public class FoodSpecController extends MinShangBaseController<FoodSpec, String>{

    @Resource
    private FoodSpecService foodSpecService;
    @Resource
    private FoodsService foodsService;

    @Override
    public FoodSpecService getService() {
        return foodSpecService;
    }

    @RequestMapping(value = "/getFoodSpecByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品规格")
    public Result<Page<FoodSpec>> getFoodLibList(@ModelAttribute FoodSpec foodSpec, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodSpec> page = foodSpecService.findByCondition(foodSpec, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodSpec>>().setData(page);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品规格")
    public Result<Object> updateStatus(@ModelAttribute FoodSpec foodSpec){
        if(foodSpecService.editFoodSpec(foodSpec) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品规格成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品规格失败");
        }
    }

    @RequestMapping(value = "/getAllFoodsList/{foodLibId}/{foodSpecId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过菜品库id获取全部菜品")
    public Result<List<Foods>> getAllFoodsList(@PathVariable String foodLibId,@PathVariable String foodSpecId){

        List<Foods> foodsList = foodsService.findByFoodLibIdAndFoodSpecId(foodLibId,foodSpecId);
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

}
