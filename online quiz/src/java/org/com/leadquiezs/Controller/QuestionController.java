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
import org.com.leadquiezs.Model.Question;
import org.com.leadquiezs.Utility.Action;
import org.com.leadquiezs.Utility.Message;
import org.com.leadquiezs.dao.QuestionDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class QuestionController extends HttpServlet {

    ApplicationContext context;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Question question = (Question) session.getAttribute("question");
        String rows = (String) req.getAttribute("rows");
        String outCome1 = (String) req.getAttribute("outComeparam1");
        String outCome2 = (String) req.getAttribute("outComeparam2");
        Action action = Action.valueOf((String) req.getAttribute("action"));

        context = (ApplicationContext) req.getServletContext().getAttribute("applicationContext");
        switch (action) {
            case addQuestion: {
                if (question.getQuiez() == null) {
                    req.setAttribute("message", new Message(Message.Error, "You do not Select Quiez PleaseSelect Quiez").getMessage());
                }
               else if (validator(question)) {
                    req.setAttribute("message", "You do not Select Quiez Or Not  Fill All Requird Data");

                } else {

                    boolean state = addQuestion(question);
                    if (state) {
                        req.setAttribute("message", "Question add Sucessfully");

                    } else {
                        req.setAttribute("message", "Question can not add Sucessfully");
                    }
                }
                break;
            }
            case removeQuestion: {
                if (question.getQuestionID() == null) {
                    req.setAttribute("message", "Question can not removed Sucessfully");
                } else {
                    boolean state = removeQuestion(question);
                    if (state) {
                        req.setAttribute("message", "Question removed Sucessfully");
                    } else {
                        req.setAttribute("message", "Question can not removed Sucessfully");
                    }
                }
                break;
            }
        }

        session.removeAttribute("question");
        req.getRequestDispatcher("questions.jsp").forward(req, resp);
    }

    private boolean addQuestion(Question question) {
        QuestionDao questionDao = (QuestionDao) context.getBean("questionDao");
        return questionDao.saveQuestion(question);
    }

    private boolean removeQuestion(Question question) {
        QuestionDao questionDao = (QuestionDao) context.getBean("questionDao");
        return questionDao.deleteQuestion(question);
    }

    private boolean validator(Question question) {

        if (question.getName() == null || question.getName().isEmpty()) {
            return true;
        }

        return false;
    }
}
