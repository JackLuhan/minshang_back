package com.minshang.erp.modules.shop.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * @author Y 。
 */
@Data
@Entity
@Table(name = "t_shop_goods")
@TableName("t_shop_goods")
public class ShopGoods extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "物品单位id")
    private String shopUnitId;
    @ApiModelProperty(value = "物品类别id")
    private String shopGoodsTypeId;
    @ApiModelProperty(value = "物品编码")
    private String goodsCode;
    @ApiModelProperty(value = "物品名称")
    private String goodsName;
    @ApiModelProperty(value = "物品类别")
    private String goodsTypeName;
    @ApiModelProperty(value = "物品单位")
    private String shopUnitName;
    @ApiModelProperty(value = "采购价格")
    private BigDecimal goodsPrice;
    @ApiModelProperty(value = "总部最低库存")
    private String headquartersMinimumInventory;
    @ApiModelProperty(value = "总部最高库存")
    private String headquartersHighestInventory;
    @ApiModelProperty(value = "采购类型")
    private String orderType;
    @ApiModelProperty(value = "盘点类型")
    private String checkType;
//    //    @Transient
////    @TableField(exist=false)
////    @ApiModelProperty(value = "单位")
////    private List<ShopUnit> shopUnitList;
//    @ManyToOne(fetch = FetchType.LAZY)
//// 默认 lazy ，通过懒加载，知道需要使用级联的数据，
//// 才去数据库查询这个数据，提高查询效率。
//// 设置外键的问题
//    @JoinColumn(name = "shopUnitId", foreignKey = @ForeignKey
//            (name = "none", value = ConstraintMode.NO_CONSTRAINT))
//    private ShopUnit shopUnit;

}