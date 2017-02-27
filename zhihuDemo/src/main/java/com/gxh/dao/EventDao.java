package com.gxh.dao;

import com.gxh.mq.Event;
import com.gxh.mq.EventType;
import com.gxh.mq.ObjectType;

import java.util.Date;
import java.util.List;

public interface EventDao {

    void addEvent(Event event);

    List<Event> getEventsByCreatorId(long creatorId);

    List<Event> getEventsByFollowerId(long followerId);

    List<Event> getEvents(Event eventLike);

    Date getEventTime(Event event);

    void removeEvent(Event event);

}
