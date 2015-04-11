<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
MscUser mu=dao.load(MscUser.class,MSC_USER.getId());
String tel=box.getParam("tel");
String mobile=box.getParam("mobile");
String address=box.getParam("address");
String department=box.getParam("department");
String man=box.getParam("man");
String email=box.getParam("email");
mu.setEmail(email);
mu.setTelephone(tel);
mu.setMobile(mobile);
mu.setModifyDate(new Date());
try{
dao.update(mu);
session.setAttribute("userInfo",mu);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
}
box.outJSAlert("修改成功！","window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改用户信息",mu.getUsername()+" 修改了用户信息，操作人："+MSC_USER.getUsername());
%>