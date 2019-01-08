package com.minshang.erp.modules.food.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.common.constant.CommonConstant;
import com.minshang.erp.modules.base.entity.Permission;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author 后羿i
 */
@Data
@Entity
@Table(name = "t_foods")
@TableName("t_foods")
public class Foods extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "层级")
    private Integer level;

    @ApiModelProperty(value = "菜品/分类名称")
    private String name;

    @ApiModelProperty(value = "菜品价格")
    private BigDecimal foodPrice;

    @ApiModelProperty(value = "菜品单位")
    private String shopUnitName;

    @ApiModelProperty(value = "单位id")
    private String shopUnitId;

    @ApiModelProperty(value = "菜品图片")
    private String foodPicture;

    @ApiModelProperty(value = "是否时价 0 时价 1 不时价")
    private Integer isPrice= CommonConstant.IS_PRICE_NO;

    @ApiModelProperty(value = "是否时价 0 推荐 1 不推荐")
    private Integer isRecommendFood= CommonConstant.IS_RECOMMEND_FOOD_NO;

    @ApiModelProperty(value = "父id")
    private String parentId;

    @ApiModelProperty(value = "菜品库id")
    private String foodLibId;

    @ApiModelProperty(value = "菜品库id")
    private String foodLibName;

    @ApiModelProperty(value = "菜品规格id")
    private String foodSpecId;
    @ApiModelProperty(value = "菜品规格名称")
    private String foodSpecName;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "菜品")
    private List<Foods> children;



}