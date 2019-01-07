package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopBuyerStat;
import com.minshang.erp.modules.shop.service.ShopBuyerStatService;
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
@Api(description = "门店采购统计管理接口")
@RequestMapping("/minshang/shopBuyerStat")
@Transactional
public class ShopBuyerStatController extends MinShangBaseController<ShopBuyerStat, String>{

    @Resource
    private ShopBuyerStatService shopBuyerStatService;

    @Override
    public ShopBuyerStatService getService() {
        return shopBuyerStatService;
    }



    @RequestMapping(value = "/saveShopBuyerStat",method = RequestMethod.POST)
    @ApiOperation(value = "添加采购统计")
    public Result<Object> saveShopBuyerStat(@ModelAttribute ShopBuyerStat shopBuyerStat){
        if(shopBuyerStatService.saveShopBuyerStat(shopBuyerStat) !=null){
            return new ResultUtil<>().setSuccessMsg("添加采购统计成功");
        }else {
            return new ResultUtil<>().setErrorMsg("添加采购统计失败");
        }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改采购统计物品")
    public Result<Object> editShopBuyerStat(@ModelAttribute ShopBuyerStat shopBuyerStat){
        if(shopBuyerStatService.editShopBuyerStat(shopBuyerStat) !=null){
            return new ResultUtil<>().setSuccessMsg("修改采购统计成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改采购统计失败");
        }
    }

    @RequestMapping(value = "/getShopGoodsByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取原材料")
    public Result<Page<ShopBuyerStat>> getShopBuyerStatList(@ModelAttribute ShopBuyerStat shopBuyerStat, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopBuyerStat> page = shopBuyerStatService.findByCondition(shopBuyerStat, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopBuyerStat>>().setData(page);
    }
}
