package com.minshang.erp.modules.shop.serviceImpl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.minshang.erp.modules.shop.entity.ShopUnit;
import com.minshang.erp.modules.shop.mapper.ShopUnitMapper;
import com.minshang.erp.modules.shop.service.IShopUnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName ShopUnitServiceImpl
 * @Description 物品列表逻辑层
 * @Author 后羿i
 * @Date 2018/12/27
 * @Version 1.0
 **/
@Service
public class IShopUnitServiceImpl extends ServiceImpl<ShopUnitMapper, ShopUnit> implements IShopUnitService {
    @Resource
    private ShopUnitMapper shopUnitMapper;

    @Override
    public Integer insertShopUnit(ShopUnit shopUnit) {
        return shopUnitMapper.insertShopUnit(shopUnit);
    }
}