package com.minshang.erp.modules.brandarea.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName BrandAreaMapper
 * @Description 品牌区域mapper
 * @Author lcmaijia
 * @Date 2019/1/2 0002
 * @Version 1.0
 **/
public interface BrandAreaMapper extends BaseMapper<BrandArea> {

    /**
     * 通过用户id获取
     * @param brandAreaId
     * @return
     */
    List<BrandArea> findByBrandAreaId(@Param("brandAreaId") String brandAreaId);

}