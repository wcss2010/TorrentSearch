<%@page import="org.guihuotv.search.web.util.PasswordUtils"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long apiNum = 1;// Long.parseLong(ProductVerify8.getNumUserFromPlatformInfo());
	long userCount = 0;//LicenseLimitChecker.getCurrentUserCount(); 

	if (userCount < apiNum) {
		String username = box.getParam("username");
		String passwd = box.getParam("passwd");
		String man = box.getParam("man");
		String tel = box.getParam("tel");
		String mobile = box.getParam("mobile");
		String email = box.getParam("email");
		String address = box.getParam("address");
		String orgname = box.getParam("orgname");
		String orgdept = box.getParam("orgdept");
		MscUser user = (MscUser) dao.listSingle(MscUser.class, "where username=? and status>0", new Object[] { username });
		if (user == null) {
			MscUser mu = new MscUser();
			mu.setUsername(username);
			mu.setPasswd(PasswordUtils.encode3Password(passwd));
			mu.setAliasName(man);
			mu.setTelephone(tel);
			mu.setMobile(mobile);
			mu.setEmail(email);
			mu.setCreateDate(new Date());
			mu.setModifyDate(new Date());
            mu.setOrgPerm(orgdept);
			mu.setOrgName(orgname);
			mu.setStatus(1);
			boolean sucOrNot = true;
			try {
				dao.save(mu);
			} catch (Exception e) {
				sucOrNot = false;
			}
			if (sucOrNot) {
				MscActionLogger.log(dao, request, "web", "操作人：" + MSC_USER.getUsername() + ",创建了" + username + "的用户");
				box.outJSAlert("添加成功！", "window.opener.location.reload();window.close();");
			} else {
				box.outJSAlert("添加失败！请重新添加！", "window.opener.location.reload();window.close();");
			}
		} else {
			box.outJSAlert("该用户已存在，请重新添加", "window.opener.location.reload();window.close();");
		}
	} else {
		box.outJSAlert("添加失败，用户数已达到最大授权数量，具体相关事宜，请联系开发商！", "window.opener.location.reload();window.close();");
	}
%>