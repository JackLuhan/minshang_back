package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.FoodlibOrganizationService;
import com.minshang.erp.modules.food.service.OrganizationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "机构表管理接口")
@RequestMapping("/minshang/organization")
@Transactional
public class OrganizationController extends MinShangBaseController<Organization, String>{

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private FoodlibOrganizationService foodlibOrganizationService;

    @Override
    public OrganizationService getService() {
        return organizationService;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ApiOperation(value = "保存机构数据")
    public Result<Organization> save(@ModelAttribute Organization organization){
        //根据父id获取当前对象
        Organization organizationDaoOne = organizationDao.findByParentId(organization.getParentId());
        //获取页面上选中的id作为parentId
        organization.setParentId(organizationDaoOne.getId());
        //保存数据到机构表里
        organization = organizationService.save(organization);
        return new ResultUtil<Organization>().setData(organization);
    }



}
