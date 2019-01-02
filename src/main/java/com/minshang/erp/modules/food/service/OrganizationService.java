package com.minshang.erp.modules.food.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Organization;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 机构表接口
 * @author 后羿i
 */
public interface OrganizationService extends MinShangBaseService<Organization,String> {

    Page<Organization> findByCondition(Organization organization, SearchVo searchVo, Pageable pageable);

}