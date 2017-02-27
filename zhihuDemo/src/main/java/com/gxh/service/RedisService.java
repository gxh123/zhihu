package com.gxh.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

@Service
public class RedisService<T> {

    @Autowired
    public RedisTemplate redisTemplate;

    @Autowired
    public void setRedis(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
        //to solve \xac\xed\x00\x05t\x00
        this.redisTemplate.setKeySerializer(new StringRedisSerializer());
        this.redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
    }


    public BoundValueOperations<String, T> setCacheObject(String key, T value) {
        BoundValueOperations<String, T> operation = redisTemplate.boundValueOps(key);
        operation.set(value);
        return operation;
    }


    public <T> T getCacheObject(String key) {
        BoundValueOperations<String, T> operation = redisTemplate.boundValueOps(key);
        return operation.get();
    }


    public void delete(String key) {
        redisTemplate.delete(key);
    }


    public <T> ListOperations<String, T> setCacheList(String key, List<T> dataList) {
        ListOperations listOperation = redisTemplate.opsForList();
        if (null != dataList) {
            int size = dataList.size();
            for (int i = 0; i < size; i++) {
                listOperation.rightPush(key, dataList.get(i));
            }
        }
        return listOperation;
    }


    public <T> ListOperations<String, T> addToCacheList(String key, T data) {
        ListOperations listOperation = redisTemplate.opsForList();
        if (null != data) {
            listOperation.rightPush(key, data);
        }
        return listOperation;
    }


    public <T> List<T> getCacheList(String key) {
        ListOperations<String, T> listOperation = redisTemplate.opsForList();
        return listOperation.range(key, 0 , -1);
    }


    public <T> BoundSetOperations<String, T> setCacheSet(String key, Set<T> dataSet) {
        BoundSetOperations<String, T> setOperation = redisTemplate.boundSetOps(key);
        if(dataSet != null) {
            for (T data : dataSet) {
                setOperation.add(data);
            }
        }
        return setOperation;
    }


    public <T> BoundSetOperations<String, T> addToCacheSet(String key, T data) {
        BoundSetOperations<String, T> setOperation = redisTemplate.boundSetOps(key);
        if(data != null) {
            setOperation.add(data);
        }
        return setOperation;
    }


    public <T> BoundSetOperations<String, T> removeFromCacheSet(String key, T data) {
        BoundSetOperations<String, T> setOperation = redisTemplate.boundSetOps(key);
        if(data != null) {
            setOperation.remove(data);
        }
        return setOperation;
    }


    public Set<T> getCacheSet(String key) {
        BoundSetOperations<String, T> operation = redisTemplate.boundSetOps(key);
        return operation.members();
    }


    public boolean isInCacheSet(String key, T data) {
        BoundSetOperations<String, T> operation = redisTemplate.boundSetOps(key);
        return operation.isMember(data);
    }


    public Set<ZSetOperations.TypedTuple<T>> getCacheZSetWithScore(String key) {
        BoundZSetOperations<String, T> operation = redisTemplate.boundZSetOps(key);
        return operation.rangeWithScores(0,-1);
    }


    public Set<T> getReverseCacheZSet(String key) {
        BoundZSetOperations<String, T> operation = redisTemplate.boundZSetOps(key);
        return operation.reverseRange(0,-1);
    }


    public BoundZSetOperations<String, T> addSetToCacheZSet(String key, Set<ZSetOperations.TypedTuple<T>> set) {
        BoundZSetOperations<String, T> operation = redisTemplate.boundZSetOps(key);
        if(!set.isEmpty()) {
            operation.add(set);
        }
        return operation;
    }


    public <T> BoundZSetOperations<String, T> addToCacheZSet(String key, T value, double score) {
        BoundZSetOperations<String, T> operation = redisTemplate.boundZSetOps(key);
        operation.add(value, score);
        return operation;
    }


    public <T> HashOperations<String, String, T> setCacheMap(String key, Map<String, T> dataMap) {
        HashOperations hashOperations = redisTemplate.opsForHash();
        if (null != dataMap) {
            for (Map.Entry<String, T> entry : dataMap.entrySet()) {
                hashOperations.put(key, entry.getKey(), entry.getValue());
            }
        }
        return hashOperations;
    }


    public <T> Map<String, T> getCacheMap(String key) {
        Map<String, T> map = redisTemplate.opsForHash().entries(key);
        return map;
    }

}
