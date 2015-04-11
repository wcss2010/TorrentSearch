package org.guihuotv.search.web.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class WebInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		MainService.start();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		MainService.stop();
	}
}