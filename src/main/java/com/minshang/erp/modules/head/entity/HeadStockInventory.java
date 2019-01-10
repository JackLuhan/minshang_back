package com.minshang.erp.modules.head.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author lcmaijia
 */
@Data
@Entity
@Table(name = "t_head_stock_inventory")
@TableName("t_head_stock_inventory")
public class HeadStockInventory extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "单据号")
    private String documentNo;
    @ApiModelProperty(value = "盘点类型")
    private String stockTypes;



}