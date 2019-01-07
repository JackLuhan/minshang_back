package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadDepot;
import com.minshang.erp.modules.head.entity.HeadOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 总部订单管理接口
 * @author lcmaijia
 */
public interface HeadOrderService extends MinShangBaseService<HeadOrder,String> {

    Page<HeadOrder> findByCondition(HeadOrder headOrder, SearchVo searchVo, Pageable pageable);

    /**
     * 通过单据号获取订单
     * @param documentNo
     * @return
     */
    HeadOrder findByDocumentNo(String documentNo);
}