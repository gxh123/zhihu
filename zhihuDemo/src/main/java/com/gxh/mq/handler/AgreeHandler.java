package com.gxh.mq.handler;

import com.gxh.dao.AnswerDao;
import com.gxh.dao.EventDao;
import com.gxh.dao.FollowDao;
import com.gxh.mq.Event;
import com.gxh.mq.EventHandler;
import com.gxh.mq.EventType;
import com.gxh.mq.ObjectType;
import com.gxh.service.RedisService;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class AgreeHandler implements EventHandler,InitializingBean {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    AnswerDao answerDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.AGREE;
    }

    @Override
    public void handle(Event event) {
        System.out.println("handle: " + event);
        long userId = event.getCreatorId();
        long answerId = event.getObjectId();
        //1、在答案赞同用户的集合增加userId
        //1.1、在数据库的动态表里增加
        eventDao.addEvent(event);
        //1.2、在redis的answerXXX_agree里增加userId
        String key = "answer" + answerId + "_agree";
        Set<Long> agreeIds = redisService.getCacheSet(key);
        //redis里没有这个答案的赞同者的id集合（answerXXX_agree为空），则从数据库里取
        if(agreeIds.isEmpty()){
            Event eventLike = new Event(0, EventType.AGREE, ObjectType.ANSWER, answerId, null);
            List<Event> events = eventDao.getEvents(eventLike);
            for(Event event1 : events){
                agreeIds.add(event1.getCreatorId());
            }
            if(!agreeIds.isEmpty()) {
                redisService.setCacheSet(key, agreeIds);  //之前已经在动态表里增加了，这里就不需要再在set里增加
            }
        }else {
            redisService.addToCacheSet(key, userId);
        }
        //2、在反对的集合里去掉userId
        key = "answer" + answerId + "_disagree";
        //2.1、数据库去掉反对的那条动态
        event.setEventType(EventType.DISAGREE);
        eventDao.removeEvent(event);
        event.setEventType(EventType.AGREE);
        //2.2、去掉redis记录反对的集合里的userId
        Set<Long> disagreeIds = redisService.getCacheSet(key);
        if(disagreeIds.isEmpty()){
            Event eventLike = new Event(0, EventType.DISAGREE, ObjectType.ANSWER, answerId, null);
            List<Event> events = eventDao.getEvents(eventLike);
            for(Event event1 : events){
                disagreeIds.add(event1.getCreatorId());
            }
            if(!disagreeIds.isEmpty()) {
                redisService.setCacheSet(key, disagreeIds);
            }
        }
        //如果反对集合里有
        if(disagreeIds.contains(userId)){
            redisService.removeFromCacheSet(key, userId);
            //如果userId之前有反对，需要更新记录反对数改变的答案id的集合
            key = "disagreements_change";
            redisService.addToCacheSet(key, answerId);
        }
        //3、更新记录赞数改变的答案id的集合
        key = "agreements_change";
        redisService.addToCacheSet(key, answerId);

        //4、将这个动态存入redis
        String eventId = "event" + UUID.randomUUID().toString().replace("-", "");
        redisService.setCacheObject(eventId, JsonUtil.toJson(event));
        //5、将这个动态加入userId的动态表
        key = "user" + userId + "_events";
        redisService.addToCacheZSet(key, eventId, event.getCreateTime().getTime());  //加入自己的动态表
        //6、将这个动态加入userId的所有粉丝的feed表
        key = "user" + userId +"_followers";
        Set<Long> followersIds = redisService.getCacheSet(key);      //获取所有的粉丝id
        if(followersIds.isEmpty()){
            List<Long> followersIdsList = followDao.getFollowersIds(userId, event.getObjectType().getValue());
            followersIds = new HashSet<>(followersIdsList);
            if(!followersIds.isEmpty()) {
                redisService.setCacheSet(key, followersIds);
            }
        }else{
            redisService.addToCacheSet(key, userId);
        }
        for( long followersId: followersIds ){
            key = "user" + followersId + "_feeds";
            redisService.addToCacheZSet(key, eventId, event.getCreateTime().getTime());  //加入粉丝的feed表
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        //启动线程，定期将发生改变的答案的赞数,反对数写入数据库
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        String key = "agreements_change";
                        Set<Long> answerIds = redisService.getCacheSet(key);
                        for (long answerId : answerIds) {
                            key = "answer" + answerId + "_agree";
                            int agreements = redisService.getCacheSet(key).size();
                            answerDao.updateAgreements(answerId, agreements);
                            redisService.removeFromCacheSet("agreements_change", answerId);
                        }
                        key = "disagreements_change";
                        answerIds = redisService.getCacheSet(key);
                        for (long answerId : answerIds) {
                            key = "answer" + answerId + "_disagree";
                            int disagreements = redisService.getCacheSet(key).size();
                            answerDao.updateDisagreements(answerId, disagreements);
                            redisService.removeFromCacheSet("disagreements_change", answerId);
                        }
                        Thread.sleep(1000*60*60);  //1 hour
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }).start();
    }
}
