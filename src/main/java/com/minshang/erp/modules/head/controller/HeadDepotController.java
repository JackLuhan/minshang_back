package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadDepot;
import com.minshang.erp.modules.head.service.HeadDepotService;
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
@Api(description = "总部仓库管理接口")
@RequestMapping("/minshang/headDepot")
@Transactional
public class HeadDepotController extends MinShangBaseController<HeadDepot, String>{

    @Resource
    private HeadDepotService headDepotService;

    @Override
    public HeadDepotService getService() {
        return headDepotService;
    }

    @RequestMapping(value = "/getHeadDepotByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取总部仓库")
    public Result<Page<HeadDepot>> getHeadDepotList(@ModelAttribute HeadDepot headDepot, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<HeadDepot> page = headDepotService.findByCondition(headDepot, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<HeadDepot>>().setData(page);
    }

}
