package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.food.dao.FoodsDao;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.Foods;
import com.minshang.erp.modules.food.service.FoodsService;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
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
        //通过物品单位id获取物品名称
        ShopUnit shopUnit = shopUnitDao.getOne(foods.getShopUnitId());
        foods.setShopUnitName(shopUnit.getShopUnitName());
        return foodsDao.save(foods);
    }

    @Override
    public List<Foods> findByLevel(Integer level) {

        return foodsDao.findByLevel(level);
    }

    @Override
    public List<Foods> findByParentId(String parentId) {

        return foodsDao.findByParentId(parentId);
    }
}