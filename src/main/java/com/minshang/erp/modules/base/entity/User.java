package com.minshang.erp.modules.base.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.minshang.erp.base.MinShangBaseEntity;
import com.minshang.erp.common.constant.CommonConstant;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * @author houyi
 */
@Data
@Entity
@Table(name = "t_user")
@TableName("t_user")
public class User extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户名")
    @Column(unique = true,nullable = false)
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "手机")
    private String mobile;

    @ApiModelProperty(value = "邮件")
    private String email;

    @ApiModelProperty(value = "省市县地址")
    private String address;

    @ApiModelProperty(value = "街道地址")
    private String street;

    @ApiModelProperty(value = "0女 1男 2保密")
    private Integer sex;

    @ApiModelProperty(value = "密码强度")
    @Column(length=2)
    private String passStrength;

    @ApiModelProperty(value = "用户头像")
    @Column(length=1000)
    private String avatar = CommonConstant.USER_DEFAULT_AVATAR;

    @ApiModelProperty(value = "用户类型 0普通用户 1管理员")
    private Integer type = CommonConstant.USER_TYPE_NORMAL;

    @ApiModelProperty(value = "状态 默认0正常 -1拉黑")
    private Integer status = CommonConstant.USER_STATUS_NORMAL;

    @ApiModelProperty(value = "描述/详情/备注")
    private String description;

    @ApiModelProperty(value = "所属部门id")
    private String departmentId;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "所属部门名称")
    private String departmentTitle;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "用户拥有角色")
    private List<Role> roles;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "用户拥有的权限")
    private List<Permission> permissions;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "导入数据时使用")
    private Integer defaultRole;

    // 原有人员表————添加字段
    @ApiModelProperty(value = "真实姓名")
    private String name;

    @ApiModelProperty(value = "出身日期")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm")
    private Date birth;

    @ApiModelProperty(value = "爱好")
    private String hobby;

    @ApiModelProperty(value = "机构id")
    private String orgId;


}
