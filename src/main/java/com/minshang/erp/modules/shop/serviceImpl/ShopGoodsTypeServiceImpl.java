package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.dao.ShopGoodsTypeDao;
import com.minshang.erp.modules.shop.entity.ShopGoodsType;
import com.minshang.erp.modules.shop.service.ShopGoodsTypeService;
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
 * 物品类别接口实现
 * @author Y 。
 */
@Slf4j
@Service
@Transactional
public class ShopGoodsTypeServiceImpl implements ShopGoodsTypeService {

    @Autowired
    private ShopGoodsTypeDao shopGoodsTypeDao;

    @Override
    public ShopGoodsTypeDao getRepository() {
        return shopGoodsTypeDao;
    }

    @Override
    public Page<ShopGoodsType> findByCondition(ShopGoodsType shopGoodsType, SearchVo searchVo, Pageable pageable) {
        return shopGoodsTypeDao.findAll(new Specification<ShopGoodsType>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopGoodsType> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据仓库名称查询
                Path<String> nameField = root.get("goodsTypeName");
                Path<String> codeField = root.get("goodsTypeCode");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(shopGoodsType.getGoodsTypeName())) {
                    list.add(cb.like(nameField, '%' + shopGoodsType.getGoodsTypeName() + '%'));
                }
                //根据编码查询
                if(StrUtil.isNotBlank(shopGoodsType.getGoodsTypeCode())) {
                    list.add(cb.like(codeField, '%' + shopGoodsType.getGoodsTypeCode() + '%'));
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