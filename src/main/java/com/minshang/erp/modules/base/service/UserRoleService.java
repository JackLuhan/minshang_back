package com.minshang.erp.modules.base.service;


import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.base.entity.UserRole;

import java.util.List;

/**
 * 用户角色接口
 * @author houyi
 */
public interface UserRoleService extends MinShangBaseService<UserRole,String> {

    /**
     * 通过roleId查找
     * @param roleId
     * @return
     */
    List<UserRole> findByRoleId(String roleId);

    /**
     * 删除用户角色
     * @param userId
     */
    void deleteByUserId(String userId);
}
