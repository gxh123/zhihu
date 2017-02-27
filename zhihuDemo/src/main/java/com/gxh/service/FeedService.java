package com.gxh.service;

import com.gxh.dao.EventDao;
import com.gxh.model.Answer;
import com.gxh.model.Feed;
import com.gxh.model.Question;
import com.gxh.model.User;
import com.gxh.mq.Event;
import com.gxh.mq.ObjectType;
import com.gxh.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class FeedService {

    @Autowired
    RedisService redisService;

    @Autowired
    UserService userService;

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Autowired
    EventDao eventDao;

    public List<Feed> getFeedsByUserId(long userId){
        String key = "user"+ userId +"_feeds";
        Set<String> feedIds = redisService.getReverseCacheZSet(key);
        //redis里没有feed，则从数据库里（最多500条）
        if(feedIds.isEmpty()){
            Set<ZSetOperations.TypedTuple<Long>> followerFeedWithTime = new HashSet<>();
            List<Event> events = eventDao.getEventsByFollowerId(userId);
            if(!events.isEmpty()) {
                for (Event event1 : events) {
                    String eventId = "event" + UUID.randomUUID().toString().replace("-", "");
                    redisService.setCacheObject(eventId, JsonUtil.toJson(event1));
                    followerFeedWithTime.add(new DefaultTypedTuple(eventId,
                            (double) event1.getCreateTime().getTime()));
                }
                if(!followerFeedWithTime.isEmpty()) {
                    redisService.addSetToCacheZSet(key, followerFeedWithTime);
                    feedIds = redisService.getReverseCacheZSet(key);
                }
            }
        }
        List<Feed> feeds = new ArrayList<>();
        for(String feedId : feedIds){
            String str = (String)redisService.getCacheObject(feedId);
            Event event = JsonUtil.fromJson(str, Event.class);   //存储的是event，根据event去构造feed
            Feed feed = new Feed();
            User creator = userService.getById(event.getCreatorId());
            feed.setCreator(creator);
            if(event.getObjectType() == ObjectType.QUESTION){
                Question question = questionService.getById(event.getObjectId());
                feed.setObject(question);
                feed.setObjectType("问题");
            }else if(event.getObjectType() == ObjectType.ANSWER){
                Answer answer = answerService.getById(event.getObjectId());
                feed.setObject(answer);
                feed.setObjectType("答案");
            }else if(event.getObjectType() == ObjectType.COLLECTION){

            }else if(event.getObjectType() == ObjectType.TOPIC){

            }
            String action = null;
            switch (event.getEventType()){
                 case ANSWER:
                     action = "回答";
                     break;
                 case AGREE:
                     action = "赞同";
                     break;
                 case FOLLOW:
                     action = "关注";
                     break;
            }
            feed.setAction(action);
            feed.setCreateTime(event.getCreateTime().getTime());
            feeds.add(feed);
        }
        return feeds;
    }


}
