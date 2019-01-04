package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.service.HeadSupplierService;
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
@Api(description = "总部供应商管理接口")
@RequestMapping("/minshang/headSupplier")
@Transactional
public class HeadSupplierController extends MinShangBaseController<HeadSupplier, String>{

    @Resource
    private HeadSupplierService headSupplierService;

    @Override
    public HeadSupplierService getService() {
        return headSupplierService;
    }

    @RequestMapping(value = "/getHeadSupplierByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取总部供应商")
    public Result<Page<HeadSupplier>> getHeadSupplierList(@ModelAttribute HeadSupplier headSupplier, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<HeadSupplier> page = headSupplierService.findByCondition(headSupplier, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<HeadSupplier>>().setData(page);
    }

}
