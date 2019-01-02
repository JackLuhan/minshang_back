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
@Table(name = "t_food")
@TableName("t_food")
public class Food extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜品名称")
    private String foodName;

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

    @ApiModelProperty(value = "菜品分类id")
    private String foodTypeId;



}