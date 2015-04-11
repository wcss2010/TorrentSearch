<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%
	if("admin".equals(MSC_USER.getUsername())){%>
		<%@include file="superPage.jsp"%>
<%	}else{
%>
		<%@include file="generalPage.jsp"%>
		<%} %>
<%@include file="/include/footer.jsp"%>