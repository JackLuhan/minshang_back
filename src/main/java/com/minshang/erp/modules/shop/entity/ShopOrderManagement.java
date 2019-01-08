package com.minshang.erp.modules.shop.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author Y。
 */
@Data
@Entity
@Table(name = "t_shop_order_management")
@TableName("t_shop_order_management")
public class ShopOrderManagement extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "物品单位id")
    private String shopUnitId;
    @ApiModelProperty(value = "物品单位")
    private String shopUnitName;
    @ApiModelProperty(value = "原材料id")
    private String shopGoodsId;
    @ApiModelProperty(value = "物品编码")
    private String goodsCode;
    @ApiModelProperty(value = "物品名称")
    private String goodsName;
    @ApiModelProperty(value = "采购价格")
    private BigDecimal goodsPrice;
    @ApiModelProperty(value = "订货数量")
    private String indentNum;
    @ApiModelProperty(value = "发货数量")
    private String quantityShipped;
    @ApiModelProperty(value = "总价")
    private BigDecimal deliveryAmount;
    @ApiModelProperty(value = "总部备注")
    private BigDecimal headquartersRemark;
    @ApiModelProperty(value = "门店备注")
    private BigDecimal shopRemark;
}