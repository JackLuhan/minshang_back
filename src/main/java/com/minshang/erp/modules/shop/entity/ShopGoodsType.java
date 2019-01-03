package com.minshang.erp.modules.shop.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Y 。
 */
@Data
@Entity
@Table(name = "t_shop_goods_type")
@TableName("t_shop_goods_type")
public class ShopGoodsType extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "物品类别编码")
    private String goodsTypeCode;
    @ApiModelProperty(value = "物品类别名称")
    private String goodsTypeName;

}