
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
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
java.util.Date createtime = box.getDateParam("createtime");
int status = box.getIntParam("status",-1);

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
	ngnSay.setCreatetime(createtime);
	ngnSay.setStatus(status);
	
	dao.save(ngnSay);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加NgnSay","操作人："+MSC_USER.getUsername()+",新建了NgnSay数据，内容为：\r\n"+ngnSay.toString()+"\r\n"+opMsg);
%>