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
public class OutComeDaoImpI extends HibernateDaoSupport implements OutComeDao {

    @Override
    public boolean saveOutCome(OutCome outCome) {
        Serializable serializable = null;
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
            session.saveOrUpdate(outCome);
            session.getTransaction().commit();
            serializable = outCome.getOutComeID();
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
    public boolean updateOutCome(OutCome outCome) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean deleteOutCome(OutCome outCome) {
        boolean deleted=false;
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            session.beginTransaction();
            outCome=(OutCome) session.get(OutCome.class, outCome.getOutComeID());
            session.delete(outCome);
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
    public List<OutCome> listOutComes() {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            List<OutCome> questions = session.createQuery(" from OutCome").list();
            return questions;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<OutCome> listOutComes(Quiez quiez) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();

            Filter filter = session.enableFilter("outcomesforquiez");
            filter.setParameter("quiezID", new BigDecimal(quiez.getQuiezID()));
            List<OutCome> outComes = session.createQuery(" from OutCome ").list();
            return outComes;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Map<String, OutCome> OutComes(Quiez quiez) {

        List<OutCome> outComes = listOutComes(quiez);
        Map<String, OutCome> mapOutComs = new HashMap<>();
        for (OutCome outCome : outComes) {
            mapOutComs.put(outCome.getTitle(), outCome);
        }
        return mapOutComs;
    }

    @Override
    public OutCome getOutCome(Integer outComeId) {
        Session session = null;
        try {
            session = getHibernateTemplate().getSessionFactory().openSession();
            OutCome outCome = (OutCome) session.get(OutCome.class, outComeId);
            return outCome;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
