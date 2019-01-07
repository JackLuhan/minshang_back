package com.minshang.erp.modules.shop.serviceImpl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.dao.ShopBuyerStatDao;
import com.minshang.erp.modules.shop.dao.ShopGoodsDao;
import com.minshang.erp.modules.shop.dao.ShopUnitDao;
import com.minshang.erp.modules.shop.entity.ShopBuyerStat;
import com.minshang.erp.modules.shop.entity.ShopGoods;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.service.ShopBuyerStatService;
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
 * 门店采购统计接口实现
 * @author Y。
 */
@Slf4j
@Service
@Transactional
public class ShopBuyerStatServiceImpl implements ShopBuyerStatService {

    @Autowired
    private ShopBuyerStatDao shopBuyerStatDao;
    @Autowired
    private ShopBuyerStatService shopBuyerStatService;
    @Autowired
    private ShopGoodsDao shopGoodsDao;
    @Autowired
    private ShopGoodsService shopGoodsService;
    @Autowired
    private ShopUnitDao shopUnitDao;
    @Autowired
    private ShopUnitService shopUnitService;

    @Override
    public ShopBuyerStatDao getRepository() {
        return shopBuyerStatDao;
    }

    @Override
    public ShopBuyerStat saveShopBuyerStat(ShopBuyerStat shopBuyerStat) {
        ShopUnit shopUnit = shopUnitService.get(shopBuyerStat.getShopUnitId());
        ShopGoods shopGoods = shopGoodsService.get(shopBuyerStat.getShopGoodsId());
        shopBuyerStat.setGoodsName(shopGoods.getGoodsName());
        shopBuyerStat.setGoodsCode(shopGoods.getGoodsCode());
        shopBuyerStat.setShopUnitName(shopUnit.getShopUnitName());
        shopBuyerStat.setIndentNum(shopBuyerStat.getIndentNum());
        shopBuyerStat.setCurrentInventory(shopBuyerStat.getCurrentInventory());
        shopBuyerStat.setTotalDelivered(shopBuyerStat.getTotalDelivered());
        return shopBuyerStatDao.save(shopBuyerStat);
    }

    @Override
    public ShopBuyerStat editShopBuyerStat(ShopBuyerStat shopBuyerStat) {
        ShopBuyerStat shopBuyerStatOne = shopBuyerStatDao.getOne(shopBuyerStat.getId());
        ShopUnit shopUnit = shopUnitDao.getOne(shopBuyerStat.getShopUnitId());
        ShopGoods shopGoods = shopGoodsDao.getOne(shopBuyerStat.getShopGoodsId());
        shopBuyerStatOne.setGoodsName(shopGoods.getGoodsName());
        shopBuyerStatOne.setGoodsCode(shopGoods.getGoodsCode());
        shopBuyerStatOne.setShopUnitName(shopUnit.getShopUnitName());
        shopBuyerStatOne.setTotalDelivered(shopBuyerStat.getTotalDelivered());
        shopBuyerStatOne.setCurrentInventory(shopBuyerStat.getCurrentInventory());
        shopBuyerStatOne.setIndentNum(shopBuyerStat.getIndentNum());
        return shopBuyerStatService.update(shopBuyerStatOne);
    }

    @Override
    public Page<ShopBuyerStat> findByCondition(ShopBuyerStat shopBuyerStat, SearchVo searchVo, Pageable pageable) {
        return shopBuyerStatDao.findAll(new Specification<ShopBuyerStat>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<ShopBuyerStat> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                //根据原材料名字查询
                Path<String> nameField = root.get("goodsName");
                //根据原材料名字查询
                Path<String> codeField = root.get("goodsCode");

                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                //模糊搜素
                if(StrUtil.isNotBlank(shopBuyerStat.getGoodsName())) {
                    list.add(cb.like(nameField, '%' + shopBuyerStat.getGoodsName() + '%'));
                }
                //根据原材料编码搜索
                if(StrUtil.isNotBlank(shopBuyerStat.getGoodsCode())) {
                    list.add(cb.like(nameField, '%' + shopBuyerStat.getGoodsCode() + '%'));
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