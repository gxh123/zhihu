package com.gxh.model;

import java.util.Date;

public class Comment {
    private long id;
    private User commenter;     //评论的人
    private int objectType;     //被评论对象的类型(0,问题；1，答案)
    private int objectId;       //被评论对象的编号
    private String content;     //评论的主体内容
    private int agreements;     //赞同数
    private Date commentDate;   //评论时间
    private Comment reply;      //回复哪个评论

    public Comment(long id, User commenter, String content, int agreements, Comment reply) {
        this.id = id;
        this.commenter = commenter;
        this.content = content;
        this.agreements = agreements;
        this.reply = reply;
    }

    public Comment(User commenter, int objectType, int objectId, String content, int agreements, Date commentDate, Comment reply) {
        this.commenter = commenter;
        this.objectType = objectType;
        this.objectId = objectId;
        this.content = content;
        this.agreements = agreements;
        this.commentDate = commentDate;
        this.reply = reply;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getCommenter() {
        return commenter;
    }

    public void setCommenter(User commenter) {
        this.commenter = commenter;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAgreements() {
        return agreements;
    }

    public void setAgreements(int agreements) {
        this.agreements = agreements;
    }

    public Comment getReply() {
        return reply;
    }

    public void setReply(Comment reply) {
        this.reply = reply;
    }

    public int getObjectType() {
        return objectType;
    }

    public void setObjectType(int objectType) {
        this.objectType = objectType;
    }

    public int getObjectId() {
        return objectId;
    }

    public void setObjectId(int objectId) {
        this.objectId = objectId;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", commenter=" + commenter +
                ", objectType=" + objectType +
                ", objectId=" + objectId +
                ", content='" + content + '\'' +
                ", agreements=" + agreements +
                ", commentDate=" + commentDate +
                ", reply=" + reply +
                '}';
    }
}
