package com.gxh.dao;

import com.gxh.model.Comment;

import java.util.List;

public interface CommentDao {

    int addComment(Comment comment);

    Comment getCommentById(long id);

    List<Comment> selectCommentByObject(int objectId, int objectType);  //获取某个对象(问题、回答)的评论

    int getCommentCount(int objectId, int objectType);   //获取某个对象(问题、回答)的评论数

}
