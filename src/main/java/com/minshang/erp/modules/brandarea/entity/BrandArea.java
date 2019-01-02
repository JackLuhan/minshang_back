package com.minshang.erp.modules.brandarea.entity;

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
@Table(name = "t_brand_area")
@TableName("t_brand_area")
public class BrandArea extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "品牌名称")
    private String brandname;

    @ApiModelProperty(value = "区域名称")
    private String areaname;



}