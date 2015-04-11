<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<%
int CURRENT_PAGE = box.getIntParam("pageNo",1);
String whereSql=" where status>-1 ";
String username=box.getParam("username");
String man=box.getParam("man");
String tel=box.getParam("tel");
String orgname=box.getParam("orgname");
StringBuilder sb=new StringBuilder();
if(!"".equals(username)){
	sb.append(" and username like '%"+username+"%'");
}
if(!"".equals(man)){
	sb.append(" and alias_name like '%"+man+"%'");
}
if(!"".equals(tel)){
	sb.append(" and telephone like '%"+tel+"%'");
}
whereSql+=sb.toString();
DataList<MscUser> dlList=dao.pagelist(MscUser.class,whereSql,CURRENT_PAGE,RESULT_NUM);
int PAGE_COUNT=dlList.pagecount();
int ALL_SIZE=dlList.allsize();
%>
<form action="index.jsp" id="pageForm" method="post">
	<table width="850" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right">用户名：<input type="text" value="<%=box.getParam("username")%>" size="6" name="username" /></td>
			<td align="right">别名：<input name="man" type="text" value="<%=man%>" size="10" /></td>
			<td align="right">电话：<input name="tel" value="<%=tel%>" size="15" /></td>
			<td align="right">使用单位：<input name="orgname" type="text" value="<%=orgname%>" size="15" /></td>
			<td align="right">&nbsp;&nbsp;<input type="image" src="/images/button_cx.gif" /></td>
			<td align="right">&nbsp;&nbsp;<span onclick="openWin('createUser.jsp','550','430');"><img src="/images/button_tjyh.gif" style="cursor: pointer;" /></span></td>
		</tr>
	</table>
	<input type="hidden" id="pageNo" name="pageNo" value="<%=CURRENT_PAGE%>" />
	<%@include file="/include/pageJsLabel.jsp"%>
<table width="100%" cellspacing="0px" cellpadding="0" border="0" align="center" class="msc-table">
	<tr bgcolor="#f2f2f2" align="center">
		<th align="center">ID</th>
		<th align="center">用户名</th>
		<th align="center">别名</th>
		<th align="center">联系信息</th>
		<th align="center">权限操作管理</th>
		<th colspan="4" align="center">用户操作</th>
		<th align="center">当前状态</th>
	</tr>
	<%
		if(dlList==null || dlList.allsize()==0){
	%>
	<tr>
		<td colspan="11" align="center"><b>没有查询到该用户!</b></td>
	</tr>
	<%
		}else{
		while(dlList.hasNext()){
		MscUser mu=(MscUser)dlList.next();
	%>
	<tr align="center">
		<td align="center"><%=mu.getId()%></td>
		<td align="center"><%=mu.getUsername() %></td>
		<td align="center"><%=mu.getAliasName() %></td>
		<td align="center"><%=mu.getMobile() %>/<%=mu.getTelephone()%></td>
		<td align="center">
			<%
				if(mu.getId()>0){
			%> <span onclick="javascript:openWin('selectMenuPerm.jsp?id=<%=mu.getId()%>','350','580');"><a style="cursor: pointer;">菜单权限操作</a></span><%
		 	}else{
		 %> <a style="cursor: pointer;">------</a> <%
		 	}
		 %>
		</td>
		<%
			if(mu.getStatus()==1){
		%>
		<%
			if(mu.getId()==0){
		%>
		<td align="center"><a href="javascript:alert('管理员用户无法删除!')">删除</a></td>
		<td align="center"><a href="javascript:alert('该账户无法冻结!');">冻结</a></td>
		<%
			}else{
		%>
		<td align="center"><a href="javascript:confirmIt('doDelUser.jsp?id=<%=mu.getId()%>',  '确认删除 <%=mu.getUsername()%>么?' )" >删除</a></td>
		<td align="center"><a href="javascript:confirmIt('doFreezeUser.jsp?id=<%=mu.getId()%>', '确认冻结该帐户么？')" >冻结</a></td>
		<%
			}
		%>
		<%
			}else if(mu.getStatus()==0) {
		%>
		<td align="center"><a href="javascript:confirmIt('doDelUser.jsp?id=<%=mu.getId()%>' ,  ' 确认删除 <%=mu.getUsername()%>么？' )" >删除</a></td>
		<td align="center"><a href="javascript:confirmIt('doUnFreezeUser.jsp?id=<%=mu.getId()%>' ,  ' 确认要解冻该帐户么？' )" >解冻</a></td>
		<%
			}else{
		%>
		<td></td>
		<td></td>
		<%
			}
		%>
		<td align="center"><span onclick="javascript:openWin('editUser.jsp?id=<%=mu.getId()%>','530','430');"><a style="cursor: pointer;">修改</a></span></td>
		<td align="center"><a href="javascript:confirmIt('doResetPasswd.jsp?id=<%=mu.getId()%>','确认把 <%=mu.getUsername()%> 的密码重置么?')">密码重置</a></td>
		<td align="center">
			<%
				if (MscSingleLogonService.checkSingleLogon(mu.getId())!=null){
						out.print("<font color='red'>WEB在线</font> / ");
					}else{
						out.print("WEB离线 / ");
					}
					if(mu.getStatus()==1){out.print("正常");}else if(mu.getStatus()==0){out.print("<font color='red'>冻结中</font>");}
			%>
		</td>
	</tr>
	<%
		}
	%>
	<%
		}
	%>
</table>
<%@include file="/include/pageJsLabel.jsp"%>
</form>
<script type="text/javascript">
</script>
<%@include file="/include/footer.jsp"%>
