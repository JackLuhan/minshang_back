package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopOrderManagement;
import com.minshang.erp.modules.shop.service.ShopOrderManagementService;
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
 * @author Y。
 */
@Slf4j
@RestController
@Api(description = "门店订单管理管理接口")
@RequestMapping("/minshang/shopOrderManagement")
@Transactional
public class ShopOrderManagementController extends MinShangBaseController<ShopOrderManagement, String>{

    @Resource
    private ShopOrderManagementService shopOrderManagementService;

    @Override
    public ShopOrderManagementService getService() {
        return shopOrderManagementService;
    }


    @RequestMapping(value = "/saveShopOrder",method = RequestMethod.POST)
    @ApiOperation(value = "添加订单")
    public Result<Object> saveShopOrder(@ModelAttribute ShopOrderManagement shopOrderManagement){
        if(shopOrderManagementService.saveShopOrderManagement(shopOrderManagement) !=null){
            return new ResultUtil<>().setSuccessMsg("添加订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加订单失败");
        }
    }


    @RequestMapping(value = "/editShopOrder",method = RequestMethod.POST)
    @ApiOperation(value = "修改原材料物品")
    public Result<Object> editShopOrder(@ModelAttribute ShopOrderManagement shopOrderManagement){
        if(shopOrderManagementService.editShopOrderManagement(shopOrderManagement) !=null){
            return new ResultUtil<>().setSuccessMsg("修改订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改订单失败");
        }
    }


    @RequestMapping(value = "/getShopOrderByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取原材料")
    public Result<Page<ShopOrderManagement>> getShopOrdrtList(@ModelAttribute ShopOrderManagement shopOrderManagement, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopOrderManagement> page = shopOrderManagementService.findByCondition(shopOrderManagement, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopOrderManagement>>().setData(page);
    }


}

