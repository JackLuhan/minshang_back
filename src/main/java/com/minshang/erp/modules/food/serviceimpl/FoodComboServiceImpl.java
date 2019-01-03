package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.modules.food.dao.FoodComboDao;
import com.minshang.erp.modules.food.entity.FoodCombo;
import com.minshang.erp.modules.food.service.FoodComboService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜品套餐接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodComboServiceImpl implements FoodComboService {

    @Autowired
    private FoodComboDao foodComboDao;

    @Override
    public FoodComboDao getRepository() {
        return foodComboDao;
    }
}