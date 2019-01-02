package com.minshang.erp.modules.food.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 后羿i
 */
@Data
@Entity
@Table(name = "t_food_charge_type")
@TableName("t_food_charge_type")
public class FoodChargeType extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "菜品加料分类名称")
    private String foodChargeTypeName;

}