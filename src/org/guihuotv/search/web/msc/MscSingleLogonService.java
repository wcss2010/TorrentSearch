package org.guihuotv.search.web.msc;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 单用户登录服务�?
 * 用于维护用户单例登录�?
 * @author axeon
 *
 */
public class MscSingleLogonService {


	/**
	 * 已登录用户记�?
	 */
	private static LinkedHashMap<Long, MscSingleLogonInfo> logonMap = new LinkedHashMap<Long, MscSingleLogonInfo>();
	
	
	/**
	 * 获得登录Map
	 * @return
	 */
	public static Map<Long,MscSingleLogonInfo> getLogonMap(){
		return logonMap;
	}

	/**
	 * �?��是否单用户登�?
	 * 如果有人在线，则返回起登录信�?
	 * @param id
	 * @return
	 */
	public static MscSingleLogonInfo checkSingleLogon(long id){
		return logonMap.get(id);
	}
	

	/**
	 * 登录操作�?
	 * @param id
	 * @param sessionId
	 */
	public static void logon(long id,String username,String sessionId,String ip){
		MscSingleLogonInfo msli = new MscSingleLogonInfo();
		msli.setId(id);
		msli.setUsername(username);
		msli.setSessionId(sessionId);
		msli.setIp(ip);
		msli.setLogonDate(new Date());
		msli.setLastAction("系统登录");
		msli.setLastUpdate(new Date());
		logonMap.put(id, msli);
	}
	
	/**
	 * 更新登录用户操作
	 * @param id
	 * @param lastAction
	 */
	public static void update(long id,String lastAction){
		MscSingleLogonInfo msli = logonMap.get(id);
		msli.setLastAction(lastAction);
		msli.setLastUpdate(new Date());
		logonMap.put(id, msli);
	}
	
	/**
	 * 登录操作
	 * @param id
	 * @param sessionId
	 */
	public static void logout(long id){
		logonMap.remove(id);
	}
	


}


