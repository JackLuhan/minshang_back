package com.minshang.erp.modules.head.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.dao.HeadGoodsOrderDao;
import com.minshang.erp.modules.head.dao.HeadOrderDao;
import com.minshang.erp.modules.head.entity.HeadGoodsOrder;
import com.minshang.erp.modules.head.entity.HeadOrder;
import com.minshang.erp.modules.head.service.HeadGoodsOrderService;
import com.minshang.erp.modules.head.service.HeadOrderService;
import com.minshang.erp.modules.shop.dao.ShopGoodsDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopGoods;
import com.minshang.erp.modules.shop.entity.ShopGoodsOrder;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopGoodsService;
import com.minshang.erp.modules.shop.service.ShopUnitService;
import io.micrometer.core.lang.Nullable;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 总部物品订单接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadGoodsOrderServiceImpl implements HeadGoodsOrderService {

    @Autowired
    private HeadGoodsOrderDao headGoodsOrderDao;
    @Autowired
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private ShopGoodsService shopGoodsService;
    @Autowired
    private ShopGoodsDao shopGoodsDao;
    @Autowired
    private HeadGoodsOrderService headGoodsOrderService;
    @Autowired
    private HeadOrderService headOrderService;
    @Autowired
    private HeadOrderDao headOrderDao;


    @Override
    public HeadGoodsOrderDao getRepository() {
        return headGoodsOrderDao;
    }

    @Override
    public HeadGoodsOrder saveHeadGoodsOrder(HeadGoodsOrder headGoodsOrder) {
        ShopUnit shopUnit = shopUnitService.get(headGoodsOrder.getShopUnitId());
        ShopGoods shopGoods = shopGoodsService.get(headGoodsOrder.getShopGoodsId());
        HeadOrder headOrder = headOrderService.get(headGoodsOrder.getHeadOrderId());
        headGoodsOrder.setShopUnitName(shopUnit.getShopUnitName());
        headGoodsOrder.setGoodsCode(shopGoods.getGoodsCode());
        headGoodsOrder.setGoodsName(shopGoods.getGoodsName());
        headGoodsOrder.setGoodsPrice(shopGoods.getGoodsPrice());
        headGoodsOrder.setDocumentNo(headOrder.getDocumentNo());
        headGoodsOrder.setIndentNum(headGoodsOrder.getIndentNum());
        headGoodsOrder.setDeliveryNum(headGoodsOrder.getDeliveryNum());
        headGoodsOrder.setRemark(headGoodsOrder.getRemark());
        return headGoodsOrderDao.save(headGoodsOrder);
    }

    @Override
    public HeadGoodsOrder editHeadGoodsOrder(HeadGoodsOrder headGoodsOrder) {
        HeadGoodsOrder headGoodsOrderOne = headGoodsOrderDao.getOne(headGoodsOrder.getId());
        ShopUnit shopUnitDaoOne = shopUnitDao.getOne(headGoodsOrder.getShopUnitId());
        ShopGoods shopGoodsDaoOne = shopGoodsDao.getOne(headGoodsOrder.getShopGoodsId());
        HeadOrder orderDaoOne = headOrderDao.getOne(headGoodsOrder.getHeadOrderId());
        headGoodsOrderOne.setShopUnitName(shopUnitDaoOne.getShopUnitName());
        headGoodsOrderOne.setGoodsName(shopGoodsDaoOne.getGoodsName());
        headGoodsOrderOne.setGoodsPrice(shopGoodsDaoOne.getGoodsPrice());
        headGoodsOrderOne.setGoodsCode(shopGoodsDaoOne.getGoodsCode());
        headGoodsOrderOne.setDocumentNo(orderDaoOne.getDocumentNo());
        headGoodsOrderOne.setIndentNum(headGoodsOrder.getIndentNum());
        headGoodsOrderOne.setDeliveryNum(headGoodsOrder.getDeliveryNum());
        headGoodsOrderOne.setRemark(headGoodsOrder.getRemark());
        return headGoodsOrderService.update(headGoodsOrderOne);
    }

    @Override
    public Page<HeadGoodsOrder> findByCondition(HeadGoodsOrder headGoodsOrder, SearchVo searchVo, Pageable pageable) {
        return headGoodsOrderDao.findAll(new Specification<HeadGoodsOrder>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<HeadGoodsOrder> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据单据号查询
                Path<String> nameField = root.get("documentNo");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //根据物品名称查询
                if(StrUtil.isNotBlank(headGoodsOrder.getDocumentNo())) {
                    list.add(cb.like(nameField, '%' + headGoodsOrder.getDocumentNo() + '%'));
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