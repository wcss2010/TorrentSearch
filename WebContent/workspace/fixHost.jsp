<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String host = box.getParam("host");
session.setAttribute("FIX_HOST",host);
%>