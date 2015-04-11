
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "";
//开始do
NgnOrg ngnOrg = (NgnOrg)dao.load(NgnOrg.class,id);
try {
	ngnOrg.setStatus(-1);
	dao.update(ngnOrg);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
MscActionLogger.log(dao,request,"删除NgnOrg","操作人："+MSC_USER.getUsername()+"，删除了NgnOrg数据，ID为："+id+"，内容为：\r\n"+String.valueOf(ngnOrg)+"\r\n"+opMsg);
out.clear();
out.print(opMsg);
%>