package com.cmower.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.cmower.common.Variables;

public class AppContextInitListener implements ServletContextListener, HttpSessionListener {
	public void contextDestroyed(ServletContextEvent event) {
	}

	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		Variables.ctx = context.getContextPath();
	}

	public void sessionCreated(HttpSessionEvent event) {
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		session.invalidate();
	}

}
