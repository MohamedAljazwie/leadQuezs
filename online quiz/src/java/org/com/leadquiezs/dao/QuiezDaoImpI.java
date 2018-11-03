/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.Model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 *
 * @author MohamedSayed
 */
public class QuiezDaoImpI extends HibernateDaoSupport implements QuiezDao {

    @Override
    public boolean saveQuiez(Quiez quiez) {
        Serializable serializable = null;
        Session session = null;
        try {
             session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
             session.saveOrUpdate(quiez);
             serializable=quiez.getQuiezID();
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
    public boolean updateQuiez(Quiez quiez) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteQuiez(Quiez quiez) {
        boolean deleted=false;
      Session session = null;
        try {
             session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
            quiez=(Quiez) session.get(Quiez.class, quiez.getQuiezID());
            session.delete(quiez);
            
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
    public List<Quiez> listQuiezs() {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            List<Quiez> quiezs = session.createQuery(" from Quiez").list();
            return quiezs;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Map<String, Quiez> Quiezs() {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            List<Quiez> listQuiezs = session.createQuery(" from Quiez").list();
           Map<String ,Quiez> quiezs=new HashMap<>();
           for(Quiez quiez:listQuiezs)
               quiezs.put(quiez.getName(), quiez);
            return quiezs;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Quiez getQuiez(Integer quiezId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
