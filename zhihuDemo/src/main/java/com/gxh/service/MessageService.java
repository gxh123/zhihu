package com.gxh.service;

import com.gxh.dao.MessageDao;
import com.gxh.model.Message;
import com.gxh.websocket.ApplicationWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    MessageDao messageDao;

    public int getUnReadMessageCount(long userId) {  //返回用户的未读消息
        int count = 0;
        List<Message> conversationList = messageDao.getConversationList(userId);
        for(Message message : conversationList) {
            count += messageDao.getConvesationUnreadCount(userId, message.getConversationId());
        }
        return count;
    }

    public void storeMessage(Message message){
        messageDao.addMessage(message);
    }

    public void updateStatusByMessageId(long id, int status){
        messageDao.updateStatusByMessageId(id, status);
    }

    public void updateStatusByConversationId(String id, int status){
        messageDao.updateStatusByConversationId(id, status);
    }

    public List<Message> getMessageList(String conversationId){   //获取某个对话列表
        return messageDao.getConversationDetail(conversationId);
    }

    public List<Message> getConversationList(long userId){   //获取所有对话列表
        return messageDao.getConversationList(userId);
    }

    //查询私信消息未读数量
    public int getConvesationUnreadCount(long userId, String conversationId){
        return messageDao.getConvesationUnreadCount(userId, conversationId);
    }

}
