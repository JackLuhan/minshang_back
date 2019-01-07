package com.minshang.erp.modules.brandarea.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 品牌区域接口
 * @author lcmaijia
 */
public interface BrandAreaService extends MinShangBaseService<BrandArea,String> {

    Page<BrandArea> findByCondition(BrandArea brandArea, SearchVo searchVo, Pageable pageable);

    /**
     * 通过品牌区域名获取机构
     * @param brandname
     * @return
     */
    BrandArea findByBrandname(String brandname);
}