package com.minshang.erp.modules.food.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
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
@Table(name = "t_food_combo")
@TableName("t_food_combo")
public class FoodCombo extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品套餐名称")
    private String foodComboName;
    @ApiModelProperty(value = "菜品套餐名称")
    private String foodComboType;
    @ApiModelProperty(value = "原价")
    private BigDecimal price;
    @ApiModelProperty(value = "套餐价")
    private BigDecimal originalPrice;
    @ApiModelProperty(value = "会员价")
    private BigDecimal vipPrice;
    @ApiModelProperty(value = "菜品分类id")
    private String foodTypeId;

}