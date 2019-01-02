package com.minshang.erp.modules.brandarea.service;

import com.baomidou.mybatisplus.service.IService;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @InterfaceName IBrandAreaService
 * @Description 品牌区域业务层接口
 * @Author lcmaijia
 * @Date 2019/1/2 000214:32
 * @Version 1.0
 **/
@CacheConfig(cacheNames = "brandArea")
public interface IBrandAreaService extends IService<BrandArea> {

    /**
     * 通过用户id获取
     * @param brandAreaId
     * @return
     */
    @Cacheable(key = "#brandAreaId")
    List<BrandArea> findByBrandAreaId(String brandAreaId);
}
