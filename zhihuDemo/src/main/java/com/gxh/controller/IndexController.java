package com.gxh.controller;

import com.gxh.model.Feed;
import com.gxh.model.Question;
import com.gxh.model.User;
import com.gxh.model.UserHolder;
import com.gxh.service.FeedService;
import com.gxh.service.QuestionService;
import com.gxh.service.TopicService;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    FeedService feedService;

    @Autowired
    QuestionService questionService;

    @Autowired
    TopicService topicService;

    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String home(Model model){
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        List<Feed> feeds = feedService.getFeedsByUserId(user.getId());
        model.addAttribute("feeds", feeds);
        return "index";
    }

    @RequestMapping("/explore")
    public String explore(Model model){
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        return "explore";
    }

    @RequestMapping("/topic")
    public String topic(Model model){
        User user = userHolder.getUser();
        model.addAttribute("user", user);
        return "topic";
    }

    @RequestMapping(path = {"/search"})
    @ResponseBody
    public Map search(Model model, @RequestParam("params") String params){
        PageRequest pageRequest = new PageRequest(0, 10);
        List<Question> questions =  questionService.searchQuestion(params, pageRequest);
        Map map = new HashMap<>();
        map.put("question", questions);
        pageRequest = new PageRequest(0, 3);
        List<User> users =  userService.searchUser(params, pageRequest);
        map.put("user", (users));
        return map;
    }

}
