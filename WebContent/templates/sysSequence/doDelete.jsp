
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "";
//开始do
SysSequence sysSequence = (SysSequence)dao.load(SysSequence.class,table_name);
try {
	sysSequence.setStatus(-1);
	dao.update(sysSequence);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
MscActionLogger.log(dao,request,"删除SysSequence","操作人："+MSC_USER.getUsername()+"，删除了SysSequence数据，ID为："+id+"，内容为：\r\n"+String.valueOf(sysSequence)+"\r\n"+opMsg);
out.clear();
out.print(opMsg);
%>