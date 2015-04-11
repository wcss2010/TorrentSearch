<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- <html xmlns="http://www.w3.org/1999/xhtml">  -->
<%@include file="/include/init.jsp" %>
<head>
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<title><%=PAGE_TITLE%> - <%=PAGE_TITLE %></title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<style>
<!--
a:link {
	color: #FFFFFF;
}
a:visited {
	color: #FFFFFF;
}
a:active {
	color: #FFFFFF;
}
a:hover {
	color: #FFFFFF;
}
-->
</style>
</head>
<body>
<div class="head">
<div class="logo"><img src="/images/logo.jpg"></div>
<div class="dqgly">
<%
MscUser currentMu=(MscUser)session.getAttribute("userInfo");
String currentUser=(currentMu == null? "": currentMu.getUsername());
SimpleDateFormat sdfWhole=new SimpleDateFormat("yyyy-MM-dd HH:mm");
if(!"".equals(currentUser)){
%>
 <b>
 当前登录人员：<%=currentUser%></b>&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
<%} %>
  本次登录时间：<%=sdfWhole.format(currentMu.getLastLogonDate())%>/IP：<%=currentMu.getLastLogonIp()%>
  <img src="/images/button_tc.gif" onClick="javascript:window.parent.location.href='/doLogin.jsp?operation=logout';" style="cursor:pointer;">
  
</div>
</div>
