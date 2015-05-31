
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "添加语音指令成功！";
//开始do
NgnSay ngnSay = new NgnSay();
String usersay = box.getParam("usersay");
String syscmd = box.getParam("syscmd");
String cmdcontent = box.getParam("cmdcontent");
String cmdp1 = box.getParam("cmdp1");
String cmdp2 = box.getParam("cmdp2");
String cmdp3 = box.getParam("cmdp3");
String cmdp4 = box.getParam("cmdp4");
String cmdp5 = box.getParam("cmdp5");

try {
	ngnSay.setId(dao.getSequenceId(NgnSay.class));
	
	ngnSay.setUsersay(usersay);
	ngnSay.setSyscmd(syscmd);
	ngnSay.setCmdcontent(cmdcontent);
	ngnSay.setCmdp1(cmdp1);
	ngnSay.setCmdp2(cmdp2);
	ngnSay.setCmdp3(cmdp3);
	ngnSay.setCmdp4(cmdp4);
	ngnSay.setCmdp5(cmdp5);
	ngnSay.setCreatetime(new Date());
	ngnSay.setStatus(1);
	
	dao.save(ngnSay);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加语音指令","操作人："+MSC_USER.getUsername()+",新建了语音指令数据，内容为：\r\n"+ngnSay.toString()+"\r\n"+opMsg);
%>