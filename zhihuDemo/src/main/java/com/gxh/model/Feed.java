package com.gxh.model;

public class Feed<T> {
    private long id;
    private User creator;       //创建者
    private String action;         //动态的类型（0，关注；1，收藏；2，赞同；3，回答）
    private T object;           //动态的对象
    private String objectType;  //对象类型
    private long createTime;    //创建的时间

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public T getObject() {
        return object;
    }

    public void setObject(T object) {
        this.object = object;
    }

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Feed{" +
                "id=" + id +
                ", creator=" + creator +
                ", action='" + action + '\'' +
                ", object=" + object +
                ", objectType='" + objectType + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
