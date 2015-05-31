
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
String name = box.getParam("name");
int timertype = box.getIntParam("timertype",-1);
java.util.Date timer = box.getDateParam("timer");
String timerurl = box.getParam("timerurl");
String p1 = box.getParam("p1");
String p2 = box.getParam("p2");
String p3 = box.getParam("p3");
java.util.Date createtime = box.getDateParam("createtime");
int status = box.getIntParam("status",-1);

NgnTimer ngnTimer = (NgnTimer)dao.load(NgnTimer.class,id);
//开始do
try {
	ngnTimer.setName(name);
	ngnTimer.setTimertype(timertype);
	ngnTimer.setTimer(timer);
	ngnTimer.setTimerurl(timerurl);
	ngnTimer.setP1(p1);
	ngnTimer.setP2(p2);
	ngnTimer.setP3(p3);
	ngnTimer.setCreatetime(createtime);
	ngnTimer.setStatus(status);
	
	dao.update(ngnTimer);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改NgnTimer","操作人："+MSC_USER.getUsername()+"，修改了NgnTimer数据，ID为："+id+"，内容为：\r\n"+String.valueOf(ngnTimer.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>