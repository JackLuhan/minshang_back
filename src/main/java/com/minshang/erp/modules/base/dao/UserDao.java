package com.minshang.erp.modules.base.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.User;

import java.util.List;

/**
 * 用户数据处理层
 * @author houyi
 */
public interface UserDao extends MinShangBaseDao<User,String> {

    /**
     * 通过用户名获取用户
     * @param username
     * @return
     */
    List<User> findByUsername(String username);

    /**
     * 通过手机获取用户
     * @param mobile
     * @return
     */
    List<User> findByMobile(String mobile);

    /**
     * 通过邮件获取用户
     * @param email
     * @return
     */
    List<User> findByEmail(String email);

    /**
     * 通过部门id获取
     * @param departmentId
     * @return
     */
    List<User> findByDepartmentId(String departmentId);
}
