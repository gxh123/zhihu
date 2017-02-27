package com.gxh.service;

import com.gxh.dao.FollowDao;
import com.gxh.mq.Event;
import com.gxh.mq.EventType;
import com.gxh.mq.MessageProducer;
import com.gxh.mq.ObjectType;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import java.util.*;

@Service
public class FollowService {

    @Autowired
    RedisService redisService;

    @Autowired
    MessageProducer messageProducer;

    @Autowired
    FollowDao followDao;

    /**
     * 用户关注了某个关注用户,问题，话题
     * @return
     */
    public void follow(long creatorId, long objectId, ObjectType type)
    {
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(creatorId, EventType.FOLLOW, type, objectId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }

    /**
     * 取消关注
     * @return
     */
    public void unfollow(long creatorId, long objectId, ObjectType type) {
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(creatorId, EventType.UNFOLLOW, type, objectId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }

    //getFollowers （对象：用户、话题、问题 获取关注它的用户）
    public List<Long> getFollowers(long objectId, ObjectType objectType){
        //先在redis里找，找不到就到数据库里找
        String key = objectType.toString() + objectId + "_followers";
        Set<Long> followingIds = redisService.getCacheSet(key);
        if(followingIds.isEmpty()){
            List<Long> followersIdsList = followDao.getFollowersIds(objectId, objectType.getValue());
            followingIds = new HashSet<>(followersIdsList);
            if(!followingIds.isEmpty()) {
                redisService.setCacheSet(key, followingIds);
            }
        }
        return new ArrayList<>(followingIds);
    }

    public int getFollowersCount(long objectId, ObjectType objectType){
        return getFollowers(objectId, objectType).size();
    }

    //getFollowings 用户关注的对象（用户、话题、问题）
    public List<Long> getFollowings(long userId, ObjectType objectType){
        //先在redis里找，找不到就到数据库里找
        String key = "user" + userId + "_followings_" + objectType.toString();
        Set<Long> followingIds = redisService.getCacheSet(key);
        if(followingIds.isEmpty()){
            List<Long> followersIdsList = followDao.getFollowingsIds(userId, objectType.getValue());
            followingIds = new HashSet<>(followersIdsList);
            if(!followingIds.isEmpty()) {
                redisService.setCacheSet(key, followingIds);
            }
        }
        return new ArrayList<>(followingIds);
    }

    public int getFollowingsCount(long userId, ObjectType objectType){
        return getFollowings(userId, objectType).size();
    }

    /**
     *  判断用户是否关注了某个对象
     * @return
     */
    public boolean isFollower(long userId, ObjectType objectType, long objectId)
    {
        String keyPrefix = null;      //被关注的对象的key前缀
        switch (objectType){
            case COLLECTION:
                keyPrefix = "collection";break;
            case QUESTION:
                keyPrefix = "question";break;
            case TOPIC:
                keyPrefix = "topic";break;
            case USER:
                keyPrefix = "user";break;
        }
        String key = keyPrefix + objectId + "_followers";
        return redisService.isInCacheSet(key, userId);
    }


}
