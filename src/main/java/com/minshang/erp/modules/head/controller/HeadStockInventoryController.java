package com.minshang.erp.modules.head.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.head.entity.HeadStockInventory;
import com.minshang.erp.modules.head.service.HeadStockInventoryService;
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
@Api(description = "总部盘点管理管理接口")
@RequestMapping("/minshang/headStockInventory")
@Transactional
public class HeadStockInventoryController extends MinShangBaseController<HeadStockInventory, String>{

    @Resource
    private HeadStockInventoryService headStockInventoryService;

    @Override
    public HeadStockInventoryService getService() {
        return headStockInventoryService;
    }



}
