package com.minshang.erp.modules.base.dao;

import com.minshang.erp.base.MinShangBaseDao;
import com.minshang.erp.modules.base.entity.MessageSend;

/**
 * 消息发送数据处理层
 * @author houyi
 */
public interface MessageSendDao extends MinShangBaseDao<MessageSend,String> {

    /**
     * 通过消息id删除
     * @param messageId
     */
    void deleteByMessageId(String messageId);
}