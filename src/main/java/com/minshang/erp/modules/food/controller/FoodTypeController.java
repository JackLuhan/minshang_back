package com.minshang.erp.modules.food.controller;

import cn.hutool.core.util.StrUtil;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.minshang.erp.base.MinShangBaseController;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.utils.ResultUtil;
import com.minshang.erp.common.utils.SecurityUtil;
import com.minshang.erp.common.vo.Result;
import com.minshang.erp.modules.base.entity.User;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
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
    private StringRedisTemplate redisTemplate;

    @Autowired
    private SecurityUtil securityUtil;

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

    @RequestMapping(value = "/getByFoodLibId/{foodLibId}",method = RequestMethod.GET)
    @ApiOperation(value = "通过菜品库id获取菜品分类信息")
    public Result<List<FoodType>> getByParentId(@PathVariable String foodLibId){

        List<FoodType> list = new ArrayList<>();
        User u = securityUtil.getCurrUser();
        String key = "foodType::"+foodLibId+":"+u.getId();
        String v = redisTemplate.opsForValue().get(key);
        if(StrUtil.isNotBlank(v)){
            list = new Gson().fromJson(v, new TypeToken<List<FoodType>>(){}.getType());
            return new ResultUtil<List<FoodType>>().setData(list);
        }
        list = foodTypeService.findByFoodLibId(foodLibId);
        // lambda表达式
        list.forEach(item -> {
            if(!CommonConstant.PARENT_ID.equals(item.getFoodLibId())){
                FoodType parent = foodTypeService.get(item.getFoodLibId());
            }
        });
        redisTemplate.opsForValue().set(key, new Gson().toJson(list));
        return new ResultUtil<List<FoodType>>().setData(list);
    }

}
