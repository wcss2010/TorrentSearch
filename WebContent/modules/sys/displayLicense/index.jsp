<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
PAGE_TITLE = "系统授权信息";
String actionUrl = request.getRequestURI();
String pageTitle=MscUtils.getPermCNName(actionUrl);
if(!"".equals(pageTitle)){
	PAGE_TITLE=pageTitle;
}
%>
<%@include file="/include/header.jsp"%>
<%
	Map<String, Object> map = LicenseConfigUtils.getLicenseInfo();
%>
<table class="msc-table" width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
	<tbody>
		<%
			for (Entry<String, Object> entry : map.entrySet()) {
				if (entry.getValue() instanceof String) {
					String lname = entry.getKey();
					String lvalue = (String) entry.getValue();
					//需要对授权码做整形输出。
					if (!lname.equals("授权码")) {
		%>
		<tr>
			<th style="padding-left: 10px; text-align: left" colspan="2"><b><%=lname%>&nbsp;：</b>&nbsp;<%=lvalue%></th>
		</tr>
		<%
			}
				} else {
		%>
		<tr>
			<th style="padding-left: 10px; text-align: left" colspan="2"><b><%=entry.getKey()%>&nbsp;：</b></th>
		</tr>
		<%
			for (Entry<String, String> subEntry : ((Map<String, String>) entry.getValue()).entrySet()) {
						String sname = subEntry.getKey();
						String svalue = subEntry.getValue();
						if (svalue.equals("Y"))
							svalue = "支持";
						else if (svalue.equals("N"))
							svalue = "不支持";
		%>
		<tr>
			<td width="200px" style="text-align: right;"><%=sname%>：</td>
			<td><%=svalue%></td>
		</tr>
		<%
			}
				}
		%>
		<%
			}
		%>
	</tbody>
</table>
<%@include file="/include/footer.jsp"%>