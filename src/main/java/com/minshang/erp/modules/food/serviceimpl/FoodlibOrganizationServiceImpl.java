package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.modules.food.dao.FoodlibOrganizationDao;
import com.minshang.erp.modules.food.service.FoodlibOrganizationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 菜品库机构表接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodlibOrganizationServiceImpl implements FoodlibOrganizationService {

    @Autowired
    private FoodlibOrganizationDao foodlibOrganizationDao;

    @Override
    public FoodlibOrganizationDao getRepository() {
        return foodlibOrganizationDao;
    }
}