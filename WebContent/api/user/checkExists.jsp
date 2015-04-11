<%@page import="org.guihuotv.search.web.pojo.NgnUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/api/include/init_nologin.jsp"%>
<%
//检查是否存在该账号
String mobile = box.getParam("mobile");
if (mobile.isEmpty()){
	RETCODE = -1;
	MESSAGE = "请正确填写手机号！！！"; 
}else{
	int count = dao.queryForCount("select count(1) from ngn_user where mobile=? and status=1",new Object[]{mobile});
	if (count>0){
		RETCODE = -2;
		MESSAGE = "您申请的手机号已被注册，请尝试找回密码！！！"; 
	}
}
%>
<%@include file="/api/include/output.jsp"%>