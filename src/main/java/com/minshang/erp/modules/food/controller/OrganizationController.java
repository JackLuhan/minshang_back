package com.minshang.erp.modules.food.controller;

import cn.hutool.core.util.StrUtil;
import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.service.BrandAreaService;
import com.minshang.erp.modules.brandarea.service.IBrandAreaService;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "机构表管理接口")
@RequestMapping("/minshang/organization")
@Transactional
public class OrganizationController extends MinShangBaseController<Organization, String> {

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private OrganizationDao organizationDao;
    @Resource
    private IBrandAreaService iBrandAreaService;
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Resource
    private BrandAreaService brandAreaService;

    @Override
    public OrganizationService getService() {
        return organizationService;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ApiOperation(value = "保存机构数据")
    public Result<Organization> save(@ModelAttribute Organization organization) {
        //根据父id获取当前对象
        Organization organizationDaoOne = organizationDao.findByParentId(organization.getParentId());
        //获取页面上选中的id作为parentId
        organization.setParentId(organizationDaoOne.getId());
        //保存数据到机构表里
        organization = organizationService.save(organization);
        return new ResultUtil<Organization>().setData(organization);
    }


    @RequestMapping(value = "/getOrganizationByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取机构")
    public Result<Page<Organization>> getOrganizationList(@ModelAttribute Organization organization,@ModelAttribute SearchVo searchVo,@ModelAttribute PageVo pageVo) {
        Page<Organization> page = organizationService.findByCondition(organization, searchVo, PageUtil.initPage(pageVo));

        for (Organization o : page.getContent()) {
        List<BrandArea> list = iBrandAreaService.findByBrandAreaId(o.getBrandAreaId());
            o.setBrandAreas(list);
        }
        return new ResultUtil<Page<Organization>>().setData(page);
    }

    @RequestMapping(value = "/addOrganization",method = RequestMethod.POST)
    @ApiOperation(value = "添加机构")
    public Result<Object> regist(@ModelAttribute Organization organization,@RequestParam(required = false) String[] brandArea){

        // 判断是否缺少字段
        if(StrUtil.isBlank(organization.getOrgName())){
            return new ResultUtil<Object>().setErrorMsg("缺少必需表单字段");
        }

        // 判断机构名是否重复
        if(organizationService.findByOrgName(organization.getOrgName())!=null){
            return new ResultUtil<Object>().setErrorMsg("该机构已被注册");
        }
        //删除缓存
        redisTemplate.delete("organization::"+organization.getOrgName());

        Organization o = organizationService.save(organization);
        if(o==null){
            return new ResultUtil<Object>().setErrorMsg("添加失败");
        }

        // 将品牌区域中所有数据遍历
        if(brandArea!=null&&brandArea.length>0){
            for (String s : brandArea) {
                BrandArea ba = new BrandArea();
                ba.setId(o.getBrandAreaId());
                brandAreaService.save(ba);
            }
        }
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }

    @RequestMapping(value = "/editOrganization",method = RequestMethod.POST)
    @ApiOperation(value = "修改机构信息")
    public Result<Object> editOrg(@ModelAttribute Organization o){
        // 获取orgId 和对应的orgName
        Organization org = organizationService.get(o.getId());
        org.setParentId(o.getParentId());
        org.setOrgName(o.getOrgName());
        org.setAddress(o.getAddress());
        org.setActivationkey(o.getActivationkey());
        org.setShoptype(o.getShoptype());
        org.setShopUser(o.getShopUser());
        org.setTelphoneno(o.getTelphoneno());
        org.setOrgType(o.getOrgType());
        org.setBrandAreaId(o.getBrandAreaId());
        org.setUpdateBy(o.getUpdateBy());

        // 修改
        Organization organization = organizationService.update(org);
        if(organization==null){
            return new ResultUtil<Object>().setErrorMsg("修改失败");
        }
        return new ResultUtil<Object>().setSuccessMsg("修改成功");
    }



}
