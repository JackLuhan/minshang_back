package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadSupplier;
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

    @RequestMapping(value = "/saveHeadSupplier", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "保存总部供应商")
    public Result<Object> regist(@ModelAttribute HeadSupplier headSupplier) {
        // 判断供应商名称是否重复
        if (headSupplierService.findBySupplierName(headSupplier.getSupplierName()) != null) {
            return new ResultUtil<Object>().setErrorMsg("该机构已被注册");
        }
        // 判断供应商编码是否重复
        if (headSupplierService.findBySupplierCode(headSupplier.getSupplierCode()) != null) {
            return new ResultUtil<Object>().setErrorMsg("该仓库编码已被注册");
        }
        HeadSupplier hs = getService().save(headSupplier);
        if(hs==null){
            return new ResultUtil<Object>().setErrorMsg("添加失败");
        }
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }

    @RequestMapping(value = "/updateHeadSupplier", method = RequestMethod.PUT)
    @ResponseBody
    @ApiOperation(value = "更新总部供应商")
    public Result<Object> editHeadSupplier(@ModelAttribute HeadSupplier headSupplier) {
        // 判断供应商名称是否重复
        if (headSupplierService.findBySupplierName(headSupplier.getSupplierName()) != null) {
            return new ResultUtil<Object>().setErrorMsg("该机构已被注册");
        }
        // 判断供应商编码是否重复
        if (headSupplierService.findBySupplierCode(headSupplier.getSupplierCode()) != null) {
            return new ResultUtil<Object>().setErrorMsg("该仓库编码已被注册");
        }
        HeadSupplier hs = getService().update(headSupplier);
        if(hs==null){
            return new ResultUtil<Object>().setErrorMsg("修改失败");
        }
        return new ResultUtil<Object>().setSuccessMsg("修改成功");
    }

}
