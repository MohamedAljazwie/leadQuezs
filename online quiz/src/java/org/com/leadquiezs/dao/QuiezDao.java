/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.util.List;
import java.util.Map;
import org.com.leadquiezs.Model.Quiez;

/**
 *
 * @author MohamedSayed
 */
public interface QuiezDao {

    boolean saveQuiez(Quiez quiez);

    boolean updateQuiez(Quiez quiez);

    boolean deleteQuiez(Quiez quiez);

    List<Quiez> listQuiezs();

    Map<String, Quiez> Quiezs();

    Quiez getQuiez(Integer quiezId);

}
