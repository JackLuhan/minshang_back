package com.minshang.erp.modules.head.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.head.entity.HeadOrder;

import java.util.List;

/**
 * 总部订单管理数据处理层
 * @author lcmaijia
 */
public interface HeadOrderDao extends MinShangBaseDao<HeadOrder,String> {

    List<HeadOrder> findByDocumentNo(String documentNo);

}