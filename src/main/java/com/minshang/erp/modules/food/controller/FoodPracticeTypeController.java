package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.service.FoodPracticeTypeService;
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
@Api(description = "菜品做法分类管理接口")
@RequestMapping("/minshang/foodPracticeType")
@Transactional
public class FoodPracticeTypeController extends MinShangBaseController<FoodPracticeType, String>{

    @Resource
    private FoodPracticeTypeService foodPracticeTypeService;

    @Override
    public FoodPracticeTypeService getService() {
        return foodPracticeTypeService;
    }

    @RequestMapping(value = "/getFoodPracticeTypeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品做法")
    public Result<Page<FoodPracticeType>> getFoodLibList(@ModelAttribute FoodPracticeType foodPracticeType, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodPracticeType> page = foodPracticeTypeService.findByCondition(foodPracticeType, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodPracticeType>>().setData(page);
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品做法")
    public Result<Object> updateStatus(@ModelAttribute FoodPracticeType foodPracticeType){
        if(foodPracticeTypeService.editFoodPracticeType(foodPracticeType) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品做法成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品做法失败");
        }
    }
}
