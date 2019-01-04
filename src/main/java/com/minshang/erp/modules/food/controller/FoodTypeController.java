package com.minshang.erp.modules.food.controller;

import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.utils.PageUtil;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.vo.PageVo;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodService;
import com.minshang.erp.modules.food.service.FoodTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


/**
 * @author 后羿i
 */
@Slf4j
@RestController
@Api(description = "菜品分类管理接口")
@RequestMapping("/minshang/foodType")
@Transactional
public class FoodTypeController extends MinShangBaseController<FoodType, String> {

    private final FoodTypeService foodTypeService;
    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    private FoodService foodService;

    @Autowired
    public FoodTypeController(FoodTypeService foodTypeService) {
        this.foodTypeService = foodTypeService;
    }

    @Override
    public FoodTypeService getService() {
        return foodTypeService;
    }


    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ApiOperation(value = "修改菜品分类")
    public Result<Object> updateStatus(@ModelAttribute FoodType foodType){
        if(foodTypeService.editFoodType(foodType) !=null){
            return new ResultUtil<>().setSuccessMsg("修改菜品分类成功");
        }else {
            return new ResultUtil<>().setErrorMsg("修改菜品分类失败");
        }
    }
    @RequestMapping(value = "/getFoodTypeByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取菜品")
    public Result<Page<FoodType>> getFoodTypeLibList(@ModelAttribute FoodType foodType, @ModelAttribute SearchVo searchVo, @ModelAttribute PageVo pageVo) {
        Page<FoodType> page = foodTypeService.findByCondition(foodType, searchVo, PageUtil.initPage(pageVo));
        for(FoodType ft: page.getContent()){
            List<Food> foodList = foodService.findByFoodTypeId(ft.getId());
            ft.setFoodList(foodList);
            // 清除持久上下文环境 避免后面语句导致持久化
            entityManager.clear();
        }
        return new ResultUtil<Page<FoodType>>().setData(page);
    }

}
