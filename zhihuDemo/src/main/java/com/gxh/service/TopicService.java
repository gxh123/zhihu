package com.gxh.service;

import com.gxh.dao.TopicDao;
import com.gxh.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TopicService {

    @Autowired
    TopicDao topicDao;

    public Topic getTopicByName(String name) {
        return topicDao.selectByName(name);
    }

}
