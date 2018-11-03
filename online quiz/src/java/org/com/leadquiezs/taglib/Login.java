/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.com.leadquiezs.Model.User;
import org.com.leadquiezs.dao.UserDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class Login extends BodyTagSupport
{
private String  username;
private String password;

    @Override
    public int doStartTag() throws JspException {
        ApplicationContext context = (ApplicationContext) pageContext.getServletContext().getAttribute("applicationContext");
        
        UserDao userDao=(UserDao) context.getBean("userDao");
        User user=  userDao.getUser(username);
        if(user.getPassword().equals(password))
        pageContext.setAttribute("user", user,pageContext.PAGE_SCOPE);
        else
            pageContext.setAttribute("user", null,pageContext.PAGE_SCOPE);
        return  EVAL_BODY_INCLUDE;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
