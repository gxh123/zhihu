package com.gxh.service;

import com.gxh.dao.AnswerDao;
import com.gxh.dao.QuestionDao;
import com.gxh.model.Answer;
import com.gxh.model.Question;
import com.gxh.model.UserHolder;
import com.gxh.mq.ObjectType;
import com.gxh.search.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import java.util.List;

@Service
public class QuestionService {

    @Autowired
    UserHolder userHolder;

    @Autowired
    QuestionDao questionDao;

    @Autowired
    AnswerDao answerDao;

    @Autowired
    FollowService followService;

    @Autowired
    EventService eventService;

    @Autowired
    RedisService redisService;

    @Autowired
    private QuestionRepository repository;

    public Question getById(long questionId) {
        long userId = userHolder.getUser().getId();
        Question question = questionDao.selectById(questionId);
        //确定问题是否已经关注
        boolean isFollowed = followService.isFollower(userId, ObjectType.QUESTION, questionId);
        question.setIsFollowed(isFollowed);
        //确定问题的每个答案是否已经赞同，反对，感谢，收藏
        List<Answer> answers = question.getAnswers();
        for(Answer answer : answers){
            long answerId = answer.getId();
            //确定这个答案是否已经赞同，反对，感谢，收藏
            String key = "answer" + answerId + "_agree";
            answer.setIsAgreed(redisService.isInCacheSet(key, userId));
            answer.setAgreements(redisService.getCacheSet(key).size());
            key = "answer" + answerId + "_disagree";
            answer.setIsDisagreed(redisService.isInCacheSet(key, userId));
            key = "answer" + answerId + "_thank";
            answer.setIsThanked(redisService.isInCacheSet(key, userId));
        }
        return question;
    }

    public long getId(Question question)
    {
        return questionDao.selectByQuestion(question);
    }

    public int addQuestion(Question question) {
        question.setContent(HtmlUtils.htmlEscape(question.getContent()));
        question.setTitle(HtmlUtils.htmlEscape(question.getTitle()));
        return questionDao.addQuestion(question) > 0 ? (int) question.getId() : 0;
    }

    public List<Question> searchQuestion(String params, Pageable pageable) {
        List<Question> questions = repository.findTop10ByTitle(params, pageable);
        return questions;
    }
}
