package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodSpecDao;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.entity.FoodSpec;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodSpecService;
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
 * 菜品规格接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodSpecServiceImpl implements FoodSpecService {

    @Autowired
    private FoodSpecDao foodSpecDao;
    @Resource
    private FoodSpecService foodSpecService;

    @Override
    public FoodSpecDao getRepository() {
        return foodSpecDao;
    }


    //菜品规格根据条件分页查询
    @Override
    public Page<FoodSpec> findByCondition(FoodSpec foodSpec, SearchVo searchVo, Pageable pageable) {

        return foodSpecDao.findAll(new Specification<FoodSpec>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodSpec> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodSpecName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodSpec.getFoodSpecName())) {
                    list.add(cb.like(nameField, '%' + foodSpec.getFoodSpecName() + '%'));
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
    public FoodSpec editFoodSpec(FoodSpec foodSpec) {
        //根据id查询单个菜品分类数据
        FoodSpec foodSpecOne = foodSpecDao.getOne(foodSpec.getId());
        foodSpecOne.setFoodSpecName(foodSpec.getFoodSpecName());
        return foodSpecService.update(foodSpecOne);
    }
}