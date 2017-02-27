package com.gxh.mq.handler;

import com.gxh.mq.Event;
import com.gxh.mq.EventHandler;
import com.gxh.mq.EventType;
import org.springframework.stereotype.Component;

/**
 * Created by gxh on 2017/1/21.
 */
@Component
public class CommentHandler implements EventHandler {
    @Override
    public EventType getHandleType() {
        return EventType.COMMENT;
    }

    @Override
    public void handle(Event event) {

    }
}
