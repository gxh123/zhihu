package com.gxh.model;

import org.springframework.data.elasticsearch.annotations.Document;

import java.util.List;

@Document(indexName = "zhihu", type = "question")
public class Question {
    private long id;
    private User questioner;
    private String title;
    private String content;
    private List<Topic> topics;     //必须
    private List<Answer> answers;   //不必须，一开始需要有几个，包括总的数量
    private List<Comment> comments; //不必须，需要总的数量
    private boolean isFollowed;

    public Question(){}

    public Question(long id){
        this.id = id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getQuestioner() {
        return questioner;
    }

    public void setQuestioner(User questioner) {
        this.questioner = questioner;
    }

    public List<Topic> getTopics() {
        return topics;
    }

    public void setTopics(List<Topic> topics) {
        this.topics = topics;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public boolean getIsFollowed() {
        return isFollowed;
    }

    public void setIsFollowed(boolean followed) {
        isFollowed = followed;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", questioner=" + questioner +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", topics=" + topics +
                ", answers=" + answers +
                ", comments=" + comments +
                ", isFollowed=" + isFollowed +
                '}';
    }
}
