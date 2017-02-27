package com.gxh.controller;

import com.gxh.model.*;
import com.gxh.service.QuestionService;
import com.gxh.service.TopicService;
import com.gxh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = {"/question"})
public class QuestionController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    QuestionService questionService;

    @Autowired
    TopicService topicService;

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(path = {"/add"}, method = {RequestMethod.POST})
    public Question add(Model model, @RequestParam("question_title") String title,
                                 @RequestParam(value="question_content",required = false) String content,
                                 @RequestParam("question_topic") String topicName,
                                 @RequestParam("anonymous") int anonymous){
        Question question = new Question();
        question.setContent(content);
        question.setTitle(title);
        if(anonymous == 0)
            question.setQuestioner(userHolder.getUser());
        else
            question.setQuestioner(new User());
        questionService.addQuestion(question);
        question.setId(questionService.getId(question));
        return question;
    }

    @RequestMapping(path = {"/{id}"})
    public String get(Model model, @PathVariable("id") int id){
        Question question = questionService.getById(id);
        model.addAttribute("user", userHolder.getUser());
        model.addAttribute("question", question);
        System.out.println(question);
        return "question";
    }
}
