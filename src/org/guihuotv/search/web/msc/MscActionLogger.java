package org.guihuotv.search.web.msc;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import org.guihuotv.search.web.pojo.MscUser;
import org.guihuotv.search.web.pojo.SysActionLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import uw.dm.DAOFactory;
import uw.dm.TransactionException;

/**
 * 用于记录管理中心操作的日志类 实际使用中，在每个页面都包含的footer.jsp中使用log(DAOFactory
 * dao,HttpServletRequest request)方法记录访问信息�? 在对数据操作的方法中使用log(DAOFactory
 * dao,HttpServletRequest request, String tag,String actionBody)方法�?
 * 
 * @author axeon
 */
public class MscActionLogger {

	private static final Logger logger = LoggerFactory.getLogger(MscActionLogger.class);

	/**
	 * 内部初始化dao
	 */
	private static DAOFactory dao = DAOFactory.getInstance();

	/**
	 * 用于建表的日期格式化
	 */
	private static SimpleDateFormat monthFormat = new SimpleDateFormat("yyyyMM", Locale.US);
	/**
	 * 当前使用的分表名
	 */
	private static String tableName;

	/**
	 * 获得当前的表Set
	 */
	private static HashSet<String> getCurrentTableSet() {
		HashSet<String> set = new HashSet<String>();
		List<String> list = null;
		try {
			list = dao.queryForSingleList(dao.getConnectionName("sys_action_log", "all"), "show tables");
			if (list != null) {
				for (String s : list) {
					if (s.startsWith("sys_action_log_"))
						set.add(s);
				}
			}
		} catch (TransactionException e) {
			logger.error(e.getMessage(), e);
		}
		return set;
	}

	/**
	 * �?��当前分区表，如果不存在则建立�?
	 */
	private static void checkForCreateTable() {
		HashSet<String> set = getCurrentTableSet();
		String month = monthFormat.format(new Date());
		String tname = "sys_action_log_" + month;
		try {
			if (!set.contains(tname)) {
				String sql = "create table `" + tname + "` (\n" + "`id` bigint(20) NOT NULL COMMENT 'ID',\n" + "`user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',\n" + "`action_type` tinyint(4) DEFAULT NULL COMMENT '操作类型',\n" + "`action_module` varchar(100) DEFAULT NULL COMMENT '操作的模块',\n" + "`action_command` varchar(20) DEFAULT NULL COMMENT '操作的指令',\n" + "`action_body` varchar(500) DEFAULT NULL COMMENT '操作的内容',\n" + "`action_ip` varchar(20) DEFAULT NULL COMMENT '操作的ip地址',\n" + "`action_date` datetime DEFAULT NULL COMMENT '操作的日期',\n" + "PRIMARY KEY (`id`)\n" + ")";
				dao.executeCommand(dao.getConnectionName("sys_action_log", "all"), sql);
			}
		} catch (TransactionException e) {
			logger.error(e.getMessage(), e);
		}
		tableName = tname.toLowerCase();
	}

	static {
		// 定在下个月的第一天创建新
		Calendar cal = Calendar.getInstance();
		cal.setTime(new java.util.Date());
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				checkForCreateTable();
			}
		}, cal.getTime(), 24 * 60 * 60 * 1000);
		checkForCreateTable();
	}

	/**
	 * 记录日志�? 当调用此方法时，系统将会自动记录访问的情况�?
	 * 
	 * @param dao
	 *            init.jsp中初始化的dao对象
	 * @param request
	 *            jsp中的request对象�? * @throws TransactionException
	 */
	public static void log(DAOFactory dao, HttpServletRequest request) throws TransactionException {
		log(dao, request, "", null);
	}

	/**
	 * 记录日志
	 * 
	 * @param dao
	 *            init.jsp中初始化的dao对象
	 * @param request
	 *            jsp中的request对象
	 * @param tag
	 *            动作标签，用于快速识�?
	 * @param actionBody
	 *            动作内容
	 * @throws TransactionException
	 */
	public static void log(DAOFactory dao, HttpServletRequest request, String cmd, String actionBody) {
		try {
			int level = 2;
			String url = request.getServletPath();
			int p = url.lastIndexOf('/');
			String prefix = "/modules";
			if (url.startsWith(prefix) && p > prefix.length()) {
				url = url.substring(prefix.length(), p);
			}
			String ip = uw.util.IPAddressUtils.getIpAddr(request);
			if (actionBody == null || actionBody.equals("")) {
				actionBody = dumpPageParam(request);
				level = 1;
			}
			MscUser mu = null;
			mu = (MscUser) request.getSession().getAttribute("userInfo");

			long userId = 0l;
			if (mu != null) {
				userId = mu.getId();
			}

			SysActionLog log = new SysActionLog();
			log.setActionType(level);
			log.setUserId(userId);
			log.setActionModule(url);
			log.setActionCommand(cmd);
			log.setActionBody(actionBody);
			log.setActionIp(ip);
			log.setActionDate(new java.util.Date());
			dao.save(log, tableName);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 获得页面参数
	 * 
	 * @param request
	 * @return
	 */
	private static String dumpPageParam(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer("当前访问的页面是:");
		sb.append(request.getRequestURL());
		sb.append("\n页面参数为：");
		Enumeration<String> eu = request.getParameterNames();
		while (eu.hasMoreElements()) {
			String pn = eu.nextElement();
			if (pn != null) {
				sb.append(pn).append("=");
				String[] pvs = request.getParameterValues(pn);
				if (pvs != null) {
					for (int i = 0; i < pvs.length; i++) {
						sb.append(pvs[i]);
						if (i > 0)
							sb.append(",");
					}
				}
				sb.append("&");
			}
		}
		if (sb.charAt(sb.length() - 1) == '&')
			sb.deleteCharAt(sb.length() - 1);
		String referer = request.getHeader("referer");
		if (referer != null && !referer.equals("")) {
			sb.append("\n来源页面:");
			sb.append(referer);
		}
		return sb.toString();
	}

}
