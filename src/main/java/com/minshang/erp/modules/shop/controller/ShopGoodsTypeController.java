package com.minshang.erp.modules.shop.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopGoodsType;
import com.minshang.erp.modules.shop.entity.ShopGoodsType;
import com.minshang.erp.modules.shop.service.ShopGoodsTypeService;
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
@Api(description = "物品类别管理接口")
@RequestMapping("/minshang/shopGoodsType")
@Transactional
public class ShopGoodsTypeController extends MinShangBaseController<ShopGoodsType, String>{

    @Resource
    private ShopGoodsTypeService shopGoodsTypeService;

    @Override
    public ShopGoodsTypeService getService() {
        return shopGoodsTypeService;
    }
    @RequestMapping(value = "/getShopGoodsTypeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取仓库")
    public Result<Page<ShopGoodsType>> getShopGoodsTypeList(@ModelAttribute ShopGoodsType shopGoodsType, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<ShopGoodsType> page = shopGoodsTypeService.findByCondition(shopGoodsType, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<ShopGoodsType>>().setData(page);
    }
}
