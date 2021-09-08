package com.jhta.neocom.util;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class VisitorCounter implements HttpSessionListener {
    private static int visit_count = 0;

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
        System.out.println("세션 생성!");
        visit_count += 1;
        HttpSession session = arg0.getSession();

        System.out.println("방문자 수 : " + visit_count);
        session.setAttribute("visit_count", visit_count);

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
    }
}