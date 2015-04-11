<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="uw.util.*,uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>
<%@ page import="org.guihuotv.search.web.pojo.*,org.guihuotv.search.web.msc.*"%>
<%
request.setCharacterEncoding("UTF-8");

PageBox box=new PageBox(request,response,out);
SimpleDateFormat sdfDetail = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

MscUser MSC_USER=(MscUser)box.getObjectSession("userInfo");
MscSingleLogonInfo msli=null;
if(MSC_USER!=null)
	msli = MscSingleLogonService.checkSingleLogon(MSC_USER.getId());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统双登告警！</title>
</head>
<body>
	<div style="height: 500px; margin-top: 35px;">
		<div id="dis" align="center" style="color: red; font-size: 28px; font-style: bold; font-family: '宋体';">
			已有同名账户登录，点击“强制登录”按钮，系统会自动将其踢出。<br/>
			同名账户登录IP：<%=msli==null?"":msli.getIp() %>，登录时间：<%=sdfDetail.format(msli.getLogonDate()) %>。<br/>
			如果您认为有非法侵入，请重新登陆后检查系统鉴权日志。<br/>
			<form action="doForceLogon.jsp">
			<input type="submit" value="强制登录！" />
			</form>			
		</div>
	</div>
</body>
</html>