package com.minshang.erp.modules.food.serviceimpl;

import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.food.dao.FoodLibDao;
import com.minshang.erp.modules.food.entity.FoodLib;
import com.minshang.erp.modules.food.service.FoodLibService;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
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
 * 菜品库接口实现
 * @author 后羿i
 */
@Slf4j
@Service
@Transactional
public class FoodLibServiceImpl implements FoodLibService {

    @Autowired
    private FoodLibDao foodLibDao;
    @Autowired
    private FoodLibService foodLibService;

    @Override
    public FoodLibDao getRepository() {
        return foodLibDao;
    }

    //菜品根据条件分页查询
    @Override
    public Page<FoodLib> findByCondition(FoodLib foodLib, SearchVo searchVo, Pageable pageable) {

        return foodLibDao.findAll(new Specification<FoodLib>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<FoodLib> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据菜品库名字查询
                Path<String> nameField = root.get("foodLibName");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(foodLib.getFoodLibName())) {
                    list.add(cb.like(nameField, '%' + foodLib.getFoodLibName() + '%'));
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

    //根据菜品库id更新状态
    public FoodLib updateById(FoodLib foodLib){
        //根据id查询获取所有的数据
        FoodLib foodLib1 = foodLibService.get(foodLib.getId());
        //更改状态为1 禁用
        if (foodLib1.getStatus()==0){
            //禁用
            foodLib1.setStatus(CommonConstant.USER_STATUS_LOCK);
        }else {
            //启用
            foodLib1.setStatus(CommonConstant.USER_STATUS_NORMAL);
        }
        return  foodLibService.update(foodLib1);
    }

}