/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.dao;

import java.util.List;
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.Model.User;

/**
 *
 * @author MohamedSayed
 */
public interface UserDao {

    boolean saveUser(User user);

    boolean updateUser(User user);

    void deleteUser(User user);

    List<Quiez> listQuiezs(User user);

    List<User> listUsers();

    User getUser(Integer userId);
     User getUser(String userName);
     
}
