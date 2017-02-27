package com.gxh.service;

import com.gxh.dao.CommentDao;
import com.gxh.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    CommentDao commentDao;

    public List<Comment> getCommentsByObject(int objectId, int objectType) {
        return commentDao.selectCommentByObject(objectId, objectType);
    }

    public int addComment(Comment comment) {
        comment.setContent(HtmlUtils.htmlEscape(comment.getContent()));
        return commentDao.addComment(comment) > 0 ? (int) comment.getId() : 0;
    }

    public int getCommentCount(int entityId, int entityType) {
        return commentDao.getCommentCount(entityId, entityType);
    }

    public Comment getCommentById(int id)
    {
        return commentDao.getCommentById(id);
    }
}
