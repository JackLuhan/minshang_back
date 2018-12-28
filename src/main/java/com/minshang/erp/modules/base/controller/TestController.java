package com.minshang.erp.modules.base.controller;

import com.minshang.erp.common.annotation.RateLimiter;
import com.minshang.erp.common.lock.Callback;
import com.minshang.erp.common.lock.RedisDistributedLockTemplate;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


/**
 * @author houyi
 */
@Slf4j
@Controller
@Api(description = "测试接口")
@Transactional
@RequestMapping(value = "/test")
public class TestController {

    @Autowired
    private RedisDistributedLockTemplate lockTemplate;

    @RequestMapping(value = "/lockAndLimit",method = RequestMethod.GET)
    @RateLimiter(limit = 1, timeout = 5000)
    @ApiOperation(value = "同步锁限流测试")
    @ResponseBody
    public Result<Object> test1(){

        lockTemplate.execute("订单流水号", 5000, new Callback() {
            @Override
            public Object onGetLock() throws InterruptedException {
                //TODO 获得锁后要做的事
                log.info("生成订单流水号");
                return null;
            }

            @Override
            public Object onTimeout() throws InterruptedException {
                //TODO 获得锁超时后要做的事
                return null;
            }
        });
        return new ResultUtil<Object>().setData(null);
    }
}
