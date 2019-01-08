package com.minshang.erp.modules.head.controller;

import cn.hutool.core.util.StrUtil;
import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadOrder;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.service.HeadOrderService;
import com.minshang.erp.modules.head.service.HeadSupplierService;
import com.minshang.erp.modules.head.service.IHeadSupplierService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author lcmaijia
 */
@Slf4j
@RestController
@Api(description = "总部订单管理管理接口")
@RequestMapping("/minshang/headOrder")
@Transactional
public class HeadOrderController extends MinShangBaseController<HeadOrder, String>{

    @Resource
    private HeadOrderService headOrderService;
    @Resource
    private HeadSupplierService headSupplierService;
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Resource
    private IHeadSupplierService iHeadSupplierService;

    @Override
    public HeadOrderService getService() {
        return headOrderService;
    }



    @RequestMapping(value = "/getHeadOrderByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取总部订单管理")
    public Result<Page<HeadOrder>> getHeadOrderList(@ModelAttribute HeadOrder headOrder, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<HeadOrder> page = headOrderService.findByCondition(headOrder, searchVo, PageUtil.initPage(pageVo));

        for (HeadOrder order : page.getContent()) {
            List<HeadSupplier> list = iHeadSupplierService.findByHeadSupplierId(order.getSupplierId());
            order.setHeadSuppliers(list);
        }

        return new ResultUtil<Page<HeadOrder>>().setData(page);
    }

    @RequestMapping(value = "/addHeadOrder",method = RequestMethod.POST)
    @ApiOperation(value = "添加总部订单")
    public Result<Object> regist(@ModelAttribute HeadOrder headOrder,@RequestParam(required = false) String[] headSupplier){

        // 判断是否缺少字段
        if(StrUtil.isBlank(headOrder.getDocumentNo())){
            return new ResultUtil<Object>().setErrorMsg("缺少必需表单字段");
        }

        //单据号生成器
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        String temp = sf.format(new Date());
        int random = (int) (Math.random() * 10000);
        headOrder.setDocumentNo(temp + random);

        // 判断单据号是否重复
        if(headOrderService.findByDocumentNo(headOrder.getDocumentNo())!=null){
            return new ResultUtil<Object>().setErrorMsg("该单据号已重复");
        }
        //删除缓存
        redisTemplate.delete("headOrder::"+headOrder.getDocumentNo());

        HeadOrder ho = headOrderService.save(headOrder);
        if(ho==null){
            return new ResultUtil<Object>().setErrorMsg("添加失败");
        }

        // 将品牌区域中所有数据遍历
        if(headSupplier!=null&&headSupplier.length>0){
            for (String s : headSupplier) {
                HeadSupplier hs = new HeadSupplier();
                hs.setId(ho.getSupplierId());
                headSupplierService.save(hs);
            }
        }
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }

}
