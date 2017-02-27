package com.gxh.mq.handler;

import com.gxh.dao.EventDao;
import com.gxh.dao.FollowDao;
import com.gxh.model.Follow;
import com.gxh.mq.Event;
import com.gxh.mq.EventHandler;
import com.gxh.mq.EventType;
import com.gxh.mq.ObjectType;
import com.gxh.service.RedisService;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundZSetOperations;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Component
public class UnFollowHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.UNFOLLOW;
    }

    @Override
    public void handle(Event event) {
        //在关系表里存入这个关注的关系
        long followerId = event.getCreatorId();
        long followingId = event.getObjectId();
        String keyPrefix;      //被关注的对象的key前缀
        switch (event.getObjectType()){
            case COLLECTION:
                keyPrefix = "collection";
                break;
            case QUESTION:
                keyPrefix = "question";
                break;
            case TOPIC:
                keyPrefix = "topic";
                break;
            case USER:
                keyPrefix = "user";
                break;
            default:
                return;
        }

        Follow follow = new Follow(followerId, followingId, event.getObjectType());
        followDao.removeFollow(follow);

        //在redis里更新关注者的关注表和被关注的对象的粉丝表
        String key = keyPrefix + followingId +"_followers";
        Set<Long> followersIds = redisService.getCacheSet(key);
        if(followersIds.isEmpty()){
            List<Long> followersIdsList = followDao.getFollowersIds(followingId, event.getObjectType().getValue());  //前面已经插入，不会为null
            followersIds = new HashSet<>(followersIdsList);
            if(!followersIds.isEmpty()) {
                redisService.setCacheSet(key, followersIds);
            }
        }else{
            redisService.removeFromCacheSet(key, followerId);
        }

        key = "user" + followerId +"_followings";
        Set<Long> followingsIds = redisService.getCacheSet(key);
        if(followingsIds.isEmpty()){
            List<Long> followingsIdsList = followDao.getFollowingsIds(followerId, event.getObjectType().getValue());  //前面已经插入，不会为null
            followingsIds = new HashSet<>(followingsIdsList);
            if(!followingsIds.isEmpty()) {
                redisService.setCacheSet(key, followingsIds);
            }
        }else{
            redisService.removeFromCacheSet(key, followingId);
        }

        if(event.getObjectType() == ObjectType.USER) {  //在feed表里去掉取消关注的人的动态
         //获取自己的feed，通过feed获取所有的event，去掉所有的event的creator是取消关注的人的
        }else {
            //在数据库的动态表里删掉原来关注的动态
            eventDao.removeEvent(event);
            //自己的动态表，粉丝的feed表里需要删吗？目前不删
        }
    }
}
