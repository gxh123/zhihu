package com.gxh.model;

import java.util.Date;

public class Message {
    private long id;
    private long fromId;
    private long toId;
    private String content;
    private String conversationId;
    private Date createDate;
    private int hasRead;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getFromId() {
        return fromId;
    }

    public void setFromId(long fromId) {
        this.fromId = fromId;
    }

    public long getToId() {
        return toId;
    }

    public void setToId(long toId) {
        this.toId = toId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getHasRead() {
        return hasRead;
    }

    public void setHasRead(int hasRead) {
        this.hasRead = hasRead;
    }

    public String getConversationId() {
        if (fromId < toId)
        {
            return String.format("%d_%d", fromId, toId);
        }
        else
        {
            return String.format("%d_%d", toId, fromId);
        }
    }

    public void setConversationId(String conversationId) {
        this.conversationId = conversationId;
    }

    @Override
    public String toString() {
        return "Message{" +
                "fromId=" + fromId +
                ", toId=" + toId +
                ", content='" + content + '\'' +
                ", conversationId=" + conversationId +
                ", createDate=" + createDate +
                ", hasRead=" + hasRead +
                '}';
    }
}
