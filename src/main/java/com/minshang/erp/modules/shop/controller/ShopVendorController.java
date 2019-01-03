package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import com.minshang.erp.modules.shop.service.ShopVendorService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * @author Y 。
 */
@Slf4j
@RestController
@Api(description = "门店供应商管理接口")
@RequestMapping("/minshang/shopVendor")
@Transactional
public class ShopVendorController extends MinShangBaseController<ShopVendor, String>{

    @Resource
    private ShopVendorService shopVendorService;

    @Override
    public ShopVendorService getService() {
        return shopVendorService;
    }
    @RequestMapping(value = "/getShopVendorByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取仓库")
    public Result<Page<ShopVendor>> getShopVendorList(@ModelAttribute ShopVendor shopVendor, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopVendor> page = shopVendorService.findByCondition(shopVendor, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopVendor>>().setData(page);
    }
}
