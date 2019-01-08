package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodLibDao;
import com.minshang.erp.modules.food.dao.FoodSpecDao;
import com.minshang.erp.modules.food.dao.FoodsDao;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodSpec;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodsService;
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
public class FoodsServiceImpl implements FoodsService {

    @Autowired
    private FoodsDao foodsDao;
    @Resource
    private ShopUnitDao shopUnitDao;
    @Resource
    private FoodLibDao foodLibDao;
    @Resource
    private FoodSpecDao foodSpecDao;
    @Autowired
    private FoodsService foodsService;

    @Override
    public FoodsDao getRepository() {
        return foodsDao;
    }

    /**
     * @Author 后羿i
     * @Description 保存菜品
     * @Date  13:43
     * @Param [food]
     * @Return com.minshang.erp.modules.food.entity.Foods
     **/
    @Override
    public Foods saveFoods(Foods foods) {
        //如果菜品的级别是1的话 则设置名称为空
        if(foods.getLevel().equals(CommonConstant.LEVEL_ONE)){
            foods.setShopUnitName("");
            foods.setShopUnitName("");
            foods.setFoodSpecName("");
            foods.setParentId("");
        }else {
            //通过物品单位id获取物品名称
            ShopUnit shopUnit = shopUnitDao.getOne(foods.getShopUnitId());
            foods.setShopUnitName(shopUnit.getShopUnitName());
            //通过菜品库id获取菜品库名称
            FoodLib foodLib = foodLibDao.getOne(foods.getFoodLibId());
            foods.setFoodLibName(foodLib.getFoodLibName());
            //通过菜品分类id获取菜品库名称
            FoodSpec foodSpec = foodSpecDao.getOne(foods.getFoodSpecId());
            foods.setFoodSpecName(foodSpec.getFoodSpecName());
        }

        return foodsDao.save(foods);
    }

    @Override
    public Foods editFoods(Foods foods) {
        //通过物品单位id获取物品名称
        ShopUnit shopUnit = shopUnitDao.getOne(foods.getShopUnitId());
        //通过菜品库id获取菜品库名称
        FoodLib foodLib = foodLibDao.getOne(foods.getFoodLibId());
        //通过菜品分类id获取菜品库名称
        FoodSpec foodSpec = foodSpecDao.getOne(foods.getFoodSpecId());
        Foods foodDaoOne = foodsDao.getOne(foods.getId());
        foodDaoOne.setShopUnitName(shopUnit.getShopUnitName());
        foodDaoOne.setFoodLibName(foodLib.getFoodLibName());
        foodDaoOne.setFoodSpecName(foodSpec.getFoodSpecName());
        foodDaoOne.setName(foods.getName());
        foodDaoOne.setFoodPicture(foods.getFoodPicture());
        foodDaoOne.setFoodPrice(foods.getFoodPrice());
        foodDaoOne.setIsPrice(foods.getIsPrice());
        foodDaoOne.setIsRecommendFood(foods.getIsRecommendFood());
        return foodsService.update(foodDaoOne);
    }
    /**
     * @Author 后羿i
     * @Description 通过水平查找
     * @Date  15:32
     * @Param [level]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    @Override
    public List<Foods> findByLevelAndFoodLibId(Integer level,String foodLibId) {

        return foodsDao.findByLevelAndFoodLibId(level,foodLibId);
    }

    /**
     * @Author 后羿i
     * @Description 通过父id查询
     * @Date  15:32
     * @Param [parentId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    @Override
    public List<Foods> findByParentId(String parentId) {

        return foodsDao.findByParentId(parentId);
    }

    /**
     * @Author 后羿i
     * @Description  通过菜品库id查询
     * @Date  15:33
     * @Param [foodLibId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    @Override
    public List<Foods> findByFoodLibId(String foodLibId) {
        return foodsDao.findByFoodLibId(foodLibId);
    }

    /**
     * @Author 后羿i
     * @Description 根据菜品库id和菜品规格id查询属于该规格下的菜品数据
     * @Date  16:24
     * @Param [foodLibId, foodSpecId]
     * @Return java.util.List<com.minshang.erp.modules.food.entity.Foods>
     **/
    @Override
    public List<Foods> findByFoodLibIdAndFoodSpecId(String foodLibId,String foodSpecId) {
        return foodsDao.findByFoodLibIdAndFoodSpecId(foodLibId,foodSpecId);
    }

    /**
     * @Author 后羿i
     * @Description 根据条件分页查询菜品
     * @Date  13:43
     * @Param [food, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.Food>
     **/
    @Override
    public Page<Foods> findByCondition(Foods foods, SearchVo searchVo, Pageable pageable) {
        return foodsDao.findAll(new Specification<Foods>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<Foods> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("name");
                Path<String> idField = root.get("parentId");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();
                if(StrUtil.isNotBlank(foods.getParentId())) {
                    list.add(cb.like(idField, foods.getParentId()));
                }
                //模糊搜素
                if(StrUtil.isNotBlank(foods.getName())) {
                    list.add(cb.like(nameField, '%' + foods.getName() + '%'));
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
}