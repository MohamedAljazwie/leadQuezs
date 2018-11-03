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
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.Model.User;
import org.com.leadquiezs.Utility.Action;
import org.com.leadquiezs.dao.QuiezDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class QuiezController extends HttpServlet {

    ApplicationContext context;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Quiez quiez = (Quiez) session.getAttribute("quiez");
        Action action = Action.valueOf((String) req.getAttribute("action"));

        context = (ApplicationContext) req.getServletContext().getAttribute("applicationContext");

        switch (action) {
            case addQuiez: {
                if (validateData(quiez)) {
                    req.setAttribute("message", "Please Fill All Requird Data");
                } else {
                    boolean state = addQuiez(quiez);
                    if (state) {
                        req.setAttribute("message", "Quiez add Sucessfully");

                    } else {
                        req.setAttribute("message", "Quiez can not add Sucessfully");
                    }
                }
                break;
            }
            case removeQuiez: {
                if (quiez.getQuiezID() == null) {
                    req.setAttribute("message", "Quiez can not deleted Sucessfully");
                } else {
                    boolean state = removeQuiez(quiez);
                    if (state) {
                        req.setAttribute("message", "Quiez deleted Sucessfully");
//                    session.removeAttribute("quiez");
                    } else {
                        req.setAttribute("message", "Quiez can not deleted Sucessfully");
                    }
                }
                break;
            }
        }
        session.removeAttribute("quiez");
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

    private boolean addQuiez(Quiez quiez) {
        QuiezDao quiezDao = (QuiezDao) context.getBean("quiezDoa");
        return quiezDao.saveQuiez(quiez);
    }

    private boolean removeQuiez(Quiez quiez) {
        QuiezDao quiezDao = (QuiezDao) context.getBean("quiezDoa");
        return quiezDao.deleteQuiez(quiez);
    }

    private boolean validateData(Quiez quiez) {

        if (quiez.getName() == null || quiez.getName().isEmpty()) {
            return true;
        }
        if (quiez.getLabel() == null || quiez.getLabel().isEmpty()) {
            return true;
        }
        if (quiez.getImage() == null || quiez.getImage().isEmpty()) {
            return true;
        }
        if (quiez.getTitle() == null || quiez.getTitle().isEmpty()) {
            return true;
        }

        return false;
    }
}
