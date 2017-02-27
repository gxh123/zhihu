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

@Component
public class CancelAgreeHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.CANCEL_AGREE;
    }

    @Override
    public void handle(Event event) {
        System.out.println("handle: " + event);
        long userId = event.getCreatorId();
        long answerId = event.getObjectId();
        //1、在答案赞同用户的集合去掉userId
        //1.1、在数据库的动态表里删掉
        event.setEventType(EventType.AGREE);
        eventDao.removeEvent(event);
        event.setEventType(EventType.CANCEL_AGREE);
        //1.2、在redis的answerXXX_agree里删掉userId
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
                redisService.setCacheSet(key, agreeIds);  //之前已经在动态表里删掉了，这里就不需要再删
            }
        }else {
            redisService.removeFromCacheSet(key, userId);
        }

        //2、更新记录赞数改变的答案id的集合
        key = "agreements_change";
        redisService.addToCacheSet(key, answerId);

        //3、删掉那个赞同的event，并且在所有的粉丝的feed里删掉这个event的id
    }
}
