package com.minshang.erp.modules.head.serviceimpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.dao.HeadStockInventoryDao;
import com.minshang.erp.modules.head.dao.HeadStockInventoryGoodsDao;
import com.minshang.erp.modules.head.entity.HeadGoodsOrder;
import com.minshang.erp.modules.head.entity.HeadStockInventory;
import com.minshang.erp.modules.head.entity.HeadStockInventoryGoods;
import com.minshang.erp.modules.head.service.HeadStockInventoryGoodsService;
import com.minshang.erp.modules.head.service.HeadStockInventoryService;
import com.minshang.erp.modules.shop.dao.ShopGoodsDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopGoods;
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
 * 总部盘点商品接口实现
 * @author lcmaijia
 */
@Slf4j
@Service
@Transactional
public class HeadStockInventoryGoodsServiceImpl implements HeadStockInventoryGoodsService {

    @Autowired
    private HeadStockInventoryGoodsService headStockInventoryGoodsService;
    @Autowired
    private HeadStockInventoryGoodsDao headStockInventoryGoodsDao;
    @Autowired
    private ShopUnitService shopUnitService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private ShopGoodsService shopGoodsService;
    @Autowired
    private ShopGoodsDao shopGoodsDao;
    @Autowired
    private HeadStockInventoryService headStockInventoryService;
    @Autowired
    private HeadStockInventoryDao headStockInventoryDao;


    @Override
    public HeadStockInventoryGoodsDao getRepository() {
        return headStockInventoryGoodsDao;
    }

    @Override
    public HeadStockInventoryGoods saveHeadStockInventoryGoods(HeadStockInventoryGoods headStockInventoryGoods) {
        ShopUnit shopUnit = shopUnitService.get(headStockInventoryGoods.getShopUnitId());
        ShopGoods shopGoods = shopGoodsService.get(headStockInventoryGoods.getShopGoodsId());
        HeadStockInventory headStockInventory = headStockInventoryService.get(headStockInventoryGoods.getHeadStockInventoryId());
        headStockInventoryGoods.setShopUnitName(shopUnit.getShopUnitName());
        headStockInventoryGoods.setGoodsCode(shopGoods.getGoodsCode());
        headStockInventoryGoods.setGoodsName(shopGoods.getGoodsName());
        headStockInventoryGoods.setGoodsPrice(shopGoods.getGoodsPrice());
        headStockInventoryGoods.setDocumentNo(headStockInventory.getDocumentNo());
        headStockInventoryGoods.setTheoryNum(headStockInventoryGoods.getTheoryNum());
        headStockInventoryGoods.setFirmOfferNum(headStockInventoryGoods.getFirmOfferSum());
        headStockInventoryGoods.setFirmOfferSum(headStockInventoryGoods.getFirmOfferSum());
        headStockInventoryGoods.setTheoryDifference(headStockInventoryGoods.getTheoryDifference());
        headStockInventoryGoods.setDifferenceSum(headStockInventoryGoods.getDifferenceSum());
        headStockInventoryGoods.setRemark(headStockInventoryGoods.getRemark());
        return headStockInventoryGoodsDao.save(headStockInventoryGoods);
    }

    @Override
    public HeadStockInventoryGoods editHeadStockInventoryGoods(HeadStockInventoryGoods headStockInventoryGoods) {
        HeadStockInventoryGoods headStockInventoryGoodsDaoOne = headStockInventoryGoodsDao.getOne(headStockInventoryGoods.getId());
        ShopUnit shopUnitDaoOne = shopUnitDao.getOne(headStockInventoryGoods.getShopUnitId());
        ShopGoods shopGoodsDaoOne = shopGoodsDao.getOne(headStockInventoryGoods.getShopGoodsId());
        HeadStockInventory headStockInventoryDaoOne = headStockInventoryDao.getOne(headStockInventoryGoods.getHeadStockInventoryId());
        headStockInventoryGoodsDaoOne.setShopUnitName(shopUnitDaoOne.getShopUnitName());
        headStockInventoryGoodsDaoOne.setGoodsName(shopGoodsDaoOne.getGoodsName());
        headStockInventoryGoodsDaoOne.setGoodsCode(shopGoodsDaoOne.getGoodsCode());
        headStockInventoryGoodsDaoOne.setGoodsPrice(shopGoodsDaoOne.getGoodsPrice());
        headStockInventoryGoodsDaoOne.setDocumentNo(headStockInventoryDaoOne.getDocumentNo());
        headStockInventoryGoodsDaoOne.setTheoryNum(headStockInventoryGoods.getTheoryNum());
        headStockInventoryGoodsDaoOne.setFirmOfferNum(headStockInventoryGoods.getFirmOfferNum());
        headStockInventoryGoodsDaoOne.setFirmOfferSum(headStockInventoryGoods.getFirmOfferSum());
        headStockInventoryGoodsDaoOne.setTheoryDifference(headStockInventoryGoods.getTheoryDifference());
        headStockInventoryGoodsDaoOne.setDifferenceSum(headStockInventoryGoods.getDifferenceSum());
        headStockInventoryGoodsDaoOne.setRemark(headStockInventoryGoods.getRemark());
        return headStockInventoryGoodsService.update(headStockInventoryGoodsDaoOne);
    }

    @Override
    public Page<HeadStockInventoryGoods> findByCondition(HeadStockInventoryGoods headStockInventoryGoods, SearchVo searchVo, Pageable pageable) {
        return headStockInventoryGoodsDao.findAll(new Specification<HeadStockInventoryGoods>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<HeadStockInventoryGoods> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据盘点单据号查询
                Path<String> nameField = root.get("documentNo");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //根据盘点单据号查询
                if(StrUtil.isNotBlank(headStockInventoryGoods.getDocumentNo())) {
                    list.add(cb.like(nameField, '%' + headStockInventoryGoods.getDocumentNo() + '%'));
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