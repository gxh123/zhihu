package com.gxh.mq;

public interface EventHandler {

    public EventType getHandleType();

    void handle(Event event) throws Exception;
}
