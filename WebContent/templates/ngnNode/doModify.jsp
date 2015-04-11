
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
String nodeName = box.getParam("nodeName");
String nodePass = box.getParam("nodePass");
int nodeType = box.getIntParam("nodeType",-1);
String aliasName = box.getParam("aliasName");
long orgId = box.getLongParam("orgId");
java.util.Date lastLogonDate = box.getDateParam("lastLogonDate");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

NgnNode ngnNode = (NgnNode)dao.load(NgnNode.class,id);
//开始do
try {
	ngnNode.setNodeName(nodeName);
	ngnNode.setNodePass(nodePass);
	ngnNode.setNodeType(nodeType);
	ngnNode.setAliasName(aliasName);
	ngnNode.setOrgId(orgId);
	ngnNode.setLastLogonDate(lastLogonDate);
	ngnNode.setCreateDate(createDate);
	ngnNode.setModifyDate(modifyDate);
	ngnNode.setStatus(status);
	
	dao.update(ngnNode);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改NgnNode","操作人："+MSC_USER.getUsername()+"，修改了NgnNode数据，ID为："+id+"，内容为：\r\n"+String.valueOf(ngnNode.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>