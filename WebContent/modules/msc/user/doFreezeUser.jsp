<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long userId=box.getLongParam("id");
	MscUser mu=dao.load(MscUser.class,userId);
	mu.setStatus(0);
	String opMsg = "操作成功！";
	try {
		dao.update(mu);
	} catch (Exception e) {
		JSPLogger.error(e.getMessage(),e);
		opMsg = "操作错误！错误信息为："+e.getMessage();
	}
	
	MscActionLogger.log(dao,request,"web",MSC_USER.getUsername()+"冻结了"+mu.getUsername()+"账户，操作人为："+MSC_USER.getUsername());
	out.clear();
	out.print(opMsg);
%>