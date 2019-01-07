package com.minshang.erp.modules.shop.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Y。
 */
@Data
@Entity
@Table(name = "t_shop_buyer_order")
@TableName("t_shop_buyer_order")
public class ShopBuyerOrder extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "物品单位id")
    private String shopUnitId;
    @ApiModelProperty(value = "物品单位")
    private String shopUnitName;
    @ApiModelProperty(value = "机构id")
    private String orgId;
    @ApiModelProperty(value = "订货门店")
    private String orgName;
    @ApiModelProperty(value = "单据号")
    private String documentNum;
    @ApiModelProperty(value = "门店订货数量")
    private String indentNum;
    @ApiModelProperty(value = "已配送总量")
    private String totalDelivered;

}