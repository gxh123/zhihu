package com.gxh.model;

import java.util.Date;
import java.util.List;

public class Answer {
    private long id;
    private User answerer;              //回答者
    private Question question;          //所回答的问题
    private String content;             //答案内容
    private int agreements;             //赞同数
    private int disagreements;          //反对数
    private List<Comment> comments;     //评论，不必须，需要总数量
    private Date createDate;
    private Date modifyDate;
    private boolean isAgreed;       //是否已经赞同
    private boolean isDisagreed;    //是否已经反对
    private boolean isThanked;      //是否已经感谢
    private boolean isCollected;    //是否已经收藏

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getAnswerer() {
        return answerer;
    }

    public void setAnswerer(User answerer) {
        this.answerer = answerer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
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

    public int getDisagreements() {
        return disagreements;
    }

    public void setDisagreements(int disagreements) {
        this.disagreements = disagreements;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public boolean getIsAgreed() {
        return isAgreed;
    }

    public void setIsAgreed(boolean agreed) {
        isAgreed = agreed;
    }

    public boolean getIsDisagreed() {
        return isDisagreed;
    }

    public void setIsDisagreed(boolean disagreed) {
        isDisagreed = disagreed;
    }

    public boolean getIsThanked() {
        return isThanked;
    }

    public void setIsThanked(boolean thanked) {
        isThanked = thanked;
    }

    public boolean getIsCollected() {
        return isCollected;
    }

    public void setIsCollected(boolean collected) {
        isCollected = collected;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", answerer=" + answerer +
                ", question=" + question +
                ", content='" + content + '\'' +
                ", agreements=" + agreements +
                ", disagreements=" + disagreements +
                ", comments=" + comments +
                ", createDate=" + createDate +
                ", modifyDate=" + modifyDate +
                ", isAgreed=" + isAgreed +
                ", isDisagreed=" + isDisagreed +
                ", isThanked=" + isThanked +
                ", isCollected=" + isCollected +
                '}';
    }
}
