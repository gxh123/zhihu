package com.gxh.mq.handler;

import com.gxh.dao.EventDao;
import com.gxh.dao.FollowDao;
import com.gxh.model.Follow;
import com.gxh.model.User;
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

import java.util.*;

@Component
public class FollowHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    public void handle(Event event) {
        //在关系表里存入这个关注的关系
        long followerId = event.getCreatorId();
        long followingId = event.getObjectId();
        String keyPrefix;      //被关注的对象的key前缀
        switch (event.getObjectType()){
            case COLLECTION:
                System.out.println("关注collection：" + followingId);
                keyPrefix = "collection";
                break;
            case QUESTION:
                System.out.println("关注question：" + followingId);
                keyPrefix = "question";
                break;
            case TOPIC:
                System.out.println("关注topic：" + followingId);
                keyPrefix = "topic";
                break;
            case USER:
                System.out.println("关注user：" + followingId);
                keyPrefix = "user";
                break;
            default:
                return;
        }

        Follow follow = new Follow(followerId, followingId, event.getObjectType());
        followDao.addFollow(follow);

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
            redisService.addToCacheSet(key, followerId);
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
            redisService.addToCacheSet(key, followingId);
        }

        //目前设定用户的feed里只存关注的人的动态，不存问题的、话题的...
        if(event.getObjectType() == ObjectType.USER) {  //被关注的对象是人时，关注者在自己的feed表里加入被关注的人的动态
            key = keyPrefix + followingId + "_events";
            Set<ZSetOperations.TypedTuple<Long>> followingActionWithTime = redisService.getCacheZSetWithScore(key);
            //redis里没有被关注人的动态，则从数据库里取，默认取500条，不足则有多少取多少
            if(followingActionWithTime.isEmpty()){
                List<Event> events = eventDao.getEventsByCreatorId(followingId);
                for(Event event1 : events){
                    String eventId = "event" + UUID.randomUUID().toString().replace("-", "");
                    redisService.setCacheObject(eventId, JsonUtil.toJson(event1));
                    followingActionWithTime.add(new DefaultTypedTuple(eventId,
                            (double)event1.getCreateTime().getTime()));
                }
                if (!followingActionWithTime.isEmpty()) {
                    redisService.addSetToCacheZSet(key, followingActionWithTime);
                }
            }
            //从数据库取完
            key = "user" + followerId + "_feeds";
            //Set<ZSetOperations.TypedTuple<Long>> followerFeedWithTime = redisService.getCacheZSetWithScore(key);
            //redis里没有关注者的动态，目前设计这里不需要从数据库里取
            BoundZSetOperations<String, Long> operations = redisService.addSetToCacheZSet(key, followingActionWithTime);
            if (operations.size() > 500) {
                operations.removeRange(0, -501);  ////限定长度为500，超过500条则删掉时间早的
            }
        }else{    //被关注的对象是人时，需要在动态表里增加这个动态
            //在数据库的动态表里增加
            eventDao.addEvent(event);
            //在redis里增加（将动态存入redis，同时自己的动态表里增加，粉丝的feed表里增加）
            String eventId = "event" + UUID.randomUUID().toString().replace("-", "");
            redisService.setCacheObject(eventId, JsonUtil.toJson(event));
            key = "user" + followerId + "_events";
            redisService.addToCacheZSet(key, eventId, event.getCreateTime().getTime());  //加入自己的动态表
            key = "user" + followerId +"_followers";
            followersIds = redisService.getCacheSet(key);      //获取所有的粉丝id
            if(followersIds.isEmpty()){
                List<Long> followersIdsList = followDao.getFollowersIds(followerId, event.getObjectType().getValue());
                followersIds = new HashSet<>(followersIdsList);
                if(!followersIds.isEmpty()) {
                    redisService.setCacheSet(key, followersIds);
                }
            }
            //在粉丝的feed里加入这个动态
            for( long followersId: followersIds ){
                key = "user" + followersId + "_feeds";
                redisService.addToCacheZSet(key, eventId, event.getCreateTime().getTime());  //加入粉丝的feed表
            }
        }
    }

    public EventType getHandleType(){
        return EventType.FOLLOW;
    }
}
