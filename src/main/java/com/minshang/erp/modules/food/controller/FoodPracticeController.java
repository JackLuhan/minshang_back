package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodPractice;
import com.minshang.erp.modules.food.service.FoodPracticeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品做法管理接口")
@RequestMapping("/minshang/foodPractice")
@Transactional
public class FoodPracticeController extends MinShangBaseController<FoodPractice, String>{

    @Resource
    private FoodPracticeService foodPracticeService;

    @Override
    public FoodPracticeService getService() {
        return foodPracticeService;
    }

    @RequestMapping(value = "/getFoodPracticeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品做法")
    public Result<Page<FoodPractice>> getFoodPracticeList(@ModelAttribute FoodPractice foodPractice, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodPractice> page = foodPracticeService.findByCondition(foodPractice, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodPractice>>().setData(page);
    }


    @RequestMapping(value = "/saveFoodPractice",method = RequestMethod.POST)
    @ApiOperation(value = "添加菜品做法")
    public Result<Object> updateStatus(@ModelAttribute FoodPractice foodPractice){
        if(foodPracticeService.saveFoodPractice(foodPractice) !=null){
            return new ResultUtil<>().setSuccessMsg("添加菜品做法成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加菜品做法失败");
        }
    }

}
