<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="msc-table">
	<thead>
		<th>用户名</th>
		<th>登录IP</th>
		<th>登录时间</th>
		<th>最后操作</th>
		<th>最后操作时间</th>
		<th>操作</th>
	</thead>
	<tbody>
		<%
			Map<Long, MscSingleLogonInfo> map1 = MscSingleLogonService.getLogonMap();
			for (Map.Entry<Long, MscSingleLogonInfo> e : map1.entrySet()) {
				MscSingleLogonInfo msli = e.getValue();
		%>
		<tr style="text-align: center;">
			<td><%=msli.getUsername()%></td>
			<td><%=msli.getIp()%></td>
			<td><%=sdfDetail.format(msli.getLogonDate())%></td>
			<td><%=msli.getLastAction()%></td>
			<td><%=sdfDetail.format(msli.getLastUpdate())%></td>
			<td>
				<%
					if (!MSC_USER.getUsername().equals(msli.getUsername())) {
				%> <a href="doAdminForceLogout.jsp?id=<%=msli.getId()%>" onclick="return confirm('强制下线用户，对方将收到提示信息，请确认操作！');">强制下线</a> <%
 	} else {
 %> <a style="cursor: pointer; color: red">本机用户</a> <%
 	}
 %>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%@include file="/include/footer.jsp"%>
