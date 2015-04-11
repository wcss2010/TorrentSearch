<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="uw.util.*,uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>
<%@page import="org.guihuotv.search.web.pojo.*,org.guihuotv.search.web.msc.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	PageBox box = new PageBox(request, response, out);
	SimpleDateFormat sdfDetail = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	MscUser MSC_USER = (MscUser) box.getObjectSession("userInfo");
	MscSingleLogonInfo msli = null;
	if (MSC_USER != null) {
		msli = MscSingleLogonService.checkSingleLogon(MSC_USER.getId());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统双登告警！</title>
</head>
<body>
	<div style="height: 500px; margin-top: 35px;">
		<div id="dis" align="center" style="color: #FFCC66; font-size: 36px; font-style: normal; font-family: '宋体';">
			<%
				if (msli == null) {
			%>
			您被系统管理员强制踢出！<br /> 具体相关事宜，请联络系统管理员！<br /> <label id="loadDynamic"></label>秒后系统将自动跳转到登录页面。
			<%
 	} else {
 %>
			您被同名账户强制登录，系统已将您自动踢出。<br /> 同名账户登录IP：<%=msli.getIp()%>，登录时间：<%=sdfDetail.format(msli.getLogonDate())%><br /> 如果您认为有非法侵入，请重新登陆后检查系统鉴权日志。<br /> <label id="loadDynamic"></label>秒后系统将自动跳转到登录页面。
			<%
 	}
 %>
		</div>
	</div>
</body>
<script type="text/javascript">
	var secs = 10;
	for ( var i = 0; i < secs; i++) {
		window.setTimeout("update(" + i + ")", i * 1000);
	}
	setTimeout("togoto()", secs * 1000);
	//alert("gaga");
	function togoto() {
		//此处换成连接
		window.top.location.href = "/adminLogin.jsp";
		// alert("gaga");
	}
	function update(num) {
		var printnr = secs - num;
		document.getElementById("loadDynamic").innerHTML = "<font style='font-size:24px; color:#CC3300; font-weight:bold;'> "
				+ printnr + "&nbsp;</font>";
	}
</script>
</html>