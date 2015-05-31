
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "";
//开始do
NgnSay ngnSay = (NgnSay)dao.load(NgnSay.class,id);
try {
	dao.delete(ngnSay);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
MscActionLogger.log(dao,request,"删除语音指令","操作人："+MSC_USER.getUsername()+"，删除了语音指令数据，ID为："+id+"，内容为：\r\n"+String.valueOf(ngnSay)+"\r\n"+opMsg);
out.clear();
out.print(opMsg);
%>