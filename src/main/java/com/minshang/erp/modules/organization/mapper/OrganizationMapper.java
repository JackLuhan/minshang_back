package com.minshang.erp.modules.organization.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.minshang.erp.modules.food.entity.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName OrganizationMapper
 * @Description 组织机构mapper
 * @Author lcmaijia
 * @Date 2019/1/3 000316:25
 * @Version 1.0
 **/
public interface OrganizationMapper extends BaseMapper<Organization> {

    /**
     * 通过orgId获取机构
     * @param orgId
     * @return
     */
    List<Organization> findByOrgId(@Param("orgId") String orgId);
}
