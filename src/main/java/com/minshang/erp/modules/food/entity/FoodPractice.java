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
@Table(name = "t_food_practice")
@TableName("t_food_practice")
public class FoodPractice extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品做法名称")
    private String foodPracticeName;

    @ApiModelProperty(value = "菜品做法分类id")
    private String foodPracticeTypeId;

    @ApiModelProperty(value = "菜品做法分类名称")
    private String foodPracticeTypeName;

    @ApiModelProperty(value = "默认加价方式 不加价")
    private Integer priceUpType= CommonConstant.PRICE_UP_TYPE_NO;

    @ApiModelProperty(value = "默认加价金额 0元")
    private BigDecimal priceUpValue =CommonConstant.PRICE_UP_VALUE_NO;

    @ApiModelProperty(value = "机构id")
    private String orgId;

}