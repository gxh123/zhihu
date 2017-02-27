package com.gxh.service;

import com.gxh.dao.EventDao;
import com.gxh.mq.Event;
import com.gxh.mq.ObjectType;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
public class EventService {

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    public void storeEventOfUser(Event event, long userId){
        //在数据库的动态表里增加
        eventDao.addEvent(event);
        //在redis里增加（将动态存入redis，同时自己的动态表里增加，粉丝的feed表里增加）
        String eventId = "event" + UUID.randomUUID().toString().replace("-", "");
        redisService.setCacheObject(eventId, JsonUtil.toJson(event));
        String key = "user" + userId + "_events";
        redisService.addToCacheZSet(key, eventId, event.getCreateTime().getTime());  //加入自己的动态表
    }

    public Date getEventTime(Event event){
        return eventDao.getEventTime(event);
    }

}
