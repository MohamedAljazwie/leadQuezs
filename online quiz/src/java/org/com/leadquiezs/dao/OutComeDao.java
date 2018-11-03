/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.util.List;
import java.util.Map;
import org.com.leadquiezs.Model.OutCome;
import org.com.leadquiezs.Model.Quiez;

/**
 *
 * @author MohamedSayed
 */
public interface OutComeDao {

    boolean saveOutCome(OutCome outCome);

    boolean updateOutCome(OutCome outCome);

    boolean deleteOutCome(OutCome outCome);

    List<OutCome> listOutComes();

    List<OutCome> listOutComes(Quiez quiez);

    Map< String, OutCome> OutComes(Quiez quiez);

    OutCome getOutCome(Integer outComeId);
}
