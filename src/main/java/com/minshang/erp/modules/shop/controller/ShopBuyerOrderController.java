package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopBuyerOrder;
import com.minshang.erp.modules.shop.service.ShopBuyerOrderService;
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
@Api(description = "门店采购订单管理接口")
@RequestMapping("/minshang/shopBuyerOrder")
@Transactional
public class ShopBuyerOrderController extends MinShangBaseController<ShopBuyerOrder, String>{

    @Resource
    private ShopBuyerOrderService shopBuyerOrderService;

    @Override
    public ShopBuyerOrderService getService() {
        return shopBuyerOrderService;
    }

    @RequestMapping(value = "/saveShopBuyerOrder",method = RequestMethod.POST)
    @ApiOperation(value = "添加门店物品订单")
    public Result<Object> saveShopBuyerOrder(@ModelAttribute ShopBuyerOrder shopBuyerOrder){
        if(shopBuyerOrderService.saveShopBuyerOrder(shopBuyerOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("添加门店采购订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加门店采购订单失败");
        }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改门店采购订单")
    public Result<Object> editShopBuyerOrder(@ModelAttribute ShopBuyerOrder shopBuyerOrder){
        if(shopBuyerOrderService.editShopBuyerOrder(shopBuyerOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("修改门店采购订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改门店采购订单失败");
        }
    }
    @RequestMapping(value = "/getShopBuyerOrderByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取门店采购订单")
    public Result<Page<ShopBuyerOrder>> getShopBuyerOrderList(@ModelAttribute ShopBuyerOrder shopBuyerOrder, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopBuyerOrder> page = shopBuyerOrderService.findByCondition(shopBuyerOrder, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopBuyerOrder>>().setData(page);
    }
}
