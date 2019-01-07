package com.minshang.erp.modules.food.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
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
@Table(name = "t_food_spec")
@TableName("t_food_spec")
public class FoodSpec extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品规格名称")
    private String foodSpecName;

    @ApiModelProperty(value = "机构id")
    private String orgId;

    @ApiModelProperty(value = "菜品库id")
    private String foodLibId;

}