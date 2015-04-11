<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="checkLicense.jsp"%>
<%
	long userId=box.getLongParam("id");
	MscUser mu=dao.load(MscUser.class,userId);
	mu.setStatus(-1);
	String opMsg = "操作成功！";
	boolean sucOrNot = true;
	try {
		dao.update(mu);
	} catch (Exception e) {
		sucOrNot = false;
	}
	if (sucOrNot) {
		MscActionLogger.log(dao,request,"web","操作人："+MSC_USER.getUsername()+",删除了"+mu.getUsername()+"的用户");
		opMsg = "删除成功！";
	} else {
		opMsg = "删除失败！";
	}
	
	out.clear();
	out.print(opMsg);
%>