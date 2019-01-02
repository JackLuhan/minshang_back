package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodSpec;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodSpecService;
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
@Api(description = "菜品规格管理接口")
@RequestMapping("/minshang/foodSpec")
@Transactional
public class FoodSpecController extends MinShangBaseController<FoodSpec, String>{

    @Resource
    private FoodSpecService foodSpecService;

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

}
