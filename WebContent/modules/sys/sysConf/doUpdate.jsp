<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	int id=box.getIntParam("id");
	String propName=box.getParam("propName");
	String propValue=box.getParam("propValue");
	String propDesc=box.getParam("propDesc");
	String inputDesc=box.getParam("inputDesc");
	SysConfig sc=dao.load(SysConfig.class,id);
	sc.setPropName(propName);
	sc.setPropComment(propDesc);
	sc.setInputComment(inputDesc);
	sc.setPropValue(propValue);
	sc.setModifyDate(new Date());
	boolean sucOrNot = true;
	try {
		dao.update(sc);
		
		SysConfigUtils.reload();
	} catch (Exception e) {
		JSPLogger.error(e.getMessage(),e);
		sucOrNot = false;
	}
	if (sucOrNot) {
		MscActionLogger.log(dao,request,"修改系统设置中"+sc.getPropComment()+"属性的值，修改为"+propValue," 操作人："+MSC_USER.getUsername());
		box.outJSAlert("修改成功！", "window.opener.location.reload();window.close();");
	} else {
		box.outJSAlert("修改失败！请重新修改！","window.opener.location.reload();window.close();");
	}
%>