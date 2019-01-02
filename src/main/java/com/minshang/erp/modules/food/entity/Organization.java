package com.minshang.erp.modules.food.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.modules.base.entity.Permission;
import com.minshang.erp.modules.brandarea.entity.BrandArea;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.List;

/**
 * @author 后羿i
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "t_organization")
@TableName("t_organization")
public class Organization extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "父id")
    private String parentId;

    @ApiModelProperty(value = "机构名称")
    private String orgName;

    // 原有机构表————添加字段

    @ApiModelProperty(value = "机构类型0：公司1：门店")
    private String orgType;

    @ApiModelProperty(value = "机构类型0：直营1：加盟")
    private String shoptype;

    @ApiModelProperty(value = "联系电话")
    private String telphoneno;

    @ApiModelProperty(value = "详细地址")
    private String address;

    @ApiModelProperty(value = "门店管理员")
    private String shopUser;

    @ApiModelProperty(value = "激活码")
    private String activationkey;

    @ApiModelProperty(value = "品牌区域id")
    private String brandAreaId;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "品牌区域")
    private List<BrandArea> brandArea;

}