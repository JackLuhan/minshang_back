package com.minshang.erp.modules.brandarea.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.brandarea.entity.BrandArea;

import java.util.List;

/**
 * 品牌区域数据处理层
 * @author lcmaijia
 */
public interface BrandAreaDao extends MinShangBaseDao<BrandArea,String> {

    List<BrandArea> findByBrandname(String brandname);
}