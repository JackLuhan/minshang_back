package com.minshang.erp.modules.food.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.common.constant.CommonConstant;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author 后羿i
 */
@Data
@Entity
@Table(name = "t_food_charge")
@TableName("t_food_charge")
public class FoodCharge extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "菜品加料名称")
    private String foodChargeName;
    @ApiModelProperty(value = "菜品加料价格")
    private BigDecimal foodChargePrice;

    @ApiModelProperty(value = "菜品加料分类id")
    private String foodChargeTypeId;

    @ApiModelProperty(value = "菜品加料分类名称")
    private String foodChargeTypeName;

    @ApiModelProperty(value = "机构id")
    private String orgId;

}