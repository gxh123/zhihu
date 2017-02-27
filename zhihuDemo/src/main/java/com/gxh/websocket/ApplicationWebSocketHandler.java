package com.gxh.websocket;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.gxh.model.Message;
import com.gxh.model.UserHolder;
import com.gxh.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.socket.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ApplicationWebSocketHandler implements WebSocketHandler {

    public static final Map<Long, WebSocketSession> users = new HashMap<Long, WebSocketSession>();

    @Autowired
    private UserHolder userHolder;

    @Autowired
    private MessageService messageService;

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        long uid = userHolder.getUser().getId();
        users.put(uid, session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String content = (String) message.getPayload();
        long uid = Long.parseLong(content);
        int count = messageService.getUnReadMessageCount(uid);
        sendMessageToUser(uid , new TextMessage(count + ""));
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        users.remove(session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        users.remove(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 给某个用户发送消息
     *
     * @param userId
     * @param message
     */
    public void sendMessageToUser(long userId, TextMessage message) {
        WebSocketSession session = users.get(userId);
        if (session != null && session.isOpen()) {
            try {
                session.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
