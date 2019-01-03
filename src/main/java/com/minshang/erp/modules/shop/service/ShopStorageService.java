package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopStorage;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 门店仓库接口
 * @author Y 。
 */
public interface ShopStorageService extends MinShangBaseService<ShopStorage,String> {
    Page<ShopStorage> findByCondition(ShopStorage ShopStorage, SearchVo searchVo, Pageable pageable);
}