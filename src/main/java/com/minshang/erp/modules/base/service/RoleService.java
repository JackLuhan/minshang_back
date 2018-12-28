package com.minshang.erp.modules.base.service;


import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.base.entity.Role;

import java.util.List;

/**
 * 角色接口
 * @author houyi
 */
public interface RoleService extends MinShangBaseService<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
