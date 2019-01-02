package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodPracticeDao;
import com.minshang.erp.modules.food.dao.FoodPracticeTypeDao;
import com.minshang.erp.modules.food.entity.FoodPractice;
import com.minshang.erp.modules.food.entity.FoodPractice;
import com.minshang.erp.modules.food.entity.FoodPracticeType;
import com.minshang.erp.modules.food.service.FoodPracticeService;
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
 * 菜品做法接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodPracticeServiceImpl implements FoodPracticeService {

    @Autowired
    private FoodPracticeDao foodPracticeDao;
    @Autowired
    private FoodPracticeTypeDao foodPracticeTypeDao;

    @Override
    public FoodPracticeDao getRepository() {
        return foodPracticeDao;
    }

    @Override
    public Page<FoodPractice> findByCondition(FoodPractice foodPractice, SearchVo searchVo, Pageable pageable) {

        return foodPracticeDao.findAll(new Specification<FoodPractice>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodPractice> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodPracticeName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodPractice.getFoodPracticeName())) {
                    list.add(cb.like(nameField, '%' + foodPractice.getFoodPracticeName() + '%'));
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
    public FoodPractice saveFoodPractice(FoodPractice foodPractice) {
        //通过菜品做法id获取菜品做法名称
        FoodPracticeType foodPracticeType = foodPracticeTypeDao.getOne(foodPractice.getFoodPracticeTypeId());
        foodPractice.setFoodPracticeTypeName(foodPracticeType.getFoodPracticeTypeName());
        return foodPracticeDao.save(foodPractice);
    }
}