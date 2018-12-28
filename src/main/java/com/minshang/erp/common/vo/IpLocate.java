package com.minshang.erp.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class IpLocate implements Serializable {

    private String retCode;

    private City result;
}

