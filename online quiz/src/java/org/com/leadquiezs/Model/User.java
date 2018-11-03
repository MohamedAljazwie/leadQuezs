/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

/**
 *
 * @author MohamedSayed
 */
@Entity
@Table(name = "USERS")
@FilterDef(name = "outcomesforuser", parameters = {
    @ParamDef(name = "username", type = "java.lang.String")})
 @Filter(name = "outcomesforuser", condition = "User_UserName = :username")

public class User implements Serializable {

    @Id
    @SequenceGenerator(name = "Userid", sequenceName = "User_Userid", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "Userid", strategy = GenerationType.SEQUENCE)
    @Column(name = "User_ID", length = 10, nullable = false, unique = true, updatable = false)
    private Integer userID;
    @Column(name = "User_UserName", length = 100, nullable = false, unique = true)
    private String userName;
    @Column(name = "User_paswword", length = 100, nullable = false)
    private String password;
    @Column(name = "User_email", length = 100, nullable = false, unique = true)
    private String email;

    public User() {
    }

    public User(String userName, String password, String email) {
        this.userName = userName;
        this.password = password;
        this.email = email;
    }

    public Integer getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", email=" + email + '}';
    }

}
