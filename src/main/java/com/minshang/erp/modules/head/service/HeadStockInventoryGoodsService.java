package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadStockInventoryGoods;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 总部盘点商品接口
 * @author lcmaijia
 */
public interface HeadStockInventoryGoodsService extends MinShangBaseService<HeadStockInventoryGoods,String> {

    //总部盘点物品保存
    HeadStockInventoryGoods saveHeadStockInventoryGoods(HeadStockInventoryGoods headStockInventoryGoods);
    //总部物盘点物品修改
    HeadStockInventoryGoods editHeadStockInventoryGoods(HeadStockInventoryGoods headStockInventoryGoods);
    //多条件分页获取
    Page<HeadStockInventoryGoods> findByCondition(HeadStockInventoryGoods headStockInventoryGoods, SearchVo searchVo, Pageable pageable);
}