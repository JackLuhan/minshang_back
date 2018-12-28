package com.minshang.erp.modules.base.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.base.entity.RolePermission;

import java.util.List;

/**
 * 角色权限接口
 * @author houyi
 */
public interface RolePermissionService extends MinShangBaseService<RolePermission,String> {

    /**
     * 通过permissionId获取
     * @param permissionId
     * @return
     */
    List<RolePermission> findByPermissionId(String permissionId);

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RolePermission> findByRoleId(String roleId);

    /**
     * 通过roleId删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);
}