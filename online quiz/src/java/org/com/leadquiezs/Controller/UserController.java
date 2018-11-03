/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.com.leadquiezs.Model.User;
import org.com.leadquiezs.Utility.Action;
import org.com.leadquiezs.dao.UserDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class UserController extends HttpServlet{
    ApplicationContext context;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String action=(String) req.getAttribute("action");
        User user =(User) req.getAttribute("user");
        context=(ApplicationContext) req.getServletContext().getAttribute("applicationContext");
        Action action1=Action.valueOf(action);
        switch(action1)
        {
            case  addUser :
               boolean result= addser(user);
              if(result)
               req.getRequestDispatcher("index.jsp").forward(req, resp);
              else
              req.getRequestDispatcher("registerUser.jsp").forward(req, resp);
              break;
        }
    }

    private boolean  addser(User user)
    {
        UserDao userDao=(UserDao) context.getBean("userDao");
        return userDao.saveUser(user);
       
    }
    
}
