package com.gxh.mq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class MessageQueueBackup {
    private String name;
    public RedisTemplate redisTemplate;

    @Autowired
    public void setRedis(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
        this.redisTemplate.setKeySerializer(new StringRedisSerializer());
    }

    public MessageQueueBackup() {
        name = "queue:event" ;
    }

    public MessageQueueBackup(String queueName) {
        name = "queue:" + queueName;
    }

    public void sendMessage(final String message) {
        if (message == null || message.length() == 0) {
            throw new IllegalArgumentException("message should not be null or empty");
        }
        redisTemplate.boundListOps(name).leftPush(message);
    }

    public String askForMessage(int timeout) {
        String message = (String) redisTemplate.boundListOps(name).rightPop(timeout, TimeUnit.SECONDS);
        return message;
    }
}

