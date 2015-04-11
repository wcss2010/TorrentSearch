<%@page import="org.guihuotv.search.web.util.PasswordUtils"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	String newPwd = box.getParam("newPwd");
	String oldPwd=box.getParam("oldPwd");
	MscUser mu = dao.load(MscUser.class, MSC_USER.getId());
	if (mu != null && PasswordUtils.encode3Passwd(oldPwd).equalsIgnoreCase(mu.getPasswd())) {
		mu.setPasswd(PasswordUtils.encode3Passwd(newPwd));
		try{
		dao.update(mu);
		}catch(Exception e){
			JSPLogger.error(e.getMessage(),e);
		}
	}else{
		box.outJSAlert("原密码输入错误,请重新输入!","window.opener.location.reload();window.close();");
		return;
	}
	box.outJSAlert("修改成功！", "window.opener.location.reload();window.close();");
	MscActionLogger.log(dao, request, "修改密码", mu.getUsername() + "修改了密码,操作人为："+MSC_USER.getUsername());
%>