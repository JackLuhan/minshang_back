package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopGoodsOrder;
import com.minshang.erp.modules.shop.service.ShopGoodsOrderService;
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
@Api(description = "门店物品订单管理接口")
@RequestMapping("/minshang/shopGoodsOrder")
@Transactional
public class ShopGoodsOrderController extends MinShangBaseController<ShopGoodsOrder, String>{

    @Resource
    private ShopGoodsOrderService shopGoodsOrderService;

    @Override
    public ShopGoodsOrderService getService() {
        return shopGoodsOrderService;
    }

    @RequestMapping(value = "/saveShopGoodsOrder",method = RequestMethod.POST)
    @ApiOperation(value = "添加门店物品订单")
    public Result<Object> saveShopGoodsOrder(@ModelAttribute ShopGoodsOrder shopGoodsOrder){
        if(shopGoodsOrderService.saveShopGoodsOrder(shopGoodsOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("添加门店物品订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加门店物品订单失败");
        }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改门店物品订单")
    public Result<Object> editShopGoodsOrder(@ModelAttribute ShopGoodsOrder shopGoodsOrder){
        if(shopGoodsOrderService.editShopGoodsOrder(shopGoodsOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("修改门店物品订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改门店物品订单失败");
        }
    }

    @RequestMapping(value = "/getShopGoodsByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取门店物品订单")
    public Result<Page<ShopGoodsOrder>> getShopGoodsOrderList(@ModelAttribute ShopGoodsOrder shopGoodsOrder, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopGoodsOrder> page = shopGoodsOrderService.findByCondition(shopGoodsOrder, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopGoodsOrder>>().setData(page);
    }
}
