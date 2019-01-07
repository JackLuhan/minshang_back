package com.minshang.erp.modules.organization.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.organization.entity.OrgBrandArea;

import java.util.List;

/**
 * @InterfaceName OrgBrandAreaDao
 * @Description 机构品牌区域Dao层
 * @Author lcmaijia
 * @Date 2019/1/3 000310:53
 * @Version 1.0
 **/
public interface OrgBrandAreaDao extends MinShangBaseDao<OrgBrandArea,String> {

    /**
     * 通过brandAreaId获取
     * @param brandAreaId
     * @return
     */
    List<OrgBrandArea> findByBrandAreaId(String brandAreaId);

    /**
     * 通过orgId获取
     * @param orgId
     */
    List<OrgBrandArea> findByOrgId(String orgId);

    /**
     * 通过orgId删除
     * @param orgId
     */
    void deleteByOrgId(String orgId);
}
