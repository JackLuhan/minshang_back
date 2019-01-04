package com.minshang.erp.modules.shop.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @ClassName ShopUnit
 * @Description 物品单位实体类
 * @Author 后羿i
 * @Date 2018/12/27
 * @Version 1.0
 **/
@Data
@Entity
@Table(name = "t_shop_unit")
@TableName("t_shop_unit")
public class ShopUnit extends MinShangBaseEntity {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "物品单位编号")
    private String shopUnitCode;

    @ApiModelProperty(value = "物品单位名称")
    private String shopUnitName;

    /*@OneToMany(targetEntity = ShopGoods.class,mappedBy ="shopUnit" )
    private List<ShopGoods> shopGoodsList;*/
}