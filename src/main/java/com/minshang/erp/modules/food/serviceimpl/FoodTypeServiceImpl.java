package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodTypeDao;
import com.minshang.erp.modules.food.entity.Food;
import com.minshang.erp.modules.food.entity.FoodType;
import com.minshang.erp.modules.food.service.FoodTypeService;
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
    public Page<FoodType> findByCondition(FoodType foodType, SearchVo searchVo, Pageable pageable) {
        return foodTypeDao.findAll(new Specification<FoodType>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodType> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodTypeName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodType.getFoodTypeName())) {
                    list.add(cb.like(nameField, '%' + foodType.getFoodTypeName() + '%'));
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