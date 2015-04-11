package org.guihuotv.search.web.util;


import java.util.HashMap;
import java.util.Map;

import org.guihuotv.search.web.pojo.SysConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.dm.DAOFactory;
import uw.dm.DataList;
import uw.dm.TransactionException;

/**
 * 从数据库中读出配置文件。
 * 
 * @author axeon
 * 
 */
public class SysConfigUtils {

	private static final Logger logger = LoggerFactory.getLogger(SysConfigUtils.class);

	private static final DAOFactory dao = DAOFactory.getInstance();

	public static Map<String, String> cacheMap = new HashMap<String, String>();

	/**
	 * 将所有配置加载进缓存。
	 */
	public static void reload() {
		cacheMap.clear();
		try {
			DataList<SysConfig> list = dao.list(SysConfig.class, "where status=1");
			for (SysConfig sc : list) {
				if (sc.getPropName().length() > 0)
					cacheMap.put(sc.getCatName() + '.' + sc.getPropName(), sc.getPropValue());
			}
		} catch (TransactionException e) {
			logger.error(e.getMessage(), e);
		}

	}

	/**
	 * 获得一个String数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static String getString(String catName, String propName) {
		return cacheMap.get(catName + '.' + propName);
	}

	/**
	 * 获得一个String数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static String getString(String catName, String propName, String defaultValue) {
		String value = getString(catName, propName);
		if (value == null)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 获得一个Int数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static int getInt(String catName, String propName) {
		String txt = getString(catName, propName);
		int value = -1;
		try {
			value = Integer.parseInt(txt);
		} catch (Exception e) {
		}
		return value;
	}

	/**
	 * 获得一个Int数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static int getInt(String catName, String propName, int defaultValue) {
		int value = getInt(catName, propName);
		if (value == -1)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 获得一个Long数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static long getLong(String catName, String propName) {
		String txt = getString(catName, propName);
		long value = -1;
		try {
			value = Long.parseLong(txt);
		} catch (Exception e) {
		}
		return value;
	}

	/**
	 * 获得一个Long数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static long getLong(String catName, String propName, long defaultValue) {
		long value = getLong(catName, propName);
		if (value == -1)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 获得一个Float数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static float getFloat(String catName, String propName) {
		String txt = getString(catName, propName);
		float value = -1;
		try {
			value = Float.parseFloat(txt);
		} catch (Exception e) {
		}
		return value;
	}

	/**
	 * 获得一个Float数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static float getFloat(String catName, String propName, float defaultValue) {
		float value = getFloat(catName, propName);
		if (value == -1)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 获得一个Double数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static double getDouble(String catName, String propName) {
		String txt = getString(catName, propName);
		double value = -1;
		try {
			value = Double.parseDouble(txt);
		} catch (Exception e) {
		}
		return value;
	}

	/**
	 * 获得一个Double数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static double getDouble(String catName, String propName, double defaultValue) {
		double value = getDouble(catName, propName);
		if (value == -1)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 获得一个Boolean数值
	 * 
	 * @param catName
	 * @param propName
	 * @return
	 */
	public static Boolean getBoolean(String catName, String propName) {
		String txt = getString(catName, propName);
		Boolean value = null;
		try {
			value = Boolean.parseBoolean(txt);
		} catch (Exception e) {
		}
		return value;
	}

	/**
	 * 获得一个Boolean数值，如果配置为null，则返回指定的默认值。
	 * 
	 * @param catName
	 * @param propName
	 * @param defaultValue
	 * @return
	 */
	public static Boolean getBoolean(String catName, String propName, boolean defaultValue) {
		Boolean value = getBoolean(catName, propName);
		if (value == null)
			return defaultValue;
		else
			return value;
	}

	/**
	 * 保存属性
	 * 
	 * @param properties
	 */
	public static void saveProperties(Map<String, String> properties) {
		if (properties != null && properties.size() > 0) {
			for (Map.Entry<String, String> entry : properties.entrySet()) {
				String[] paramList = entry.getKey().split("\\.");
				try {
					SysConfig sysConfig = dao.listSingle(SysConfig.class, "where cat_name=? and prop_name=?", paramList);
					sysConfig.setPropValue(entry.getValue());
					dao.update(sysConfig);
					reload();
				} catch (TransactionException e) {
					logger.error(e.getMessage(), e);
				}
			}
		}
	}

	static {
		reload();
	}
}