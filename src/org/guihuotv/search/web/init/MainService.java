package org.guihuotv.search.web.init;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 主服务框架。
 * 
 * @author axeon
 * 
 */
public class MainService {

	private static final Logger logger = LoggerFactory.getLogger(MainService.class);

	public static void start() {
		// 启动信令服务器
		try {
            //TODO 这里可以填启动Socket服务代码
			
			logger.info("Web Service Is Started！");
		} catch (Exception ex) {
			logger.error(ex.toString(), ex);
		}
	}

	public static void stop() {
		try {
			//TODO 这里可以填停止Socket服务代码
             
			logger.info("Web Service Is Stopped!");
		} catch (Exception ex) {
			logger.error(ex.toString(), ex);
		}
	}

	public static void main(String[] args) {
		start();
	}
}