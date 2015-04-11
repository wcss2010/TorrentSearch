
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
NgnNode ngnNode = new NgnNode();
String nodeName = box.getParam("nodeName");
String nodePass = box.getParam("nodePass");
int nodeType = box.getIntParam("nodeType",-1);
String aliasName = box.getParam("aliasName");
long orgId = box.getLongParam("orgId");
java.util.Date lastLogonDate = box.getDateParam("lastLogonDate");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

try {
	ngnNode.setId(dao.getSequenceId(NgnNode.class));
	
	ngnNode.setNodeName(nodeName);
	ngnNode.setNodePass(nodePass);
	ngnNode.setNodeType(nodeType);
	ngnNode.setAliasName(aliasName);
	ngnNode.setOrgId(orgId);
	ngnNode.setLastLogonDate(lastLogonDate);
	ngnNode.setCreateDate(createDate);
	ngnNode.setModifyDate(modifyDate);
	ngnNode.setStatus(status);
	
	dao.save(ngnNode);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加NgnNode","操作人："+MSC_USER.getUsername()+",新建了NgnNode数据，内容为：\r\n"+ngnNode.toString()+"\r\n"+opMsg);
%>