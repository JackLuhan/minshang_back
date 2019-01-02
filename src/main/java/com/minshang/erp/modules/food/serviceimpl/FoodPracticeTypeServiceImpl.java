package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodPracticeTypeDao;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.service.FoodPracticeTypeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 菜品做法分类接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodPracticeTypeServiceImpl implements FoodPracticeTypeService {

    @Autowired
    private FoodPracticeTypeDao foodPracticeTypeDao;
    @Autowired
    private FoodPracticeTypeService foodPracticeTypeService;

    @Override
    public FoodPracticeTypeDao getRepository() {
        return foodPracticeTypeDao;
    }

    //菜品规格根据条件分页查询
    @Override
    public Page<FoodPracticeType> findByCondition(FoodPracticeType foodPracticeType, SearchVo searchVo, Pageable pageable) {

        return foodPracticeTypeDao.findAll(new Specification<FoodPracticeType>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodPracticeType> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodPracticeTypeName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodPracticeType.getFoodPracticeTypeName())) {
                    list.add(cb.like(nameField, '%' + foodPracticeType.getFoodPracticeTypeName() + '%'));
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

    @Override
    public FoodPracticeType editFoodPracticeType(FoodPracticeType foodPracticeType) {
        //根据id查询单个菜品分类数据
        FoodPracticeType foodPracticeTypeOne = foodPracticeTypeDao.getOne(foodPracticeType.getId());
        foodPracticeTypeOne.setFoodPracticeTypeName(foodPracticeType.getFoodPracticeTypeName());
        return foodPracticeTypeService.update(foodPracticeTypeOne);
    }
}