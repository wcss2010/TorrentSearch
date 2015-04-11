
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
long userId = box.getLongParam("userId");
int actionType = box.getIntParam("actionType",-1);
String actionModule = box.getParam("actionModule");
String actionCommand = box.getParam("actionCommand");
String actionBody = box.getParam("actionBody");
String actionIp = box.getParam("actionIp");
java.util.Date actionDate = box.getDateParam("actionDate");

SysActionLog sysActionLog = (SysActionLog)dao.load(SysActionLog.class,id);
//开始do
try {
	sysActionLog.setUserId(userId);
	sysActionLog.setActionType(actionType);
	sysActionLog.setActionModule(actionModule);
	sysActionLog.setActionCommand(actionCommand);
	sysActionLog.setActionBody(actionBody);
	sysActionLog.setActionIp(actionIp);
	sysActionLog.setActionDate(actionDate);
	
	dao.update(sysActionLog);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改SysActionLog","操作人："+MSC_USER.getUsername()+"，修改了SysActionLog数据，ID为："+id+"，内容为：\r\n"+String.valueOf(sysActionLog.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>