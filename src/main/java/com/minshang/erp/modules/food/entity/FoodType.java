package com.minshang.erp.modules.food.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.minshang.erp.common.constant.CommonConstant;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 后羿i
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "t_food_type")
@TableName("t_food_type")
public class FoodType extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品库id")
    private String foodLibId;

    @ApiModelProperty(value = "父id")
    //默认为0
    private String pid = CommonConstant.PARENT_ID;

    @ApiModelProperty(value = "菜品分类名称")
    private String foodTypeName;

    @ApiModelProperty(value = "菜品编码")
    private String foodCode;

}