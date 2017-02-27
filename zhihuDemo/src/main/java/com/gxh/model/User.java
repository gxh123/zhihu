package com.gxh.model;

import org.springframework.data.elasticsearch.annotations.Document;

import java.util.List;

@Document(indexName = "zhihu", type = "user")
public class User {
    private long id;
    private String name;
    private String password;
    private String avatar;
    private String salt;
    private String phone;
    private String email;
    private List<Question> questions;   //提的问题
    private List<Answer> answers;       //答案
    private boolean isFollowed;

    public User(long id) {
        this.id = id;
    }

    public User() {
    }

    public long getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public boolean getIsFollowed() {
        return isFollowed;
    }

    public void setIsFollowed(boolean followed) {
        isFollowed = followed;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                ", salt='" + salt + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", questions=" + questions +
                ", answers=" + answers +
                ", isFollowed=" + isFollowed +
                '}';
    }
}
