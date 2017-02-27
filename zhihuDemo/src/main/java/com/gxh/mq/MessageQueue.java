package com.gxh.mq;

import com.gxh.service.RedisService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class MessageQueue {

    private String name;
    public RedisTemplate redisTemplate;

    @Autowired
    public void setRedis(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
        this.redisTemplate.setKeySerializer(new StringRedisSerializer());
    }

    public MessageQueue() {
        name = "queue:event" ;
    }

    public MessageQueue(String queueName) {
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

