package com.minshang.erp.modules.base.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.Role;

import java.util.List;

/**
 * 角色数据处理层
 * @author houyi
 */
public interface RoleDao extends MinShangBaseDao<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
