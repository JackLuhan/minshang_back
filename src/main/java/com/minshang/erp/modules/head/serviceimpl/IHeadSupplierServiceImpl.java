package com.minshang.erp.modules.head.serviceimpl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.minshang.erp.modules.head.entity.HeadSupplier;
import com.minshang.erp.modules.head.mapper.HeadSupplierMapper;
import com.minshang.erp.modules.head.service.IHeadSupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName IHeadSupplierServiceImpl
 * @Description 总部供应商业务层
 * @Author lcmaijia
 * @Date 2019/1/8 0008
 * @Version 1.0
 **/
@Service
public class IHeadSupplierServiceImpl extends ServiceImpl<HeadSupplierMapper, HeadSupplier> implements IHeadSupplierService {

    @Resource
    private HeadSupplierMapper headSupplierMapper;

    @Override
    public List<HeadSupplier> findByHeadSupplierId(String supplierId) {
        return headSupplierMapper.findByHeadSupplierId(supplierId);
    }
}