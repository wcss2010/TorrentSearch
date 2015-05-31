
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "添加定时任务成功！";
//开始do
NgnTimer ngnTimer = new NgnTimer();
String name = box.getParam("name");
int timertype = box.getIntParam("timertype",1);
java.util.Date timer = box.getDateParam("timer");
String timerurl = box.getParam("timerurl");
String p1 = box.getParam("p1");
String p2 = box.getParam("p2");
String p3 = box.getParam("p3");

try {
	ngnTimer.setId(dao.getSequenceId(NgnTimer.class));
	
	ngnTimer.setName(name);
	ngnTimer.setTimertype(timertype);
	ngnTimer.setTimer(timer);
	ngnTimer.setTimerurl(timerurl);
	ngnTimer.setP1(p1);
	ngnTimer.setP2(p2);
	ngnTimer.setP3(p3);
	ngnTimer.setCreatetime(new Date());
	ngnTimer.setStatus(1);
	
	dao.save(ngnTimer);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加定时任务","操作人："+MSC_USER.getUsername()+",新建了定时任务数据，内容为：\r\n"+ngnTimer.toString()+"\r\n"+opMsg);
%>