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
@Table(name = "t_shop_buyer_stat")
@TableName("t_shop_buyer_stat")
public class ShopBuyerStat extends MinShangBaseEntity {

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
    @ApiModelProperty(value = "门店订货数量")
    private String indentNum;
    @ApiModelProperty(value = "当前库存")
    private String currentInventory;
    @ApiModelProperty(value = "已配送总量")
    private String totalDelivered;

}