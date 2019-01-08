package com.minshang.erp.modules.head.service;

import com.baomidou.mybatisplus.service.IService;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 总部供应商接口
 * @author lcmaijia
 */
@CacheConfig(cacheNames = "headSupplier")
public interface IHeadSupplierService extends IService<HeadSupplier> {

    /**
     * 通过用户id获取
     * @param supplierId
     * @return
     */
    @Cacheable(key = "#supplierId")
    List<HeadSupplier> findByHeadSupplierId(String supplierId);

}