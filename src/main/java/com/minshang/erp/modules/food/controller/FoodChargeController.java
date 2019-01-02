package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodCharge;
import com.minshang.erp.modules.food.entity.FoodCharge;
import com.minshang.erp.modules.food.service.FoodChargeService;
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
@Api(description = "菜品加料管理接口")
@RequestMapping("/minshang/foodCharge")
@Transactional
public class FoodChargeController extends MinShangBaseController<FoodCharge, String>{

    @Resource
    private FoodChargeService foodChargeService;

    @Override
    public FoodChargeService getService() {
        return foodChargeService;
    }

    @RequestMapping(value = "/getFoodChargeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品加料")
    public Result<Page<FoodCharge>> getFoodChargeList(@ModelAttribute FoodCharge foodCharge, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodCharge> page = foodChargeService.findByCondition(foodCharge, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodCharge>>().setData(page);
    }

}
