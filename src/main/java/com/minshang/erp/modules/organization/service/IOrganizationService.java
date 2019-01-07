package com.minshang.erp.modules.organization.service;

import com.baomidou.mybatisplus.service.IService;
import com.minshang.erp.modules.food.entity.Organization;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @InterfaceName IOrganizationService
 * @Description 机构业务层接口
 * @Author lcmaijia
 * @Date 2019/1/3 000316:44
 * @Version 1.0
 **/
@CacheConfig(cacheNames = "organization")
public interface IOrganizationService extends IService<Organization> {

    /**
     * 通过用户id获取
     * @param orgId
     * @return
     */
    @Cacheable(key = "#orgId")
    List<Organization> findByOrgId(String orgId);

}
