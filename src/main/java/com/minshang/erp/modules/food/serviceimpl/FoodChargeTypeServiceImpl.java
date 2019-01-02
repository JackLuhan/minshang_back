package com.minshang.erp.modules.food.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodChargeTypeDao;
import com.minshang.erp.modules.food.entity.FoodChargeType;
import com.minshang.erp.modules.food.entity.FoodChargeType;
import com.minshang.erp.modules.food.service.FoodChargeTypeService;
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
 * 菜品加料分类接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodChargeTypeServiceImpl implements FoodChargeTypeService {

    @Autowired
    private FoodChargeTypeDao foodChargeTypeDao;

    @Override
    public FoodChargeTypeDao getRepository() {
        return foodChargeTypeDao;
    }

    /**
     * @Author 后羿i
     * @Description //TODO 根据条件分页查询菜品加料分类
     * @Date  9:43 
     * @Param [foodChargeType, searchVo, pageable]
     * @Return org.springframework.data.domain.Page<com.minshang.erp.modules.food.entity.FoodChargeType>
     **/
    @Override
    public Page<FoodChargeType> findByCondition(FoodChargeType foodChargeType, SearchVo searchVo, Pageable pageable) {
        return foodChargeTypeDao.findAll(new Specification<FoodChargeType>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodChargeType> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodChargeTypeName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodChargeType.getFoodChargeTypeName())) {
                    list.add(cb.like(nameField, '%' + foodChargeType.getFoodChargeTypeName() + '%'));
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