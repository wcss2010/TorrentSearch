<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.guihuotv.search.web.msc.*"%>
<%@page import="org.guihuotv.search.web.pojo.*"%>
<%@ page import="uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>

<%
PageBox box=new PageBox(request,response,out);
String lastIp=box.getRealIp();
if("0:0:0:0:0:0:0:1".equals(lastIp)){
	lastIp="127.0.0.1";
}
MscUser MSC_USER=(MscUser)box.getObjectSession("userInfo");
//处理msli
MscSingleLogonService.logon(MSC_USER.getId(), MSC_USER.getUsername(),session.getId(), lastIp);
out.clear();
response.sendRedirect("/workspace/");
%>

