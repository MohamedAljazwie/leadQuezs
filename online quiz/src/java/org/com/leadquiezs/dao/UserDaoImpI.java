/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.io.Serializable;
import java.util.List;
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.Model.User;
import org.hibernate.Filter;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 *
 * @author MohamedSayed
 */
public class UserDaoImpI extends HibernateDaoSupport implements UserDao {

    @Override
    public boolean saveUser(User user) {
        Serializable serializable = null;
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
            serializable = session.save(user);
            session.getTransaction().commit();
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
    public boolean updateUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Quiez> listQuiezs(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> listUsers() {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            List<User> users = session.createQuery(" from User").list();
            return users;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public User getUser(Integer userId) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            User user = (User) session.get(User.class, userId);
            return user;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public User getUser(String userName) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            Filter filter=session.enableFilter("outcomesforuser");
            filter.setParameter("username", userName);
           List<User> users=session.createQuery("from User").list();
           
            return users.get(0);
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
