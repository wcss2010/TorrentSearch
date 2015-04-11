<%@page import="org.guihuotv.search.web.util.PasswordUtils"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long userId=box.getLongParam("id");
	MscUser mu=dao.load(MscUser.class,userId);
	String passwd = box.getParam("passwd");
	String man=box.getParam("man");
	String tel = box.getParam("tel");
	String mobile= box.getParam("mobile");
	String email = box.getParam("email");
	String orgname = box.getParam("orgname");
	String orgdept = box.getParam("orgdept");

	if(passwd != null && !passwd.isEmpty()){
		mu.setPasswd(PasswordUtils.encode3Password(passwd));
	}
	mu.setTelephone(tel);
	mu.setMobile(mobile);
	mu.setAliasName(man);
	mu.setEmail(email);
	mu.setModifyDate(new Date());
    mu.setOrgPerm(orgdept);
	mu.setOrgName(orgname);
	boolean sucOrNot = true;
	try {
		dao.update(mu);
	} catch (Exception e) {
		sucOrNot = false;
	}
	if (sucOrNot) {
		MscActionLogger.log(dao,request,"web",mu.getUsername()+" 操作人："+MSC_USER.getUsername()+",修改了"+mu.getUsername()+"的信息");
		box.outJSAlert("修改成功！", "window.opener.location.reload();window.close();");
	} else {
		box.outJSAlert("修改失败！请重新修改！","window.opener.location.reload();window.close();");
	}

%>