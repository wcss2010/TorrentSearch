
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
SysActionLog sysActionLog = new SysActionLog();
long userId = box.getLongParam("userId");
int actionType = box.getIntParam("actionType",-1);
String actionModule = box.getParam("actionModule");
String actionCommand = box.getParam("actionCommand");
String actionBody = box.getParam("actionBody");
String actionIp = box.getParam("actionIp");
java.util.Date actionDate = box.getDateParam("actionDate");

try {
	sysActionLog.setId(dao.getSequenceId(SysActionLog.class));
	
	sysActionLog.setUserId(userId);
	sysActionLog.setActionType(actionType);
	sysActionLog.setActionModule(actionModule);
	sysActionLog.setActionCommand(actionCommand);
	sysActionLog.setActionBody(actionBody);
	sysActionLog.setActionIp(actionIp);
	sysActionLog.setActionDate(actionDate);
	
	dao.save(sysActionLog);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加SysActionLog","操作人："+MSC_USER.getUsername()+",新建了SysActionLog数据，内容为：\r\n"+sysActionLog.toString()+"\r\n"+opMsg);
%>