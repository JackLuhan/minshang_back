package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodChargeType;
import com.minshang.erp.modules.food.entity.FoodChargeType;
import com.minshang.erp.modules.food.service.FoodChargeTypeService;
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
@Api(description = "菜品加料分类管理接口")
@RequestMapping("/minshang/foodChargeType")
@Transactional
public class FoodChargeTypeController extends MinShangBaseController<FoodChargeType, String>{

    @Resource
    private FoodChargeTypeService foodChargeTypeService;

    @Override
    public FoodChargeTypeService getService() {
        return foodChargeTypeService;
    }

    @RequestMapping(value = "/getFoodChargeTypeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品加料分类")
    public Result<Page<FoodChargeType>> getFoodLibList(@ModelAttribute FoodChargeType foodChargeType, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodChargeType> page = foodChargeTypeService.findByCondition(foodChargeType, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodChargeType>>().setData(page);
    }


}
