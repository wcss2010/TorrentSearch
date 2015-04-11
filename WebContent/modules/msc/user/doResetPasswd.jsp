<%@page import="org.guihuotv.search.web.util.PasswordUtils"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long userId = box.getLongParam("id");
	MscUser user = dao.load(MscUser.class, userId);
	String newPass = String.valueOf((int) Math.ceil((Math.random() * 100000000)));
	user.setPasswd(PasswordUtils.encode3Password(newPass));
	boolean sucOrNot = true;
	try {
		dao.update(user);
	} catch (Exception e) {
		sucOrNot = false;
	}
	if (sucOrNot) {
		out.println("密码重置成功！新密码为：" + newPass + "，请登录后及时修改。");
	} else {
		out.println("密码重置失败！请重新操作！");
	}
	MscActionLogger.log(dao, request, "web", "操作人：" + user.getUsername() + ",重置了" + user.getUsername() + "的密码");
%>