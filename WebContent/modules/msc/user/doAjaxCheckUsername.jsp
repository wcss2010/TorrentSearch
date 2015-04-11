<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String username=box.getParam("username");
DataList<MscUser> mu=dao.list(MscUser.class,"where status=1 and username='"+username+"'");
String resString="";
if(mu.size()<1){
	resString="1";
}else{
	resString="0";
}
	out.clear();
	out.print("{flag:" + resString + "}");
%>