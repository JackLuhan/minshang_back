package com.minshang.erp.modules.organization.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.base.MinShangBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @ClassName OrgBrandArea
 * @Description 机构品牌区域关联
 * @Author lcmaijia
 * @Date 2019/1/3 0003
 * @Version 1.0
 **/
@Data
@Entity
@Table(name = "t_org_brandarea")
@TableName("t_org_brandarea")
public class OrgBrandArea extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "机构id")
    private String orgId;

    @ApiModelProperty(value = "品牌区域id")
    private String brandAreaId;

}