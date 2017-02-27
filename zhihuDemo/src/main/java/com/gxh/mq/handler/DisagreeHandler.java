package com.gxh.mq.handler;

import com.gxh.dao.EventDao;
import com.gxh.dao.FollowDao;
import com.gxh.mq.Event;
import com.gxh.mq.EventHandler;
import com.gxh.mq.EventType;
import com.gxh.mq.ObjectType;
import com.gxh.service.RedisService;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Component
public class DisagreeHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.DISAGREE;
    }

    @Override
    public void handle(Event event) {
        System.out.println("handle: " + event);
        long userId = event.getCreatorId();
        long answerId = event.getObjectId();
        //1、在答案反对用户的集合增加userId
        //1.1、在数据库的动态表里增加
        eventDao.addEvent(event);
        //1.2、在redis的answerXXX_disagree里增加userId
        String key = "answer" + answerId + "_disagree";
        Set<Long> disagreeIds = redisService.getCacheSet(key);
        //redis里没有这个答案的反对者的id集合（answerXXX_disagree为空），则从数据库里取
        if(disagreeIds.isEmpty()){
            Event eventLike = new Event(0, EventType.DISAGREE, ObjectType.ANSWER, answerId, null);
            List<Event> events = eventDao.getEvents(eventLike);
            for(Event event1 : events){
                disagreeIds.add(event1.getCreatorId());
            }
            if(!disagreeIds.isEmpty()) {
                redisService.setCacheSet(key, disagreeIds);  //之前已经在动态表里增加了，这里就不需要再在set里增加
            }
        }else {
            redisService.addToCacheSet(key, userId);
        }
        //2、在赞同的集合里去掉userId
        key = "answer" + answerId + "_agree";
        //2.1、数据库去掉赞同的那条动态
        event.setEventType(EventType.AGREE);
        eventDao.removeEvent(event);
        event.setEventType(EventType.DISAGREE);
        //2.2、去掉redis记录赞同的集合里的userId
        Set<Long> agreeIds = redisService.getCacheSet(key);
        if(agreeIds.isEmpty()){
            Event eventLike = new Event(0, EventType.AGREE, ObjectType.ANSWER, answerId, null);
            List<Event> events = eventDao.getEvents(eventLike);
            for(Event event1 : events){
                agreeIds.add(event1.getCreatorId());
            }
            if(!agreeIds.isEmpty()) {
                redisService.setCacheSet(key, agreeIds);
            }
        }
        //如果赞同集合里有
        if(agreeIds.contains(userId)){
            redisService.removeFromCacheSet(key, userId);
            //如果userId之前有赞同，需要更新记录赞同数改变的答案id的集合
            key = "agreements_change";
            redisService.addToCacheSet(key, answerId);
        }
        //3、更新记录反对数改变的答案id的集合
        key = "disagreements_change";
        redisService.addToCacheSet(key, answerId);
        //4、删掉那个赞同的event，并且在所有的粉丝的feed里删掉这个event的id
    }
}















