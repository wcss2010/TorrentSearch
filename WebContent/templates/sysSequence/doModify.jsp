
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
long sequenceId = box.getLongParam("sequenceId");
String tableDesc = box.getParam("tableDesc");
int incrementNum = box.getIntParam("incrementNum",-1);
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date lastUpdate = box.getDateParam("lastUpdate");

SysSequence sysSequence = (SysSequence)dao.load(SysSequence.class,table_name);
//开始do
try {
	sysSequence.setSequenceId(sequenceId);
	sysSequence.setTableDesc(tableDesc);
	sysSequence.setIncrementNum(incrementNum);
	sysSequence.setCreateDate(createDate);
	sysSequence.setLastUpdate(lastUpdate);
	
	dao.update(sysSequence);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改SysSequence","操作人："+MSC_USER.getUsername()+"，修改了SysSequence数据，ID为："+id+"，内容为：\r\n"+String.valueOf(sysSequence.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>