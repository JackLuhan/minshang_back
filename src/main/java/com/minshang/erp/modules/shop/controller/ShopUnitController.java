package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.mapper.ShopUnitMapper;
import com.minshang.erp.modules.shop.service.IShopUnitService;
import com.minshang.erp.modules.shop.service.ShopUnitService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.transaction.Transactional;

/**
 * @ClassName ShopUnitController
 * @Description 物品单位前端控制器
 * @Author 后羿i
 * @Date 2018/12/27
 * @Version 1.0
 **/
@RestController
@Api(description = "物品单位接口")
@RequestMapping("/minshang/shopUnit")
@CacheConfig(cacheNames = "shopUnit")
@Transactional
public class ShopUnitController  {

    @Resource
    private ShopUnitMapper shopUnitMapper;
    @Resource
    private IShopUnitService iShopUnitService;
    @Resource
    private ShopUnitService shopUnitService;


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ApiOperation(value = "保存物品单位")
    public Result<Object> saveShopUnit(@ModelAttribute ShopUnit shopUnit) {
        shopUnitService.save(shopUnit);
        return new ResultUtil<>().setSuccessMsg("添加物品单位成功");
    }

    @RequestMapping(value = "/delById/{id}",method = RequestMethod.POST)
    @ApiOperation(value = "通过id删除物品单位数据")
    public Result<Object> delByIds(@PathVariable("id") String id){
        //根据id 获取食品库
        ShopUnit shopUnit = shopUnitService.get(id);
        if(shopUnit==null){
            return new ResultUtil<>().setErrorMsg("物品单位不存在");
        }
        iShopUnitService.deleteById(id);
        return new ResultUtil<>().setSuccessMsg("通过id删除物品单位数据成功");
    }


    @RequestMapping(value = "/getShopUnitUnitByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取物品单位")
    public Result<Page<ShopUnit>> getFoodLibList(@ModelAttribute ShopUnit shopUnit, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopUnit> page = shopUnitService.findByCondition(shopUnit, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopUnit>>().setData(page);
    }




}