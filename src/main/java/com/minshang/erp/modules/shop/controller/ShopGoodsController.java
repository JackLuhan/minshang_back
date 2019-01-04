package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.shop.entity.ShopGoods;
import com.minshang.erp.modules.shop.service.ShopGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author Y。
 */
@Slf4j
@RestController
@Api(description = "原材料管理接口")
@RequestMapping("/minshang/shopGoods")
@Transactional
public class ShopGoodsController extends MinShangBaseController<ShopGoods, String>{

    @Resource
    private ShopGoodsService shopGoodsService;

    @Override
    public ShopGoodsService getService() {
        return shopGoodsService;
    }

    @RequestMapping(value = "/saveShopGoods",method = RequestMethod.POST)
    @ApiOperation(value = "添加菜品")
    public Result<Object> saveShopGoods(@ModelAttribute ShopGoods shopGoods){
        if(shopGoodsService.saveShopGoods(shopGoods) !=null){
            return new ResultUtil<>().setSuccessMsg("添加菜品成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加菜品失败");
        }
    }

}
