package com.minshang.erp.config.exception;

import lombok.Data;

/**
 * @author houyi
 */
@Data
public class MinShangException extends RuntimeException {

    private String msg;

    public MinShangException(String msg){
        super(msg);
        this.msg = msg;
    }
}
