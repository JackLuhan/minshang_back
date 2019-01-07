package com.minshang.erp.modules.section.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import com.minshang.erp.modules.food.entity.Organization;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * @author lcmaijia
 */
@Data
@Entity
@Table(name = "t_section")
@TableName("t_section")
public class Section extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "部门名称")
    private String sectionname;

    @ApiModelProperty(value = "所属机构id")
    private String orgId;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "机构")
    private List<Organization> organizations;

}