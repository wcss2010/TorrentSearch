
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "";
//开始do
SysConfig sysConfig = (SysConfig)dao.load(SysConfig.class,id);
try {
	sysConfig.setStatus(-1);
	dao.update(sysConfig);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
MscActionLogger.log(dao,request,"删除SysConfig","操作人："+MSC_USER.getUsername()+"，删除了SysConfig数据，ID为："+id+"，内容为：\r\n"+String.valueOf(sysConfig)+"\r\n"+opMsg);
out.clear();
out.print(opMsg);
%>