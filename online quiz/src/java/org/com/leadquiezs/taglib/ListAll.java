/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.com.leadquiezs.taglib;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.com.leadquiezs.Model.OutCome;
import org.com.leadquiezs.Model.Question;
import org.com.leadquiezs.Model.Quiez;
import org.com.leadquiezs.dao.OutComeDao;
import org.com.leadquiezs.dao.QuestionDao;
import org.com.leadquiezs.dao.QuiezDao;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author MohamedSayed
 */
public class ListAll extends BodyTagSupport {

    private String listBy;

    @Override
    public int doStartTag() throws JspException {
        ApplicationContext context = (ApplicationContext) pageContext.getServletContext().getAttribute("applicationContext");
        switch (listBy) {
            case "quiez": {
                QuiezDao quiezDao = (QuiezDao) context.getBean("quiezDoa");
                Map<String, Quiez> quiezs = quiezDao.Quiezs();
                QuestionDao questionDao = (QuestionDao) context.getBean("questionDao");
               
                pageContext.setAttribute("quiezs", quiezs, pageContext.PAGE_SCOPE);
                break;
            }
            case "outCome": {
                Quiez quiez = (Quiez) pageContext.getSession().getAttribute("quiez");
                if (quiez == null||validateData(quiez)) {
                    pageContext.setAttribute("outComes", null, pageContext.PAGE_SCOPE);
                } else {
                    
                    OutComeDao outComeDao = (OutComeDao) context.getBean("outComeDao");
                   Map<String, OutCome>  outComes = outComeDao.OutComes(quiez);
                    pageContext.setAttribute("outComes", outComes, pageContext.SESSION_SCOPE);
                    
                }
                break;
            }
            case "question": {
                Quiez quiez = (Quiez) pageContext.getSession().getAttribute("quiez");
                if (quiez == null||validateData(quiez)) {
                    pageContext.setAttribute("questions", null, pageContext.PAGE_SCOPE);
                } 
                else{
                QuestionDao questionDao = (QuestionDao) context.getBean("questionDao");
                Map<String,Question> questions=questionDao.Questions(quiez);
                List<Question> questionslist=new ArrayList<>(questions.values());
                
                pageContext.setAttribute("questions", questions, pageContext.PAGE_SCOPE);
                pageContext.setAttribute("questionList", questionslist, pageContext.SESSION_SCOPE);
                pageContext.setAttribute("List", questionslist.size(), pageContext.SESSION_SCOPE);
                }
                break;
            }
        }
        return EVAL_BODY_INCLUDE;
    }
  private boolean validateData(Quiez quiez)
  {
      if(quiez.getQuiezID()==null)
          return true;
      if(quiez.getName()==null||quiez.getName().isEmpty())
          return true;
       
       
          
         return false;
  }
    public String getListBy() {
        return listBy;
    }

    public void setListBy(String listBy) {
        this.listBy = listBy;
    }

}
