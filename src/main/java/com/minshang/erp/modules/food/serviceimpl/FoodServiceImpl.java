package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodDao;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.service.FoodService;
import com.minshang.erp.modules.food.service.FoodTypeService;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 菜品接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodServiceImpl implements FoodService {

    @Autowired
    private FoodDao foodDao;
    @Resource
    private ShopUnitDao shopUnitDao;
    @Autowired
    private FoodService foodService;

    @Override
    public FoodDao getRepository() {
        return foodDao;
    }

    /**
     * @Author 后羿i
     * @Description 根据条件分页查询菜品
     * @Date  13:43
     * @Param [food, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.Food>
     **/
    @Override
    public Page<Food> findByCondition(Food food, SearchVo searchVo, Pageable pageable) {
        return foodDao.findAll(new Specification<Food>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<Food> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(food.getFoodName())) {
                    list.add(cb.like(nameField, '%' + food.getFoodName() + '%'));
                }
                //创建时间
                if(StrUtil.isNotBlank(searchVo.getStartDate())&&StrUtil.isNotBlank(searchVo.getEndDate())){
                    Date start = DateUtil.parse(searchVo.getStartDate());
                    Date end = DateUtil.parse(searchVo.getEndDate());
                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }

    /**
     * @Author 后羿i
     * @Description 保存菜品
     * @Date  13:43
     * @Param [food]
     * @Return com.minshang.erp.modules.food.entity.Food
     **/
    @Override
    public Food saveFood(Food food) {
        //通过物品单位id获取物品名称
        ShopUnit shopUnit = shopUnitDao.getOne(food.getShopUnitId());
        food.setShopUnitName(shopUnit.getShopUnitName());
        return foodDao.save(food);
    }

    @Override
    public Food editFood(Food food) {
        //通过物品单位id获取物品名称
        ShopUnit shopUnit = shopUnitDao.getOne(food.getShopUnitId());
        Food foodDaoOne = foodDao.getOne(food.getId());
        foodDaoOne.setShopUnitName(shopUnit.getShopUnitName());
        foodDaoOne.setFoodName(food.getFoodName());
        foodDaoOne.setFoodPicture(food.getFoodPicture());
        foodDaoOne.setFoodPrice(food.getFoodPrice());
        foodDaoOne.setIsPrice(food.getIsPrice());
        foodDaoOne.setIsRecommendFood(food.getIsRecommendFood());
        return foodService.update(foodDaoOne);
    }

    @Override
    public List<Food> findByFoodTypeId(String foodTypeId) {
        return  foodDao.foodList(foodTypeId);
    }


}