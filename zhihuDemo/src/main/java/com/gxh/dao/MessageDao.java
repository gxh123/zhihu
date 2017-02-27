package com.gxh.dao;

import com.gxh.model.Message;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MessageDao
{
    int addMessage(Message message);

    int updateStatusByMessageId(@Param("id") long id, @Param("status") int status);

    int updateStatusByConversationId(@Param("id") String id, @Param("status") int status);

    List<Message> getConversationDetail(@Param("conversationId") String conversationId);

    //查询私信消息列表
    List<Message> getConversationList(long userId);

    //查询私信消息未读数量
    int getConvesationUnreadCount(@Param("userId") long userId, @Param("conversationId") String conversationId);
}
