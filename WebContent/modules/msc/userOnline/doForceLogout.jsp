<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
MscSingleLogonService.logout(id);
out.clear();
box.outJSAlert("完成强制踢出操作！","history.back(-1)");
%>
