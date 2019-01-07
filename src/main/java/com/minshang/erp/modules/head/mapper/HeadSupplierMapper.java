package com.minshang.erp.modules.head.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName HeadSupplierMapper
 * @Description 总部供应商mapper
 * @Author lcmaijia
 * @Date 2019/1/7 000716:22
 * @Version 1.0
 **/
public interface HeadSupplierMapper extends BaseMapper<HeadSupplier> {

    /**
     * 通过总部供应商id获取
     * @param headSupplierId
     * @return
     */
    List<HeadSupplier> findByHeadSupplierId(@Param("headSupplierId") String headSupplierId);
}
