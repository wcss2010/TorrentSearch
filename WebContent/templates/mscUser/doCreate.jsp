
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
MscUser mscUser = new MscUser();
String username = box.getParam("username");
String passwd = box.getParam("passwd");
String mscPerm = box.getParam("mscPerm");
String orgPerm = box.getParam("orgPerm");
String orgName = box.getParam("orgName");
String aliasName = box.getParam("aliasName");
String telephone = box.getParam("telephone");
String mobile = box.getParam("mobile");
String email = box.getParam("email");
java.util.Date lastLogonDate = box.getDateParam("lastLogonDate");
String lastLogonIp = box.getParam("lastLogonIp");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

try {
	mscUser.setId(dao.getSequenceId(MscUser.class));
	
	mscUser.setUsername(username);
	mscUser.setPasswd(passwd);
	mscUser.setMscPerm(mscPerm);
	mscUser.setOrgPerm(orgPerm);
	mscUser.setOrgName(orgName);
	mscUser.setAliasName(aliasName);
	mscUser.setTelephone(telephone);
	mscUser.setMobile(mobile);
	mscUser.setEmail(email);
	mscUser.setLastLogonDate(lastLogonDate);
	mscUser.setLastLogonIp(lastLogonIp);
	mscUser.setCreateDate(createDate);
	mscUser.setModifyDate(modifyDate);
	mscUser.setStatus(status);
	
	dao.save(mscUser);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加MscUser","操作人："+MSC_USER.getUsername()+",新建了MscUser数据，内容为：\r\n"+mscUser.toString()+"\r\n"+opMsg);
%>