package com.gxh.dao;

import com.gxh.model.Topic;

public interface TopicDao {

    Topic selectByName(String name);
}
