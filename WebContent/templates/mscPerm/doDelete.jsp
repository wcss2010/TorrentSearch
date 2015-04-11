
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "";
//开始do
MscPerm mscPerm = (MscPerm)dao.load(MscPerm.class,id);
try {
	mscPerm.setStatus(-1);
	dao.update(mscPerm);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
MscActionLogger.log(dao,request,"删除MscPerm","操作人："+MSC_USER.getUsername()+"，删除了MscPerm数据，ID为："+id+"，内容为：\r\n"+String.valueOf(mscPerm)+"\r\n"+opMsg);
out.clear();
out.print(opMsg);
%>