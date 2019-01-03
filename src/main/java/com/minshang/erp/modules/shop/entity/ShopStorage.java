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
@Table(name = "t_shop_storage")
@TableName("t_shop_storage")
public class ShopStorage extends MinShangBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "仓库编码")
    private String storageCode;
    @ApiModelProperty(value = "仓库名称")
    private String storageName;
    @ApiModelProperty(value = "仓库类别")
    private String storageType;
}