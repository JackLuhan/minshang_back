package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 总部供应商接口
 * @author lcmaijia
 */
public interface HeadSupplierService extends MinShangBaseService<HeadSupplier,String> {

    Page<HeadSupplier> findByCondition(HeadSupplier headSupplier, SearchVo searchVo, Pageable pageable);

    /**
     * 通过总部供应商名获取机构
     * @param supplierName
     * @return
     */
    HeadSupplier findBySupplierName(String supplierName);

    /**
     * 通过总部供应商编码获取机构
     * @param supplierCode
     * @return
     */
    HeadSupplier findBySupplierCode(String supplierCode);


}