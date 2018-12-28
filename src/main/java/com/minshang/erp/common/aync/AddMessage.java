package com.minshang.erp.common.aync;

import com.minshang.erp.modules.base.entity.Message;
import com.minshang.erp.modules.base.entity.MessageSend;
import com.minshang.erp.modules.base.service.MessageSendService;
import com.minshang.erp.modules.base.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 异步添加消息
 * @author houyi
 */
@Component
public class AddMessage {

    @Autowired
    private MessageService messageService;

    @Autowired
    private MessageSendService messageSendService;

    @Async
    public void addSendMessage(String userId){

        // 获取需要创建账号发送的消息
        List<Message> messages = messageService.findByCreateSend(true);
        List<MessageSend> messageSends = new ArrayList<>();
        messages.forEach(item->{
            MessageSend ms = new MessageSend();
            ms.setUserId(userId);
            ms.setMessageId(item.getId());
            messageSends.add(ms);
        });
        if (messageSends.size()>0){
            messageSendService.saveOrUpdateAll(messageSends);
        }
    }
}
