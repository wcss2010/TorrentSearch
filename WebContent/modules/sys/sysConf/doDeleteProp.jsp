<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	int id = box.getIntParam("id");
	SysConfig sc = (SysConfig) dao.load(SysConfig.class, id);
	sc.setStatus(-1);
	boolean sucOrNot = true;
	try {
		dao.update(sc);

		SysConfigUtils.reload();
	} catch (Exception e) {
		sucOrNot = false;
		JSPLogger.error(e.getMessage(), e);
	}
	if (sucOrNot) {
		MscActionLogger.log(dao, request, "删除属性", "操作人：" + MSC_USER.getUsername() + ",删除了" + sc.getCatName() + "类别下的" + sc.getPropComment() + "属性");
		box.outJSAlert("删除成功！", "window.opener.location.reload();window.close();");
	} else {
		box.outJSAlert("删除失败,请重新操作！", "window.opener.location.reload();window.close();");
	}
%>