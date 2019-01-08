package com.minshang.erp.modules.head.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * @author lcmaijia
 */
@Data
@Entity
@Table(name = "t_head_order")
@TableName("t_head_order")
public class HeadOrder extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "单据号")
    private String documentNo;

    @ApiModelProperty(value = "采购金额")
    private String buySum;

    @ApiModelProperty(value = "供应商id")
    private String supplierId;

    @CreatedDate
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "采购日期")
    private Date purchaseTime;

    @CreatedDate
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "收货日期")
    private Date deliveryTime;

    @Transient
    @TableField(exist = false)
    @ApiModelProperty(value = "供应商管理")
    private List<HeadSupplier> headSuppliers;


}