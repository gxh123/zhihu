package com.gxh.service;

import com.gxh.dao.AnswerDao;
import com.gxh.model.Answer;
import com.gxh.model.Question;
import com.gxh.model.UserHolder;
import com.gxh.mq.Event;
import com.gxh.mq.EventType;
import com.gxh.mq.MessageProducer;
import com.gxh.mq.ObjectType;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;
import java.util.Set;

@Service
public class AnswerService {

    @Autowired
    UserHolder userHolder;

    @Autowired
    AnswerDao answerDao;

    @Autowired
    MessageProducer messageProducer;

    @Autowired
    EventService eventService;

    @Autowired
    FollowService followService;

    @Autowired
    RedisService redisService;

    public Answer getById(long answerId) {
        long userId = userHolder.getUser().getId();
        Answer answer =  answerDao.getAnswerById(answerId);
        //确定问题是否已经关注
        Question question = answer.getQuestion();
        boolean isFollowed = followService.isFollower(userId, ObjectType.QUESTION, question.getId());
        question.setIsFollowed(isFollowed);
        //确定这个答案是否已经赞同，反对，感谢，收藏
        String key = "answer" + answerId + "_agree";
        answer.setIsAgreed(redisService.isInCacheSet(key, userId));
        answer.setAgreements(redisService.getCacheSet(key).size());
        key = "answer" + answerId + "_disagree";
        answer.setIsDisagreed(redisService.isInCacheSet(key, userId));
        key = "answer" + answerId + "_thank";
        answer.setIsThanked(redisService.isInCacheSet(key, userId));
        return answer;
    }

    public int addAnswer(Answer answer) {
        return answerDao.addAnswer(answer) > 0 ? (int) answer.getId() : 0;
    }

    public void agreeAnswer(long userId, long answerId, ObjectType type){
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(userId, EventType.AGREE, type, answerId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }

    public void disagreeAnswer(long userId, long answerId, ObjectType type){
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(userId, EventType.DISAGREE, type, answerId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }

    public void cancelAgreeAnswer(long userId, long answerId, ObjectType type){
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(userId, EventType.CANCEL_AGREE, type, answerId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }

    public void cancelDisagreeAnswer(long userId, long answerId, ObjectType type){
        Date createDate = new Date(System.currentTimeMillis());
        Event event = new Event(userId, EventType.CANCEL_DISAGREE, type, answerId, createDate);
        String message = JsonUtil.toJson(event);
        messageProducer.sendMessage(message);
    }
}
