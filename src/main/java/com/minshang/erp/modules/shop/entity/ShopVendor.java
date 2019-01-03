package com.minshang.erp.modules.shop.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Y 。
 */
@Data
@Entity
@Table(name = "t_shop_vendor")
@TableName("t_shop_vendor")
public class ShopVendor extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "供应商编码")
    private String vendorCode;
    @ApiModelProperty(value = "供应商名")
    private String vendorName;
    @ApiModelProperty(value = "联系人")
    private String name;
    @ApiModelProperty(value = "联系电话")
    private String phone;
    @ApiModelProperty(value = "备注")
    private String remark;
    @ApiModelProperty(value = "供应商类型（1，总部，2门店）")
    private String vendorType;
    @ApiModelProperty(value = "地址")
    private String address;
    @ApiModelProperty(value = "结算方式")
    private String closeType;
}