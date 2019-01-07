package com.minshang.erp.modules.head.service;

import com.minshang.erp.base.MinShangBaseService;
import com.minshang.erp.common.vo.SearchVo;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 总部供应商接口
 * @author lcmaijia
 */
public interface HeadSupplierService extends MinShangBaseService<HeadSupplier,String> {

    Page<HeadSupplier> findByCondition(HeadSupplier headSupplier, SearchVo searchVo, Pageable pageable);
}