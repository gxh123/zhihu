package com.gxh.controller;

import com.gxh.model.Question;
import com.gxh.model.UserHolder;
import com.gxh.mq.Event;
import com.gxh.mq.EventType;
import com.gxh.mq.ObjectType;
import com.gxh.service.CommentService;
import com.gxh.service.FollowService;
import com.gxh.service.QuestionService;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FollowController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @Autowired
    QuestionService questionService;

    @Autowired
    FollowService followService;


    @RequestMapping(path = {"/followUser"})
    public void followUser(@RequestParam("objectId") int objectId) {
        followService.follow(userHolder.getUser().getId(), objectId, ObjectType.USER);
    }

    @RequestMapping(path = {"/unfollowUser"})
    public void unfollowUser(@RequestParam("objectId") int objectId) {
        followService.unfollow(userHolder.getUser().getId(), objectId, ObjectType.USER);
    }

    @RequestMapping(path = {"/followQuestion"})
    public void followQuestion(@RequestParam("objectId") int objectId) {
        followService.follow(userHolder.getUser().getId(), objectId, ObjectType.QUESTION);
    }

    @RequestMapping(path = {"/unfollowQuestion"})
    public void unfollowQuestion(@RequestParam("objectId") int objectId) {
        followService.unfollow(userHolder.getUser().getId(), objectId, ObjectType.QUESTION);
    }
}
