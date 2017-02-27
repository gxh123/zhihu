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
public class CancelThankHandler implements EventHandler {

    @Autowired
    FollowDao followDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    RedisService redisService;

    @Override
    public EventType getHandleType() {
        return EventType.CANCEL_THANK;
    }

    @Override
    public void handle(Event event) {

    }
}
