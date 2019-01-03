package com.minshang.erp.modules.shop.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import com.minshang.erp.modules.shop.entity.ShopVendor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 门店供应商接口
 * @author Y 。
 */
public interface ShopVendorService extends MinShangBaseService<ShopVendor,String> {
    Page<ShopVendor> findByCondition(ShopVendor shopVendor, SearchVo searchVo, Pageable pageable);
}
