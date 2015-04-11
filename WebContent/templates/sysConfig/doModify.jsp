
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
String catName = box.getParam("catName");
String propName = box.getParam("propName");
String propValue = box.getParam("propValue");
String propComment = box.getParam("propComment");
String inputComment = box.getParam("inputComment");
String displayOrder = box.getParam("displayOrder");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

SysConfig sysConfig = (SysConfig)dao.load(SysConfig.class,id);
//开始do
try {
	sysConfig.setCatName(catName);
	sysConfig.setPropName(propName);
	sysConfig.setPropValue(propValue);
	sysConfig.setPropComment(propComment);
	sysConfig.setInputComment(inputComment);
	sysConfig.setDisplayOrder(displayOrder);
	sysConfig.setCreateDate(createDate);
	sysConfig.setModifyDate(modifyDate);
	sysConfig.setStatus(status);
	
	dao.update(sysConfig);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改SysConfig","操作人："+MSC_USER.getUsername()+"，修改了SysConfig数据，ID为："+id+"，内容为：\r\n"+String.valueOf(sysConfig.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>