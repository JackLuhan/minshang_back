package com.minshang.erp.common.constant;

import java.math.BigDecimal;
import java.util.PrimitiveIterator;

/**
 * 常量
 * @author houyi
 */
public interface CommonConstant {

    /**
     * 用户默认头像
     */
    String USER_DEFAULT_AVATAR = "https://s1.ax1x.com/2018/05/19/CcdVQP.png";

    /**
     * 用户正常状态
     */
    Integer USER_STATUS_NORMAL = 0;

    /**
     * 用户禁用状态
     */
    Integer USER_STATUS_LOCK = 1;

    /**
     * 普通用户
     */
    Integer USER_TYPE_NORMAL = 0;

    /**
     * 管理员
     */
    Integer USER_TYPE_ADMIN = 1;

    /**
     * 全部数据权限
     */
    Integer DATA_TYPE_ALL = 0;

    /**
     * 自定义数据权限
     */
    Integer DATA_TYPE_CUSTOM = 1;

    /**
     * 性别男
     */
    Integer SEX_MAN = 0;

    /**
     * 性别女
     */
    Integer SEX_WOMAN = 1;

    /**
     * 性别保密
     */
    Integer SEX_SECRET = 2;

    /**
     * 正常状态
     */
    Integer STATUS_NORMAL = 0;

    /**
     * 禁用状态
     */
    Integer STATUS_DISABLE = -1;

    /**
     * 删除标志
     */
    Integer DEL_FLAG = 1;

    /**
     * 限流标识
     */
    String LIMIT_ALL = "XBOOT_LIMIT_ALL";

    /**
     * 页面类型权限
     */
    Integer PERMISSION_PAGE = 0;

    /**
     * 操作类型权限
     */
    Integer PERMISSION_OPERATION = 1;

    /**
     * 1级菜单父id
     */
    String PARENT_ID = "0";

    /**
     * 1级菜单
     */
    Integer LEVEL_ONE = 1;

    /**
     * 2级菜单
     */
    Integer LEVEL_TWO = 2;

    /**
     * 3级菜单
     */
    Integer LEVEL_THREE = 3;

    /**
     * 消息发送范围
     */
    Integer MESSAGE_RANGE_ALL = 0;

    /**
     * 公告
     */
    Integer MESSAGE_TYPE_SYSTEM = 0;

    /**
     * 提醒
     */
    Integer MESSAGE_TYPE_REMIND = 1;

    /**
     * 私信
     */
    Integer MESSAGE_TYPE_PERSONAL = 2;

    /**
     * 未读
     */
    Integer MESSAGE_STATUS_UNREAD = 0;

    /**
     * 已读
     */
    Integer MESSAGE_STATUS_READ = 1;

    /**
     * github登录
     */
    Integer SOCIAL_TYPE_GITHUB = 0;

    /**
     * qq登录
     */
    Integer SOCIAL_TYPE_QQ = 1;

    /**
     * 微博登录
     */
    Integer SOCIAL_TYPE_WEIBO = 2;

    /**
     * 短信验证码key前缀
     */
    String PRE_SMS = "XBOOT_PRE_SMS:";

    /**
     * 邮件验证码key前缀
     */
    String PRE_EMAIL = "XBOOT_PRE_EMAIL:";

    /**
     * 本地文件存储
     */
    Integer OSS_LOCAL = 0;

    /**
     * 七牛云OSS存储
     */
    Integer OSS_QINIU = 1;

    /**
     * 阿里云OSS存储
     */
    Integer OSS_ALI = 2;

    /**
     * 默认加价方式 0表示不加价
     */
    Integer PRICE_UP_TYPE_NO =0;

    /**
     * 默认加价方式 1表示加价
     */
    Integer PRICE_UP_TYPE_YES =1;

    BigDecimal PRICE_UP_VALUE_NO= BigDecimal.valueOf(0);
    /**
     * 是否时价 0 是时价 1 不是时价
     */
    Integer IS_PRICE_YES=0;
    Integer IS_PRICE_NO=1;

    /**
     * 是否时推荐菜 0 推荐 1 不推荐
     */
    Integer IS_RECOMMEND_FOOD_YES=0;
    Integer IS_RECOMMEND_FOOD_NO=1;
}
