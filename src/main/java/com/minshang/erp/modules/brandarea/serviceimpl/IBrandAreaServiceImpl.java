package com.minshang.erp.modules.brandarea.serviceimpl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.brandarea.mapper.BrandAreaMapper;
import com.minshang.erp.modules.brandarea.service.IBrandAreaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName IBrandAreaServiceImpl
 * @Description 品牌区域业务层
 * @Author lcmaijia
 * @Date 2019/1/2 0002
 * @Version 1.0
 **/
@Service
public class IBrandAreaServiceImpl extends ServiceImpl<BrandAreaMapper, BrandArea> implements IBrandAreaService {

    @Resource
    private BrandAreaMapper brandAreaMapper;

    @Override
    public List<BrandArea> findByBrandAreaId(String brandAreaId) {
        return brandAreaMapper.findByBrandAreaId(brandAreaId);
    }
}