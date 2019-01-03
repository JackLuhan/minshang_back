package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;

import com.minshang.erp.modules.shop.entity.ShopStorage;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopStorageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.naming.Name;


/**
 * @author Y 。
 */
@Slf4j
@RestController
@Api(description = "门店仓库管理接口")
@RequestMapping("/minshang/shopStorage")
@CacheConfig(cacheNames = "shopStorage")
@Transactional
public class ShopStorageController extends MinShangBaseController<ShopStorage, String>{

    @Resource
    private ShopStorageService shopStorageService;

    @Override
    public ShopStorageService getService() {
        return shopStorageService;
    }
    @RequestMapping(value = "/getShopStorageByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取仓库")
    public Result<Page<ShopStorage>> getShopStorageList(@ModelAttribute ShopStorage shopStorage, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopStorage> page = shopStorageService.findByCondition(shopStorage, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopStorage>>().setData(page);
    }
    @RequestMapping(value = "/delById/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "通过id删除仓库数据")
    public Result<Object> delByIds(@PathVariable String id){
        //根据id 获取仓库
        ShopStorage shopStorage = shopStorageService.get(id);
        if(shopStorage==null){
            return new ResultUtil<>().setErrorMsg("仓库不存在");
        }
        shopStorageService.delete(id);
        return new ResultUtil<>().setSuccessMsg("通过id仓库删除数据成功");
    }
}
