package com.minshang.erp.modules.base.entity.social;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author houyi
 */
@Data
@Entity
@Table(name = "t_weibo")
@TableName("t_weibo")
public class Weibo extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "微博唯一id")
    private String openId;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "是否绑定账号 默认false")
    private Boolean isRelated = false;

    @ApiModelProperty(value = "绑定用户账号")
    private String relateUsername;
}