package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.service.OrganizationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 机构表接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class OrganizationServiceImpl implements OrganizationService {

    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public OrganizationDao getRepository() {
        return organizationDao;
    }
}