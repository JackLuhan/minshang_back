package com.minshang.erp.modules.head.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.junit.experimental.theories.Theory;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author lcmaijia
 */
@Data
@Entity
@Table(name = "t_head_stock_inventory_goods")
@TableName("t_head_stock_inventory_goods")
public class HeadStockInventoryGoods extends MinShangBaseEntity {

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
    @ApiModelProperty(value = "总部盘点id")
    private String headStockInventoryId;
    @ApiModelProperty(value = "单据号")
    private String documentNo;
    @ApiModelProperty(value = "理论数")
    private String theoryNum;
    @ApiModelProperty(value = "实盘数")
    private String firmOfferNum;
    @ApiModelProperty(value = "实盘金额")
    private String firmOfferSum;
    @ApiModelProperty(value = "理论差异")
    private String theoryDifference;
    @ApiModelProperty(value = "差异金额")
    private String differenceSum;
    @ApiModelProperty(value = "备注")
    private String remark;



}