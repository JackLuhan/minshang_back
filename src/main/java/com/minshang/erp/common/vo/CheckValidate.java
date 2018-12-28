package com.minshang.erp.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class CheckValidate implements Serializable {

    private String userId;

    private String email;

    private String validateUrl;
}
