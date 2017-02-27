package com.gxh.mq;

import java.util.Date;

public class Event implements Cloneable{
    private long id;
    private long creatorId;
    private EventType eventType;
    private ObjectType objectType;
    private long objectId;
    private long objectOwnerId;
    private Date createTime;

    public Event(){}

    public Event(long creatorId, EventType eventType, ObjectType objectType, long objectId, Date createTime) {
        this.creatorId = creatorId;
        this.eventType = eventType;
        this.objectType = objectType;
        this.objectId = objectId;
        this.createTime = createTime;
    }

    public Event(long creatorId, EventType eventType, ObjectType objectType, long objectId, long objectOwnerId, Date createTime) {
        this.creatorId = creatorId;
        this.eventType = eventType;
        this.objectType = objectType;
        this.objectId = objectId;
        this.objectOwnerId = objectOwnerId;
        this.createTime = createTime;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(long creatorId) {
        this.creatorId = creatorId;
    }

    public EventType getEventType() {
        return eventType;
    }

    public void setEventType(EventType eventType) {
        this.eventType = eventType;
    }

    public ObjectType getObjectType() {
        return objectType;
    }

    public void setObjectType(ObjectType objectType) {
        this.objectType = objectType;
    }

    public long getObjectId() {
        return objectId;
    }

    public void setObjectId(long objectId) {
        this.objectId = objectId;
    }

    public long getObjectOwnerId() {
        return objectOwnerId;
    }

    public void setObjectOwnerId(long objectOwnerId) {
        this.objectOwnerId = objectOwnerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Event{" +
                "creatorId=" + creatorId +
                ", eventType=" + eventType +
                ", objectType=" + objectType +
                ", objectId=" + objectId +
                ", objectOwnerId=" + objectOwnerId +
                ", createTime=" + createTime +
                '}';
    }
}
