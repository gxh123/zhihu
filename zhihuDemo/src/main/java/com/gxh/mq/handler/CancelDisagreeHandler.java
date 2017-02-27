package com.gxh.mq.handler;

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
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * Created by gxh on 2017/1/21.
 */
@Component
public class CancelDisagreeHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.CANCEL_DISAGREE;
    }

    @Override
    public void handle(Event event) {
        System.out.println("handle: " + event);
        long userId = event.getCreatorId();
        long answerId = event.getObjectId();

        //1、在反对的集合里去掉userId
        String key = "answer" + answerId + "_disagree";
        //1.1、数据库去掉反对的那条动态
        event.setEventType(EventType.DISAGREE);
        eventDao.removeEvent(event);
        event.setEventType(EventType.CANCEL_DISAGREE);
        //1.2、去掉redis记录反对的集合里的userId
        Set<Long> disagreeIds = redisService.getCacheSet(key);
        if(disagreeIds.isEmpty()){
            Event eventLike = new Event(0, EventType.AGREE, ObjectType.ANSWER, answerId, null);
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
        }

        //2、更新记录反对数改变的答案id的集合
        key = "disagreements_change";
        redisService.addToCacheSet(key, answerId);

    }
}
