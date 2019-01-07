package com.minshang.erp.modules.head.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.entity.HeadSupplier;

import java.util.List;

/**
 * 总部供应商数据处理层
 * @author lcmaijia
 */
public interface HeadSupplierDao extends MinShangBaseDao<HeadSupplier,String> {


    /**
     *
     * @param supplierName
     * @return
     */
    List<HeadSupplier> findBySupplierName(String supplierName);

    /**
     *
     * @param supplierCode
     * @return
     */
    List<HeadSupplier> findBySupplierCode(String supplierCode);

}