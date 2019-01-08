package com.minshang.erp.modules.head.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author lcmaijia
 */
@Data
@Entity
@Table(name = "t_head_goods_order")
@TableName("t_head_goods_order")
public class HeadGoodsOrder extends MinShangBaseEntity {

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
    @ApiModelProperty(value = "总部订单id")
    private String headrderOId;
    @ApiModelProperty(value = "单据号")
    private String documentNo;
    @ApiModelProperty(value = "总部采购数量")
    private String indentNum;
    @ApiModelProperty(value = "总部收货数量")

    private String deliveryNum;
    @ApiModelProperty(value = "备注")
    private String remark;

}