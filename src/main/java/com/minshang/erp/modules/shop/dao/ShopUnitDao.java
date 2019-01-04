package com.minshang.erp.modules.shop.dao;


import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 门店物品单位数据处理层
 * @author 后羿i
 */
public interface ShopUnitDao extends MinShangBaseDao<ShopUnit,String> {

    @Query(value = "select u from ShopUnit u where u.id =?1")
    List<ShopUnit> shopUnitList(String ShopUnitId);



}