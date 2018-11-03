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
import org.com.leadquiezs.Model.OutCome;
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.Utility.Action;
import org.com.leadquiezs.Utility.Message;
import org.com.leadquiezs.dao.OutComeDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class OutComeController extends HttpServlet {

    ApplicationContext context;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        OutCome outCome = (OutCome) session.getAttribute("outCome");

        context = (ApplicationContext) req.getServletContext().getAttribute("applicationContext");
        Action action = Action.valueOf((String) req.getAttribute("action"));

        switch (action) {
            case addOutCome: {
                if (outCome.getQuiez() == null) {
                    req.setAttribute("message", new Message(Message.Error, "You do not Select Quiez PleaseSelect Quiez").getMessage());
                } else if (validator(outCome)) {
                    req.setAttribute("message", "You do not Select Quiez Or Not  Fill All Requird Data");
                } else {
                    boolean state = addOutCome(outCome);
                    if (state) {
                        req.setAttribute("message", "OutCome add Sucessfully");

                    } else {
                        req.setAttribute("message", "OutCome can not add Sucessfully");
                    }
                }
                break;
            }
            case removeOutCome: {
                if (outCome.getOutComeID() == null) {
                    req.setAttribute("message", "OutCome can not removeed Sucessfully");
                } else {
                    boolean state = removeOutCome(outCome);
                    if (state) {
                        req.setAttribute("message", "OutCome removeed Sucessfully");
//                        session.removeAttribute("outCome");
                    } else {
                        req.setAttribute("message", "OutCome can not removeed Sucessfully");
                    }
                }
                break;
            }
        }

        session.removeAttribute("outCome");
        req.getRequestDispatcher("outcomes.jsp").forward(req, resp);
    }

    private boolean addOutCome(OutCome outCome) {
        OutComeDao outComeDao = (OutComeDao) context.getBean("outComeDao");

        return outComeDao.saveOutCome(outCome);
    }

    private boolean removeOutCome(OutCome outCome) {
        OutComeDao outComeDao = (OutComeDao) context.getBean("outComeDao");

        return outComeDao.deleteOutCome(outCome);
    }

    private boolean validator(OutCome outCome) {
        if (outCome.getTitle() == null || outCome.getTitle().isEmpty()) {
            return true;
        }

        return false;
    }
}
