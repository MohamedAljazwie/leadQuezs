/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.com.leadquiezs.Model.OutCome;
import org.com.leadquiezs.Model.Question;
import org.com.leadquiezs.Model.Quiez;
import org.hibernate.Filter;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 *
 * @author MohamedSayed
 */
public class QuestionDaoImpI extends HibernateDaoSupport implements QuestionDao {

    @Override
    public boolean saveQuestion(Question question) {
        Serializable serializable = null;
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
            session.saveOrUpdate(question);
            session.getTransaction().commit();
            serializable = question.getQuestionID();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
            ex.printStackTrace();
            serializable = null;
        } finally {
            session.close();
        }
        return (serializable != null);
    }

    @Override
    public boolean updateQuestion(Question question) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteQuestion(Question question) {
       boolean deleted=false;
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
          question=(Question) session.get(Question.class, question.getQuestionID());
            session.delete(question);
            session.getTransaction().commit();
           deleted=true;
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
            ex.printStackTrace();
           deleted=false;
        } finally {
            session.close();
        }
        return deleted;
    }

    @Override
    public List<Question> listQuestions() {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            List<Question> questions = session.createQuery(" from Question").list();
            return questions;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<Question> listQuestions(Quiez quiez) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();

            Filter filter = session.enableFilter("questioforquiez");
            filter.setParameter("quiezID", new BigDecimal(quiez.getQuiezID()));
            List<Question> questions = session.createQuery(" from Question ").list();
            return questions;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Map<String, Question> Questions(Quiez quiez) {
        List<Question> questions = listQuestions(quiez);
        Map<String, Question> mapQuestions = new HashMap<>();
        for (Question question : questions) {
            mapQuestions.put(question.getName(), question);
        }
        return mapQuestions;
    }

    @Override
    public Question getQuestion(Integer questionId) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            Question question = (Question) session.get(Question.class, questionId);
            return question;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
