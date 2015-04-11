<%@page import="org.guihuotv.search.web.util.PasswordUtils"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	String opMsg = "操作成功！";
	//开始do
	NgnUser ngnUser = new NgnUser();
	String username = box.getParam("username");
	String passwd = box.getParam("passwd");
	String mobile = box.getParam("mobile");
	String email = box.getParam("email");
	String aliasName = box.getParam("aliasName");
	int userType = box.getIntParam("userType");
	int userPoint = box.getIntParam("userPoint");

	try {
		ngnUser.setId(dao.getSequenceId(NgnUser.class));

		ngnUser.setUsername(username);
		if (passwd != null && !passwd.isEmpty()) {
			passwd = PasswordUtils.encode2Password(passwd);
			ngnUser.setPasswd(passwd);
		}
		ngnUser.setMobile(mobile);
		ngnUser.setEmail(email);
		ngnUser.setAliasName(aliasName);
		ngnUser.setUserType(userType);
		ngnUser.setUserPoint(userPoint);
		ngnUser.setCreateDate(new Date());
		ngnUser.setStatus(1);

		dao.save(ngnUser);

		DictUtils.refreshUserMap();
	} catch (TransactionException e) {
		JSPLogger.error(e.getMessage(), e);
		opMsg = "操作失败！错误信息为：" + e.getMessage();
	}
	box.outJSAlert(opMsg, "window.opener.location.reload();window.close();");
	MscActionLogger.log(dao, request, "添加NgnUser", "操作人：" + MSC_USER.getUsername() + ",新建了NgnUser数据，内容为：\r\n" + ngnUser.toString() + "\r\n" + opMsg);
%>