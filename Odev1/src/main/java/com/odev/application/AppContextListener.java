package com.odev.application;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        AppContext.setServletContext(sce.getServletContext());
        System.out.println("Web uygulaması başlatıldı!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AppContext.setServletContext(null);
        System.out.println("Web uygulaması sonlandırıldı!");
    }
}