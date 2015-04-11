
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
MscPerm mscPerm = new MscPerm();
long parentId = box.getLongParam("parentId");
int permType = box.getIntParam("permType",-1);
String permName = box.getParam("permName");
String permDesc = box.getParam("permDesc");
int childNum = box.getIntParam("childNum",-1);
String actionUrl = box.getParam("actionUrl");
int menuLayer = box.getIntParam("menuLayer",-1);
String menuPath = box.getParam("menuPath");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

try {
	mscPerm.setId(dao.getSequenceId(MscPerm.class));
	
	mscPerm.setParentId(parentId);
	mscPerm.setPermType(permType);
	mscPerm.setPermName(permName);
	mscPerm.setPermDesc(permDesc);
	mscPerm.setChildNum(childNum);
	mscPerm.setActionUrl(actionUrl);
	mscPerm.setMenuLayer(menuLayer);
	mscPerm.setMenuPath(menuPath);
	mscPerm.setCreateDate(createDate);
	mscPerm.setModifyDate(modifyDate);
	mscPerm.setStatus(status);
	
	dao.save(mscPerm);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加MscPerm","操作人："+MSC_USER.getUsername()+",新建了MscPerm数据，内容为：\r\n"+mscPerm.toString()+"\r\n"+opMsg);
%>