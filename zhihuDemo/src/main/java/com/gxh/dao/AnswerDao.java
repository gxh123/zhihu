package com.gxh.dao;

import com.gxh.model.Answer;

import java.util.List;

public interface AnswerDao {

    int addAnswer(Answer answer);

    Answer getAnswerById(long id);

    List<Answer> getAnswersByQuestionId(long id);

    void updateAgreements(long answerId, int count);

    void updateDisagreements(long answerId, int count);

}
