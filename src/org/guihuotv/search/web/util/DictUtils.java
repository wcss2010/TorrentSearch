package org.guihuotv.search.web.util;

import java.util.HashMap;

import org.guihuotv.search.web.pojo.NgnUser;

import uw.dm.DAOFactory;
import uw.dm.DataList;

public class DictUtils 
{
	/**
	 * Daofactory的引入
	 */
	private final static DAOFactory dao = DAOFactory.getInstance();
	
	public static HashMap<Long,String> userMaps = new HashMap<Long,String>();
		
	static 
	{
		refreshUserMap();
	}
	

	/**
	 * 更新终端类型map
	 */
	public static void refreshUserMap() {
		DataList<NgnUser> type = null;
		try {
			type = dao.list(NgnUser.class, "where status>0");
		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
		}
		userMaps.clear();
		for (NgnUser prt : type) {
			userMaps.put(prt.getId(), prt.getUsername());
		}
	}
	
	public static String getUserName(long id)
	{
		if (userMaps.containsKey(id))
		{
			return userMaps.get(id);
		}else
		{
			return "";
		}
	}
}