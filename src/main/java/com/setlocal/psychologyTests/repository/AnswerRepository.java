package com.setlocal.psychologyTests.repository;

import com.setlocal.psychologyTests.model.Answer;

import java.util.List;

public interface AnswerRepository {

    List<Answer> findByQuestionId(Integer id);

}
