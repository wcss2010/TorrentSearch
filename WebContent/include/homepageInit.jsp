<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.guihuotv.search.web.msc.*,org.guihuotv.search.web.util.*"%>
<%@page import="org.guihuotv.search.web.pojo.*"%>
<%@page import="java.text.*,java.util.*,java.util.Map.*,java.io.*"%>
<%@page import="uw.util.web.*,uw.util.*,uw.dm.*"%>
<%
	//定义时间格式
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdfDetail = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//对是汉字的参数编码
	request.setCharacterEncoding("UTF-8");
	PageBox box = new PageBox(request, response, out);
	//DAO
	DAOFactory dao = DAOFactory.getInstance();
	//权限校验
	//LicenseManager8.verifyOneTenThousandChance(ProductVerify8.getPubKey(), new LicenseExceptionProcess8());
	//页面标题
	String PAGE_TITLE = "焰火磁力聚合搜索系统";
	String MENU_TITLE = MscUtils.getPermCNName(request.getRequestURI());
	if (!"".equals(MENU_TITLE)) {
		PAGE_TITLE = MENU_TITLE;
	}
	//每页的条数
	int RESULT_NUM = 30;
	String errorInfo = "请联系管理人员！";
%>