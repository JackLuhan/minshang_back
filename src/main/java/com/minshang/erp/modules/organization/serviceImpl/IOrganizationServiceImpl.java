package com.minshang.erp.modules.organization.serviceImpl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.organization.mapper.OrganizationMapper;
import com.minshang.erp.modules.organization.service.IOrganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName IOrganizationServiceImpl
 * @Description 机构业务层
 * @Author lcmaijia
 * @Date 2019/1/3 0003
 * @Version 1.0
 **/
@Service
public class IOrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

    @Resource
    private OrganizationMapper organizationMapper;

    @Override
    public List<Organization> findByOrgId(String orgId) {
        return organizationMapper.findByOrgId(orgId);
    }
}