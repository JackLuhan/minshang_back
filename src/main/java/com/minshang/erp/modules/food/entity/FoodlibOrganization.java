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
@Table(name = "t_foodlib_organization")
@TableName("t_foodlib_organization")
public class FoodlibOrganization extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品库唯一id")
    private String foodLibId;

    @ApiModelProperty(value = "机构唯一id")
    private String orgId;

}