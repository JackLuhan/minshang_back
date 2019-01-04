package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.food.entity.FoodCombo;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodComboService;
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
