package com.minshang.erp.modules.base.serviceimpl.mybatis;

import com.minshang.erp.modules.base.dao.mapper.UserRoleMapper;
import com.minshang.erp.modules.base.entity.Role;
import com.minshang.erp.modules.base.entity.UserRole;
import com.minshang.erp.modules.base.service.mybatis.IUserRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author houyi
 */
@Service
public class IUserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<Role> findByUserId(String userId) {

        return userRoleMapper.findByUserId(userId);
    }

    @Override
    public List<String> findDepIdsByUserId(String userId) {

        return userRoleMapper.findDepIdsByUserId(userId);
    }
}
