package com.minshang.erp.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class City implements Serializable {

    String country;

    String province;

    String city;
}
