package com.odev.application;

import jakarta.servlet.ServletContext;

public class AppContext {
    private static ServletContext servletContext;

    public static void setServletContext(ServletContext context) {
        servletContext = context;
    }

    public static String getContextParam(String paramName) {
        if (servletContext != null) {
            return servletContext.getInitParameter(paramName);
        }
        return null;
    }
}