package com.minshang.erp.common.constant;

/**
 * @author houyi
 */
public interface SettingConstant {

    /**
     * 当前使用OSS
     */
    String OSS_USED = "OSS_USED";

    /**
     * 七牛OSS配置
     */
    String QINIU_OSS = "QINIU_OSS";

    /**
     * 七牛云存储区域 自动判断
     */
    Integer ZONE_AUTO = -1;

    /**
     * 七牛云存储区域 华东
     */
    Integer ZONE_ZERO = 0;

    /**
     * 七牛云存储区域 华北
     */
    Integer ZONE_ONE = 1;

    /**
     * 七牛云存储区域 华南
     */
    Integer ZONE_TWO = 2;

    /**
     * 七牛云存储区域 北美
     */
    Integer ZONE_THREE = 3;

    /**
     * 七牛云存储区域 东南亚
     */
    Integer ZONE_FOUR = 4;

    /**
     * 阿里OSS配置
     */
    String ALI_OSS = "ALI_OSS";

    /**
     * 本地OSS配置
     */
    String LOCAL_OSS = "LOCAL_OSS";

    /**
     * 当前使用短信
     */
    String SMS_USED = "SMS_USED";

    /**
     * 阿里短信配置
     */
    String ALI_SMS = "ALI_SMS";

    /**
     * 阿里短信 通用
     */
    String ALI_SMS_COMMON = "ALI_SMS_COMMON";

    /**
     * 阿里短信 登录验证码
     */
    String ALI_SMS_LOGIN = "ALI_SMS_LOGIN";

    /**
     * 阿里短信 注册验证码
     */
    String ALI_SMS_REGIST = "ALI_SMS_REGIST";

    /**
     * 阿里短信 修改手机
     */
    String ALI_SMS_CHANGE_MOBILE = "ALI_SMS_CHANGE_MOBILE";

    /**
     * 阿里短信 修改密码
     */
    String ALI_SMS_CHANG_PASS = "ALI_SMS_CHANG_PASS";

    /**
     * 阿里短信 重置密码
     */
    String ALI_SMS_RESET_PASS = "ALI_SMS_RESET_PASS";

    /**
     * 邮箱配置
     */
    String EMAIL_SETTING = "EMAIL_SETTING";

    /**
     * vapthca验证码配置
     */
    String VAPTCHA_SETTING = "VAPTCHA_SETTING";

    /**
     * 其他配置
     */
    String OTHER_SETTING = "OTHER_SETTING";
}
