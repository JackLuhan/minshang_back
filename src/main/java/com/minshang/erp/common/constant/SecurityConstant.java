package com.minshang.erp.common.constant;

/**
 * @author houyi
 */
public interface SecurityConstant {

    /**
     * token分割
     */
    String TOKEN_SPLIT = "Bearer ";

    /**
     * JWT签名加密key
     */
    String JWT_SIGN_KEY = "minshang";

    /**
     * token参数头
     */
    String HEADER = "accessToken";

    /**
     * 权限参数头
     */
    String AUTHORITIES = "authorities";

    /**
     * 用户选择JWT保存时间参数头
     */
    String SAVE_LOGIN = "saveLogin";

    /**
     * github保存state前缀key
     */
    String GITHUB_STATE = "XBOOT_GITHUB_";

    /**
     * qq保存state前缀key
     */
    String QQ_STATE = "XBOOT_QQ_";

    /**
     * qq保存state前缀key
     */
    String WEIBO_STATE = "XBOOT_WEIBO_";
}
