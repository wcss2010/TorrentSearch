<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.guihuotv.search.web.pojo.*,org.guihuotv.search.web.msc.*,org.guihuotv.search.web.util.*,org.guihuotv.search.web.util.*"%>
<%@ page import="uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>
<%
request.setCharacterEncoding("UTF-8");
//页面标题
PageBox box = new PageBox(request, response, out);
DAOFactory dao = DAOFactory.getInstance();
//输出变量
int RETCODE = 0;
String MESSAGE = "";
Object DATA = null;
//总数据大小
int DATA_ALLSIZE=0;
//数据开始位置
int DATA_STARTPOS=0;
//每页大小
int DATA_RESULTNUM=0;
%>