package com.setlocal.psychologyTests.repository.answer;

import com.setlocal.psychologyTests.model.Answer;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.JpaRepository;

@Primary
public interface AnswerRepositoryImpl extends AnswerRepository, JpaRepository<Answer, Integer> {
}
