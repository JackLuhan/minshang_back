package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadStockInventoryGoods;
import com.minshang.erp.modules.head.entity.HeadStockInventoryGoods;
import com.minshang.erp.modules.head.service.HeadStockInventoryGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author lcmaijia
 */
@Slf4j
@RestController
@Api(description = "总部盘点商品管理接口")
@RequestMapping("/minshang/headStockInventoryGoods")
@Transactional
public class HeadStockInventoryGoodsController extends MinShangBaseController<HeadStockInventoryGoods, String>{

    @Resource
    private HeadStockInventoryGoodsService headStockInventoryGoodsService;

    @Override
    public HeadStockInventoryGoodsService getService() {
        return headStockInventoryGoodsService;
    }

    @RequestMapping(value = "/saveHeadStockInventoryGoods",method = RequestMethod.POST)
    @ApiOperation(value = "添加总部盘点订单")
    public Result<Object> saveHeadStockInventoryGoods(@ModelAttribute HeadStockInventoryGoods headStockInventoryGoods){
        if(headStockInventoryGoodsService.saveHeadStockInventoryGoods(headStockInventoryGoods) !=null){
            return new ResultUtil<>().setSuccessMsg("添加总部盘点订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加总部盘点订单失败");
        }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改总部盘点订单")
    public Result<Object> editHeadStockInventoryGoods(@ModelAttribute HeadStockInventoryGoods headStockInventoryGoods){
        if(headStockInventoryGoodsService.editHeadStockInventoryGoods(headStockInventoryGoods) !=null){
            return new ResultUtil<>().setSuccessMsg("修改总部盘点订单成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改总部盘点订单失败");
        }
    }

    @RequestMapping(value = "/getShopGoodsByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取总部盘点订单")
    public Result<Page<HeadStockInventoryGoods>> getHeadStockInventoryGoodsList(@ModelAttribute HeadStockInventoryGoods headStockInventoryGoods, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<HeadStockInventoryGoods> page = headStockInventoryGoodsService.findByCondition(headStockInventoryGoods, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<HeadStockInventoryGoods>>().setData(page);
    }

}
