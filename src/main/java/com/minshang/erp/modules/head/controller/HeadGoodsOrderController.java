package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadGoodsOrder;
import com.minshang.erp.modules.head.service.HeadGoodsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author lcmaijia
 */
@Slf4j
@RestController
@Api(description = "总部物品订单管理接口")
@RequestMapping("/minshang/headGoodsOrder")
@Transactional
public class HeadGoodsOrderController extends MinShangBaseController<HeadGoodsOrder, String>{

    @Resource
    private HeadGoodsOrderService headGoodsOrderService;

    @Override
    public HeadGoodsOrderService getService() {
        return headGoodsOrderService;
    }

    @RequestMapping(value = "/saveHeadGoodsOrder",method = RequestMethod.POST)
    @ApiOperation(value = "添加总部物品订单")
    public Result<Object> saveHeadGoodsOrder(@ModelAttribute HeadGoodsOrder headGoodsOrder){
        if(headGoodsOrderService.saveHeadGoodsOrder(headGoodsOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("添加总部物品订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加总部物品订单失败");
        }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改总部物品订单")
    public Result<Object> editHeadGoodsOrder(@ModelAttribute HeadGoodsOrder headGoodsOrder){
        if(headGoodsOrderService.editHeadGoodsOrder(headGoodsOrder) !=null){
            return new ResultUtil<>().setSuccessMsg("修改总部物品订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改总部物品订单失败");
        }
    }

    @RequestMapping(value = "/getShopGoodsByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取总部物品订单")
    public Result<Page<HeadGoodsOrder>> getHeadGoodsOrderList(@ModelAttribute HeadGoodsOrder headGoodsOrder, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<HeadGoodsOrder> page = headGoodsOrderService.findByCondition(headGoodsOrder, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<HeadGoodsOrder>>().setData(page);
    }

}
