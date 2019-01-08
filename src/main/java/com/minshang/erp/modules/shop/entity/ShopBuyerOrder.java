package com.minshang.erp.modules.shop.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Y。
 */
@Data
@Entity
@Table(name = "t_shop_buyer_order")
@TableName("t_shop_buyer_order")
public class ShopBuyerOrder extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "门店物品订单id")
    private String shopGoodsOrderId;
    @ApiModelProperty(value = "单据号")
    private String documentNum;
    @ApiModelProperty(value = "采购门店id")
    private String orgId;
    @ApiModelProperty(value = "订货门店")
    private String orgName;
    @ApiModelProperty(value = "供应商id")
    private String supplierId;
    @ApiModelProperty(value = "供应商名称")
    private String supplierName;
    @ApiModelProperty(value = "订单类型")
    private String orderType;
    @ApiModelProperty(value = "采购金额")
    private BigDecimal price;
    @ApiModelProperty(value = "采购日期")
    private Date purchaseDate;
    @ApiModelProperty(value = "审核日期")
    private Date auditDate;
    @ApiModelProperty(value = "发货日期")
    private Date deliveryTime;

}