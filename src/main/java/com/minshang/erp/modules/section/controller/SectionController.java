package com.minshang.erp.modules.section.controller;

import cn.hutool.core.util.StrUtil;
import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.service.IBrandAreaService;
import com.minshang.erp.modules.food.entity.Organization;
import com.minshang.erp.modules.food.service.OrganizationService;
import com.minshang.erp.modules.organization.service.IOrganizationService;
import com.minshang.erp.modules.section.entity.Section;
import com.minshang.erp.modules.section.service.SectionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author lcmaijia
 */
@Slf4j
@RestController
@Api(description = "部门管理接口")
@RequestMapping("/minshang/section")
@Transactional
public class SectionController extends MinShangBaseController<Section, String>{

    @Resource
    private SectionService sectionService;
    @Resource
    private IOrganizationService iOrganizationService;
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Resource
    private OrganizationService organizationService;
    @Resource
    private IBrandAreaService iBrandAreaService;

    @Override
    public SectionService getService() {
        return sectionService;
    }

    @RequestMapping(value = "/getSectionByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取品牌区域")
    public Result<Page<Section>> getSectionList(@ModelAttribute Section section, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<Section> page = sectionService.findByCondition(section, searchVo, PageUtil.initPage(pageVo));
        // 将org中根据orgId遍历出来
        for (Section s : page.getContent()) {
            List<Organization> list = iOrganizationService.findByOrgId(s.getOrgId());
            s.setOrganizations(list);
        }

        return new ResultUtil<Page<Section>>().setData(page);
    }


    @RequestMapping(value = "/addSection",method = RequestMethod.POST)
    @ApiOperation(value = "添加部门")
    public Result<Object> regist(@ModelAttribute Section section,@RequestParam(required = false) String[] organization){
        // 判断是否缺少字段
        if(StrUtil.isBlank(section.getSectionname())){
            return new ResultUtil<Object>().setErrorMsg("缺少必需表单字段");
        }
        // 判断部门名是否重复
        if(sectionService.findBySectionname(section.getSectionname())!=null){
            return new ResultUtil<Object>().setErrorMsg("该机构已被注册");
        }
        //删除缓存
        redisTemplate.delete("organization::"+section.getSectionname());

        Section s = sectionService.save(section);
        if(s==null){
            return new ResultUtil<Object>().setErrorMsg("添加失败");
        }
        // 将机构中所有数据遍历
        if(organization!=null&&organization.length>0){
            for (String st : organization) {
                Organization o = new Organization();
                o.setId(s.getOrgId());
                organizationService.save(o);
            }
        }
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }

    @RequestMapping(value = "/editSection",method = RequestMethod.POST)
    @ApiOperation(value = "修改部门信息")
    public Result<Object> editOrg(@ModelAttribute Section s){
        // 获取orgId 和对应的orgName
        Section section = sectionService.get(s.getId());
        section.setOrgId(s.getOrgId());
        section.setSectionname(s.getSectionname());

        // 修改
        Section st = sectionService.update(section);
        if(st==null){
            return new ResultUtil<Object>().setErrorMsg("修改失败");
        }
        return new ResultUtil<Object>().setSuccessMsg("修改成功");
    }

}
