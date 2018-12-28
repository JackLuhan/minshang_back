package com.minshang.erp.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class SearchVo implements Serializable {

    private String startDate;

    private String endDate;
}
