<%@page import="org.guihuotv.search.web.pojo.NgnUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/api/include/init_nologin.jsp"%>
<%
//用于初始化Account。
String mobile = box.getParam("mobile");
String password = box.getParam("passwd");
if (mobile.isEmpty()||password.isEmpty()){
	RETCODE = -1;
	MESSAGE = "请正确填写手机号和密码！！！"; 
}else{
	NgnUser user = new NgnUser();
	user.setMobile(mobile);
	user.setPasswd(password);
	dao.save(user);
	DATA = user.getId();
}
%>
<%@include file="/api/include/output.jsp"%>