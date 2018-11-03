package org.com.Lisiner;

import javax.servlet.*;
import java.sql.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LeadquiezsLisener implements ServletContextListener {

    ApplicationContext context;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        context = (ApplicationContext) sce.getServletContext().getAttribute("applicationContext");
        if (context == null) {
            context = new ClassPathXmlApplicationContext("applicationContext.xml");
            sce.getServletContext().setAttribute("applicationContext", context);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("applicationContext", null);
    }

}
