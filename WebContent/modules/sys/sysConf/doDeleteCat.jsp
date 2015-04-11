<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	String catName=box.getParam("catName");
	String sql="update sys_config set status=-1 where cat_name="+"'"+catName+"'";
	boolean sucOrNot = true;
	try{
	dao.executeCommand(sql);
	}catch(Exception e){
		sucOrNot=false;
		JSPLogger.error(e.getMessage(),e);
	}
	if(sucOrNot){
		MscActionLogger.log(dao,request,"删除分类","操作人："+MSC_USER.getUsername()+",删除了"+catName+"类别及其所属的所有配置属性");
		box.outJSAlert("删除成功！", "window.opener.location.reload();window.close();");
	}else{
		box.outJSAlert("删除失败, 请重新操作！", "window.opener.location.reload();window.close();");
	}
%>