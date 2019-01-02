package com.minshang.erp.modules.brandarea.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.service.BrandAreaService;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * @author lcmaijia
 */
@Slf4j
@RestController
@Api(description = "品牌区域管理接口")
@RequestMapping("/minshang/brandArea")
@CacheConfig(cacheNames = "brandArea")
@Transactional
public class BrandAreaController extends MinShangBaseController<BrandArea, String>{

    @Resource
    private BrandAreaService brandAreaService;

    @Override
    public BrandAreaService getService() {
        return brandAreaService;
    }

    @RequestMapping(value = "/getBrandAreaByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取品牌区域")
    public Result<Page<BrandArea>> getBrandAreaList(@ModelAttribute BrandArea brandArea, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<BrandArea> page = brandAreaService.findByCondition(brandArea, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<BrandArea>>().setData(page);
    }

}
