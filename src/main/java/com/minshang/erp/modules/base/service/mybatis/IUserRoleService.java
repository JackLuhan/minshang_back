package com.minshang.erp.modules.base.service.mybatis;

import com.minshang.erp.modules.base.entity.Role;
import com.minshang.erp.modules.base.entity.UserRole;
import com.baomidou.mybatisplus.service.IService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @author houyi
 */
@CacheConfig(cacheNames = "userRole")
public interface IUserRoleService extends IService<UserRole> {

    /**
     * 通过用户id获取
     * @param userId
     * @return
     */
    @Cacheable(key = "#userId")
    List<Role> findByUserId(String userId);

    /**
     * 通过用户id获取用户角色关联的部门数据
     * @param userId
     * @return
     */
    @Cacheable(key = "'depIds:'+#userId")
    List<String> findDepIdsByUserId(String userId);
}
