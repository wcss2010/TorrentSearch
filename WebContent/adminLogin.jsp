<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="uw.util.*,uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	PageBox box = new PageBox(request, response, out);
	String errorflag = box.getParam("errorflag");
	String appName = "";
	String appVersion = "";
	try {
		appName = AppInfoUtils.getAppName();
		appVersion = AppInfoUtils.getAppVersion();
	} catch (Exception e) {
		JSPLogger.error(e.getMessage(), e);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=appName + appVersion%></title>
<link href="/css/login.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.9.1.js" type="text/javascript"></script>
<script type="text/javascript">
	function reflash() {
		var img = document.getElementById("RandomImg");
		img.src = "/randImage.jsp?" + Math.random();
	}

	$(function() {
		$("#center_middle input").keyup(function(event) {
			if (event.keyCode == 13) {
				document.form1.submit();
			}
		});
	});
</script>
</head>
<body>
	<%
		int remainDay = (int) Math.floor((LicenseConfigUtils.getExpiredDate().getTime() - System.currentTimeMillis()) / 86400000);
		if (remainDay < 30 && remainDay >= 0) {
	%>
	<h2 style="color: red; text-align: center;">
		您的系统授权时间仅剩<%=remainDay%>天，请提前进行系统授权！
	</h2>
	<%
		} else if (remainDay < 0) {
	%>
	<h2 style="color: red; text-align: center;">
		您的系统授权已过期<%=-remainDay%>天，请立即进行系统授权！
	</h2>
	<%
		}
	%>
	<div id="login">
		<div id="top">
			<div id="top_left">
				<img src="/images/login_03.gif" />
			</div>
			<div id="top_center"></div>
		</div>
		<div id="center">
			<div id="center_left"></div>
			<div id="center_middle">
				<form action="doAdminLogin.jsp" method="post" name="form1" id="form1">
					<input type="hidden" name="operation" value="login"></input>
					<div id="user">
						用 户 <input type="text" name="username" />
					</div>
					<div id="password">
						密 码 <input type="password" name="passwd" />
					</div>

					<div id="check">
						验证码 <input name="randCode" type="text" style="width: 60px" /> <img id="RandomImg" name="RandomImg" src="/randImage.jsp?0.0" style="vertical-align: bottom;" />&nbsp;<a href="javascript:reflash();">刷新</a>
					</div>
					<div id="btn">
						<a href="javascript:document.form1.submit();" id="tj" name="tj">提交</a> <a href="javascript:document.form1.reset();">清空</a> <br />
					</div>
				</form>
			</div>
			<div id="center_right"></div>
		</div>
		<div id="down">
			<div id="down_left">
				<div id="inf">
					<span class="inf_text">版本信息</span> <span class="copyright"><%=appName + appVersion%></span>
				</div>
			</div>
			<div id="down_center">
				<%
					if ("up".equals(errorflag)) {
				%>
				<div style="margin-left: 80px; margin-top: 20px;">
					<span style="color: red;">*请检查用户名及密码</span>
				</div>
				<%
					} else if ("randCode".equals(errorflag)) {
				%>
				<div style="margin-left: 80px; margin-top: 20px;">
					<span style="color: red;">*验证码不正确</span>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
