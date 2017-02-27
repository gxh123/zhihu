package com.gxh.model;

import com.gxh.mq.ObjectType;

public class Follow {
    private long id;
    private long targetId;
    private ObjectType targetType;

    public Follow(long id, long targetId, ObjectType targetType) {
        this.id = id;
        this.targetId = targetId;
        this.targetType = targetType;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getTargetId() {
        return targetId;
    }

    public void setTargetId(long targetId) {
        this.targetId = targetId;
    }

    public ObjectType getTargetType() {
        return targetType;
    }

    public void setTargetType(ObjectType targetType) {
        this.targetType = targetType;
    }

}
