package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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

    @RequestMapping(value = "/getAllList",method = RequestMethod.GET)
    @ApiOperation(value = "获取权限菜单树")
    public Result<List<Foods>> getAllList(){

        // 一级
        List<Foods> list = foodsService.findByLevel(CommonConstant.LEVEL_ONE);
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
