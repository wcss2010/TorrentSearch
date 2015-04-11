package org.guihuotv.search.web.msc;

import java.util.Date;

 
/**
 * 登录信息
 * 
 * @author axeon
 *
 */
public class MscSingleLogonInfo{
	
	/**
	 * 登录用户ID
	 */
	private long id;
	
	/**
	 * 登录用户�?	 */
	private String username;
	
	/**
	 * 用户登录的IP
	 */
	private String ip;
	
	/**
	 * 用户登记的sessionId
	 */
	private String sessionId;
	
	/**
	 * 用户登录的时�?	 */
	private Date logonDate;
	
	/**
	 * �?��操作时间
	 */
	private Date lastUpdate;
	
	/**
	 * �?��操作动作
	 */
	private String lastAction;
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getLogonDate() {
		return logonDate;
	}

	public void setLogonDate(Date logonDate) {
		this.logonDate = logonDate;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getLastAction() {
		return lastAction;
	}

	public void setLastAction(String lastAction) {
		this.lastAction = lastAction;
	}
	
}