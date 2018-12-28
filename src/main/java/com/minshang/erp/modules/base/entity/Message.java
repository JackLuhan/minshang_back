package com.minshang.erp.modules.base.entity;

import com.minshang.erp.base.MinShangBaseEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author houyi
 */
@Data
@Entity
@Table(name = "t_message")
@TableName("t_message")
public class Message extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "内容")
    private String content;

    @ApiModelProperty(value = "消息类型 0公告 1提醒 2私信")
    private Integer type;

    @ApiModelProperty(value = "新创建账号也推送")
    private Boolean createSend;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "发送范围")
    private Integer range;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "发送指定用户id")
    private String[] userIds;
}