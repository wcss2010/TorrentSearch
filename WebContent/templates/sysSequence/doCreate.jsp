
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
SysSequence sysSequence = new SysSequence();
long sequenceId = box.getLongParam("sequenceId");
String tableDesc = box.getParam("tableDesc");
int incrementNum = box.getIntParam("incrementNum",-1);
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date lastUpdate = box.getDateParam("lastUpdate");

try {
	sysSequence.setTableName(dao.getSequenceId(SysSequence.class));
	
	sysSequence.setSequenceId(sequenceId);
	sysSequence.setTableDesc(tableDesc);
	sysSequence.setIncrementNum(incrementNum);
	sysSequence.setCreateDate(createDate);
	sysSequence.setLastUpdate(lastUpdate);
	
	dao.save(sysSequence);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加SysSequence","操作人："+MSC_USER.getUsername()+",新建了SysSequence数据，内容为：\r\n"+sysSequence.toString()+"\r\n"+opMsg);
%>