package com.minshang.erp.modules.organization.serviceImpl;

import com.minshang.erp.modules.organization.dao.OrgBrandAreaDao;
import com.minshang.erp.modules.organization.entity.OrgBrandArea;
import com.minshang.erp.modules.organization.service.OrgBrandAreaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName OrgBrandAreaServiceImpl
 * @Description 机构品牌区域业务层
 * @Author lcmaijia
 * @Date 2019/1/3 0003
 * @Version 1.0
 **/
@Slf4j
@Service
@Transactional
public class OrgBrandAreaServiceImpl implements OrgBrandAreaService {

    @Autowired
    private OrgBrandAreaDao orgBrandAreaDao;

    @Override
    public OrgBrandAreaDao getRepository() {
        return orgBrandAreaDao;
    }

    @Override
    public List<OrgBrandArea> findByBrandAreaId(String brandAreaId) {
        return orgBrandAreaDao.findByBrandAreaId(brandAreaId);
    }

    @Override
    public List<OrgBrandArea> findByOrgId(String orgId) {
        return orgBrandAreaDao.findByOrgId(orgId);
    }

    @Override
    public void deleteByOrgId(String orgId) {
        orgBrandAreaDao.deleteByOrgId(orgId);
    }


}