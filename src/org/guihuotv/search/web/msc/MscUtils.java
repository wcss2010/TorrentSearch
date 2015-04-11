package org.guihuotv.search.web.msc;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.dm.DAOFactory;
import uw.dm.DataSet;
import uw.dm.TransactionException;
import uw.util.Cryptography;

/**
 * @author Patrick
 * 
 */
public class MscUtils {

	private static final Logger logger = LoggerFactory.getLogger(MscUtils.class);

	/**
	 * 存储路径和id的关�?key:路径 value:id
	 */
	public static Map<String, Long> permIdMap = new HashMap<String, Long>();
	
	
	/**
	 * 存储路径与名称的对应关系
	 */
	private static Map<String, String> permUrl2Name = new HashMap<String, String>();
	
	static {
		refreshPermIdMap();
	}

	/**
	 * 刷新权限ID映射
	 */
	public static void refreshPermIdMap() {
		DAOFactory dao = DAOFactory.getInstance();
		DataSet ds;
		try {
			Map<String, Long> map = new HashMap<String, Long>();
			ds = dao.queryForDataSet(dao.getConnectionName("msc_perm", "all"), "select id,action_url,perm_name from msc_perm order by id asc");
			while (ds.next()) {
				map.put(ds.getString("action_url"), ds.getLong("id"));
				permUrl2Name.put(ds.getString("action_url"), ds.getString("perm_name"));
			}
			permIdMap = map;
		} catch (TransactionException e) {
			logger.error(e.getMessage(),e);
		}
	}

	/**
	 * 根据路径URL得到其中文名称
	 * 
	 * @param requestUrl
	 */
	public static final String getPermCNName(String requestUrl) {
		try{
			if(requestUrl.contains(".")){
				requestUrl=requestUrl.substring(0, requestUrl.lastIndexOf("/")+1);
			}
			requestUrl = requestUrl.substring(0, requestUrl.length() - 1).replace("/modules", "");
			if (permUrl2Name.containsKey(requestUrl)) {
				return permUrl2Name.get(requestUrl);
			}
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "";
	}
	
	/**
	 * 加密参数
	 * @param param
	 * @return
	 */
	public static final String encodeParam(String param){
		return Cryptography.boxBase64(Cryptography.simpleEncrypt(Cryptography.encodeString(param),"SC_CT_ZJ!"));
	}
}