package com.minshang.erp.modules.base.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.social.QQ;

/**
 * qq登录数据处理层
 * @author houyi
 */
public interface QQDao extends MinShangBaseDao<QQ,String> {

    /**
     * 通过openId获取
     * @param openId
     * @return
     */
    QQ findByOpenId(String openId);

    /**
     * 通过username获取
     * @param username
     * @return
     */
    QQ findByRelateUsername(String username);
}