package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.common.utils.SecurityUtil;
import com.minshang.erp.modules.food.dao.FoodTypeDao;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 菜品分类接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodTypeServiceImpl implements FoodTypeService {

    @Autowired
    private FoodTypeDao foodTypeDao;
    @Autowired
    private FoodTypeService foodTypeService;
    @Autowired
    private SecurityUtil securityUtil;

    @Override
    public FoodTypeDao getRepository() {
        return foodTypeDao;
    }

    /**
     * @Author 后羿i
     * @Description 修改菜品分类
     * @Date
     * @Param
     * @Return
     **/
    @Override
    public FoodType editFoodType(FoodType foodType) {
        //根据id查询单个菜品分类数据
        FoodType foodTypeOne = foodTypeDao.getOne(foodType.getId());
        foodTypeOne.setFoodTypeName(foodType.getFoodTypeName());
        return foodTypeService.update(foodTypeOne);
    }

    @Override
    public List<FoodType> findByFoodLibId(String foodLibId) {

        return foodTypeDao.findByFoodLibId(foodLibId);
    }
}