package com.minshang.erp.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author houyi
 */
@Data
public class RelateUserInfo implements Serializable{

    private String githubId;

    private Boolean github = false;

    private String githubUsername;

    private String qqId;

    private Boolean qq = false;

    private String qqUsername;

    private String weiboId;

    private Boolean weibo = false;

    private String weiboUsername;
}
