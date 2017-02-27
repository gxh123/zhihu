package com.gxh.controller;

import com.gxh.model.Answer;
import com.gxh.model.Comment;
import com.gxh.model.User;
import com.gxh.model.UserHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    UserHolder userHolder;

    @RequestMapping(path = "/question/{id}/comments")
    public void getQuestionComments(Model model,
                                    @PathVariable("id") int questionId,
                                    @RequestParam("page") int page){


    }

    @RequestMapping("/answer/{id}/comments")
    @ResponseBody
    public List<Comment> getQuestionComments(Model model){
        List<Comment> comments = new ArrayList<>();
        User user = new User();
        user.setId(20);
        user.setName("gxh");
        user.setAvatar("http://localhost:8080/zhihuDemo/assets/img/avatars/14.jpg");
        comments.add(new Comment(1,user,"我表示同意",1,null));   //for test
        return comments;
    }

    @RequestMapping("/comment/add")
    @ResponseBody
    public Comment addComment(Model model, @RequestParam("object_type") int objectType,
                                       @RequestParam("object_id") int objectId,
                                       @RequestParam("content") String content,
                                       @RequestParam("comment_time") String commentTime){
        // String转换为Date
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date date = null;
        try {
            date = new SimpleDateFormat(pattern).parse(commentTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Comment comment = new Comment(userHolder.getUser(), objectType, objectId, content, 0, date, null);
        return comment;
    }
}
