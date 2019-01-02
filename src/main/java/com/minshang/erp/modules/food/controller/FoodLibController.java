package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodLibDao;
import com.minshang.erp.modules.food.dao.FoodlibOrganizationDao;
import com.minshang.erp.modules.food.dao.OrganizationDao;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodlibOrganization;
import com.minshang.erp.modules.food.service.FoodLibService;
import com.minshang.erp.modules.food.service.FoodlibOrganizationService;
import com.minshang.erp.modules.food.service.OrganizationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品库管理接口")
@RequestMapping("/minshang/foodLib")
@Transactional
public class FoodLibController extends MinShangBaseController<FoodLib, String> {

    @Autowired
    private FoodLibService foodLibService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private FoodlibOrganizationService foodlibOrganizationService;
    @Autowired
    private FoodLibDao foodLibDao;

    @Autowired
    private OrganizationDao organizationDao;
    @Autowired
    private FoodlibOrganizationDao foodlibOrganizationDao;

    @Override
    public FoodLibService getService() {
        return foodLibService;
    }

  /*  @RequestMapping(value = "/getAllList", method = RequestMethod.GET)
    @ApiOperation(value = "获取全部菜品库")
    public Result<Object> foodLibGetAll() {
        //获取所有的菜品库
        List<FoodLib> foodLibList = foodLibService.getAll();
        for (FoodLib foodLib : foodLibList) {
            //根据食品库id获取机构id
            String orgId = foodlibOrganizationDao.findByFoodLibId(foodLib.getId()).getOrgId();
            Organization organization = organizationDao.findByParentId(orgId);
            //根据机构id获取机构对象
            foodLib.setOrgName(organization.getOrgName());
        }
        return new ResultUtil<>().setData(foodLibList);
    }*/

    @RequestMapping(value = "/getFoodLibByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品库")
    public Result<Page<FoodLib>> getFoodLibList(@ModelAttribute FoodLib foodLib, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodLib> page = foodLibService.findByCondition(foodLib, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<FoodLib>>().setData(page);
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ApiOperation(value = "新增菜品库数据")
    public Result<FoodLib> save(@ModelAttribute FoodLib foodLib) {
        //保存菜品库信息
        foodLib = foodLibService.save(foodLib);
        FoodlibOrganization foodlibOrganization = new FoodlibOrganization();
        foodlibOrganization.setFoodLibId(foodLib.getId());
        //默认设置为安业公司的
        foodlibOrganization.setOrgId("-1");
        //保存菜品和机构数据id
        foodlibOrganizationService.save(foodlibOrganization);
        return new ResultUtil<FoodLib>().setData(foodLib);
    }

    @RequestMapping(value = "/delById/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "通过id删除菜品库数据")
    public Result<Object> delByIds(@PathVariable String id){
        //根据id 获取食品库
        FoodLib foodLib = foodLibService.get(id);
        if(foodLib==null){
            return new ResultUtil<>().setErrorMsg("菜品库不存在");
        }
        foodLibService.delete(id);
        return new ResultUtil<>().setSuccessMsg("通过id菜品库删除数据成功");
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ApiOperation(value = "更新菜品库状态")
    public Result<Object> updateStatus(@ModelAttribute FoodLib foodLib){
//        FoodLib foodLib1 = foodLibService.get(foodLib.getId());
//        foodLibService.update(foodLib);
        if(foodLibService.updateById(foodLib) !=null){
            return new ResultUtil<>().setSuccessMsg("更新状态成功");
        }else {
            return new ResultUtil<>().setErrorMsg("更新状态失败");
        }
    }
}