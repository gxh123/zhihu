package com.gxh.controller;

import com.gxh.model.Answer;
import com.gxh.model.Question;
import com.gxh.model.UserHolder;
import com.gxh.mq.ObjectType;
import com.gxh.service.AnswerService;
import com.gxh.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(path = {"/answer"})
public class AnswerController {

    @Autowired
    UserHolder userHolder;

    @Autowired
    AnswerService answerService;

    @Autowired
    QuestionService questionService;

    @ResponseBody
    @RequestMapping(path = {"/add"}, method = {RequestMethod.POST})
    public Answer add(@RequestParam("question_id") long questionId,
                            @RequestParam("answer_content") String content,
                            @RequestParam("answer_time") String time){
        Answer answer = new Answer();
        answer.setAnswerer(userHolder.getUser());
        answer.setQuestion(new Question(questionId));
        answer.setContent(content);
        // String转换为Date
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date date = null;
        try {
            date = new SimpleDateFormat(pattern).parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        answer.setCreateDate(date);
        answerService.addAnswer(answer);
        System.out.println(answer);
        return answer;
    }

    @RequestMapping(path = {"/agree"}, method = {RequestMethod.POST})
    public void agree(@RequestParam("answerId") long answerId,
                        @RequestParam("userId") long userId){
        answerService.agreeAnswer(userId,answerId, ObjectType.ANSWER);
    }

    @RequestMapping(path = {"/disagree"}, method = {RequestMethod.POST})
    public void disagree(@RequestParam("answerId") long answerId,
                      @RequestParam("userId") long userId){
        answerService.disagreeAnswer(userId,answerId, ObjectType.ANSWER);
    }

    @RequestMapping(path = {"/cancelAgree"}, method = {RequestMethod.POST})
    public void cancelAgree(@RequestParam("answerId") long answerId,
                         @RequestParam("userId") long userId){
        answerService.cancelAgreeAnswer(userId,answerId, ObjectType.ANSWER);
    }

    @RequestMapping(path = {"/cancelDisagree"}, method = {RequestMethod.POST})
    public void cancelDisagree(@RequestParam("answerId") long answerId,
                         @RequestParam("userId") long userId){
        answerService.cancelDisagreeAnswer(userId,answerId, ObjectType.ANSWER);
    }


}
