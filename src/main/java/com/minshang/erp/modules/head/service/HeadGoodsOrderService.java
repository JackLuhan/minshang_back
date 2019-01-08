package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadGoodsOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 总部物品订单接口
 * @author lcmaijia
 */
public interface HeadGoodsOrderService extends MinShangBaseService<HeadGoodsOrder,String> {

    //门店物品订单保存
    HeadGoodsOrder saveHeadGoodsOrder(HeadGoodsOrder headGoodsOrder);
    //门店物品订单修改
    HeadGoodsOrder editHeadGoodsOrder(HeadGoodsOrder headGoodsOrder);
    //多条件分页获取
    Page<HeadGoodsOrder> findByCondition(HeadGoodsOrder headGoodsOrder, SearchVo searchVo, Pageable pageable);

}