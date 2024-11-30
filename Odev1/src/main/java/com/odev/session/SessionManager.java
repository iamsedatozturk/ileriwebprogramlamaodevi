package com.odev.session;

import jakarta.servlet.http.HttpSession;

public class SessionManager {
    private static ThreadLocal<HttpSession> sessionThreadLocal = new ThreadLocal<>();

    public static void setSession(HttpSession session) {
        sessionThreadLocal.set(session);
    }

    public static HttpSession getSession() {
        return sessionThreadLocal.get();
    }

    public static Object getAttribute(String name) {
        HttpSession session = getSession();
        if (session != null) {
            return session.getAttribute(name);
        }
        return null;
    }

    public static void setAttribute(String name, Object value) {
        HttpSession session = getSession();
        if (session != null) {
            session.setAttribute(name, value);
        }
    }

    public static void clearSession() {
        HttpSession session = getSession();
        if (session != null) {
            session.invalidate();
        }
    }
}
