package com.gxh.dao;

import com.gxh.model.Question;

public interface QuestionDao {

    int addQuestion(Question question);

    Question selectById(long id);

    long selectByQuestion(Question question);

}
