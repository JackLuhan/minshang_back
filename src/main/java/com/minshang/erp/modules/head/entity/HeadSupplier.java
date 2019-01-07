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
@Table(name = "t_head_supplier")
@TableName("t_head_supplier")
public class HeadSupplier extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "供应商编码")
    private String supplierCode;

    @ApiModelProperty(value = "供应商名称")
    private String supplierName;

    @ApiModelProperty(value = "联系人")
    private String linkman;

    @ApiModelProperty(value = "联系电话")
    private String linkmanPhone;

    @ApiModelProperty(value = "结算方式")
    private String sfds;

    @ApiModelProperty(value = "备注")
    private String remark;

}