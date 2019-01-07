package com.minshang.erp.modules.food.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.food.entity.Organization;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 机构表数据处理层
 * @author 后羿i
 */
@Repository
public interface OrganizationDao extends MinShangBaseDao<Organization,String> {

     Organization findByParentId(String parentId);

     List<Organization> findByOrgName(String orgName);

}