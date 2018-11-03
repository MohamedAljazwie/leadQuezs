/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.util.List;
import java.util.Map;
import org.com.leadquiezs.Model.Question;
import org.com.leadquiezs.Model.Quiez;

/**
 *
 * @author MohamedSayed
 */
public interface QuestionDao {
    boolean saveQuestion(Question question);

    boolean updateQuestion(Question question);

    boolean deleteQuestion(Question question);

    List<Question> listQuestions();
 List<Question> listQuestions(Quiez quiez);
  Map<String,Question> Questions(Quiez quiez);
    Question getQuestion(Integer questionId);
}
