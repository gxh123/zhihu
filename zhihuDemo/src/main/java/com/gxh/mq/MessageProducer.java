package com.gxh.mq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageProducer {
    @Autowired
    private MessageQueue messageQueue;

    public void sendMessage(String message) {
        messageQueue.sendMessage(message);
    }
}
