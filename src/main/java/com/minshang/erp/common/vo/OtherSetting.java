package com.minshang.erp.common.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class OtherSetting implements Serializable{

    @ApiModelProperty(value = "domain")
    private String domain;
}
