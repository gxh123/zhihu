package com.gxh.mq.handler;

import com.gxh.mq.Event;
import com.gxh.mq.EventHandler;
import com.gxh.mq.EventType;
import org.springframework.stereotype.Component;

@Component
public class ThankHandler implements EventHandler {
    @Override
    public EventType getHandleType() {
        return EventType.THANK;
    }

    @Override
    public void handle(Event event) {

    }
}
