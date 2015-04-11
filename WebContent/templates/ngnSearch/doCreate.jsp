
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
NgnSearch ngnSearch = new NgnSearch();
long userId = box.getLongParam("userId");
String searchurl = box.getParam("searchurl");
int status = box.getIntParam("status",-1);

try {
	ngnSearch.setId(dao.getSequenceId(NgnSearch.class));
	
	ngnSearch.setUserId(userId);
	ngnSearch.setSearchurl(searchurl);
	ngnSearch.setStatus(status);
	
	dao.save(ngnSearch);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加NgnSearch","操作人："+MSC_USER.getUsername()+",新建了NgnSearch数据，内容为：\r\n"+ngnSearch.toString()+"\r\n"+opMsg);
%>