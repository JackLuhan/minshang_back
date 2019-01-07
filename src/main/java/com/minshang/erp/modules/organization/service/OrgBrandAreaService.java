package com.minshang.erp.modules.organization.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.modules.organization.entity.OrgBrandArea;

import java.util.List;

/**
 * @InterfaceName OrgBrandAreaService
 * @Description 机构品牌区域业务层接口
 * @Author lcmaijia
 * @Date 2019/1/3 000310:59
 * @Version 1.0
 **/
public interface OrgBrandAreaService extends MinShangBaseService<OrgBrandArea,String> {

    /**
     * 通过brandAreaId获取
     * @param brandAreaId
     * @return
     */
    List<OrgBrandArea> findByBrandAreaId(String brandAreaId);

    /**
     * 通过roleId获取
     * @param orgId
     * @return
     */
    List<OrgBrandArea> findByOrgId(String orgId);

    /**
     * 通过orgId删除
     * @param orgId
     */
    void deleteByOrgId(String orgId);
}
