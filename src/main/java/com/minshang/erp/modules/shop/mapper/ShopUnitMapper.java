package com.minshang.erp.modules.shop.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName ShopUnitMapper
 * @Description 物品单位mapper接口
 * @Author 后羿i
 * @Date 2018/12/27
 * @Version 1.0
 **/
public interface ShopUnitMapper extends BaseMapper<ShopUnit> {

    Integer insertShopUnit(ShopUnit shopUnit);

    List<ShopUnit>findByShopUnitId(@Param("shopUnitId") String shopUnitId);
}