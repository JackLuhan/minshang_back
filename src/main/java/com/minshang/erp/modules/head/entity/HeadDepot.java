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
@Table(name = "t_head_depot")
@TableName("t_head_depot")
public class HeadDepot extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "仓库编码")
    private String depotCode;

    @ApiModelProperty(value = "仓库名称")
    private String depotName;



}