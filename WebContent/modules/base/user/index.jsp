<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%
	int userTypes = box.getIntParam("userType",1);

    long userIds = box.getLongParam("userIds",0);
    String userNames = box.getParam("userNames");
    String aliasNames = box.getParam("aliasNames");
    if (userNames == null || (userNames != null && userNames.isEmpty()))
    {
    	userNames = DictUtils.getUserName(userIds);
    	
    	if (userNames == null || userNames.isEmpty())
    	{
    		userIds = 0;
    	}
    }
%>
<%
	//当前页面
int CURRENT_PAGE = 1;
int pageNum = box.getIntParam("pageNo");
if (pageNum != 0) {
	CURRENT_PAGE = pageNum;
}
StringBuilder wheresql = new StringBuilder("where status>-1");

if (userIds > 0)
{
	wheresql.append(" and id = " + userIds);
}

if (aliasNames != null && !aliasNames.isEmpty())
{
	wheresql.append(" and alias_name like '%" + aliasNames + "%'");
}

wheresql.append(" and user_type=" +userTypes);
wheresql.append(" order by id desc");
DataList<NgnUser> dl = dao.pagelist(NgnUser.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
int PAGE_COUNT = dl.pagecount();
int ALL_SIZE = dl.allsize();
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#userNames").autocomplete({
			source : "ajaxAutoCompleteGetUser.jsp",
			minLength : 1,
			select : function(event, ui) {
				$("#userNames").val(ui.item.value);
				$("#userIds").val(ui.item.id);//选项赋值
			}
		});
	});
</script>
<form action="index.jsp" id="pageForm" method="post">
	<table width="800" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td width="160"><label><input id="userType" name="userType" type="radio" value="0" <%=(userTypes == 0) ? "checked" : ""%> onclick="javascript:$('#pageForm').submit();" />VIP用户 </label> <label><input id="userType" name="userType" type="radio" value="1" <%=(userTypes == 1) ? "checked" : ""%> onclick="javascript:$('#pageForm').submit();" />普通用户 </label></td>
			<td>用户名：<input type="text" id="userNames" name="userNames" value="<%=userNames%>" style="color: gray;" size="20" /><input type="hidden" id="userIds" name="userIds" value="<%=userIds%>" /></td>
			<td>昵称：<input type="text" id="aliasNames" name="aliasNames" value="<%=aliasNames%>" style="color: gray;" size="20" /></td>
			</td>
			<td align="left"><input id="butSubmit" type="image" src="/images/button_cx.gif" />&nbsp;&nbsp; <a href="javascript:openWin('create.jsp',620,600);"><img src="/images/button_tj.gif" style="cursor: pointer;" /></a></td>
		</tr>
	</table>
	<input type="hidden" id="pageNo" name="pageNo" value="<%=pageNum%>" />
	<%@include file="/include/pageJsLabel.jsp"%>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="msc-table">
		<thead>
			<tr>
				<th width="50px">ID</th>
				<th width="50px">用户名</th>
				<th width="50px">昵称</th>
				<th width="50px">用户类型</th>
				<th width="50px">用户积分</th>
				<th width="50px">手机号码</th>
				<th width="50px">Email地址</th>
				<th width="50px">上次登录时间</th>
				<th width="50px">创建时间</th>
				<th width="50px">修改时间</th>

				<th width="50px">操作</th>
			</tr>
		</thead>
		<tbody>

			<%
				if (ALL_SIZE > 0) {
					for (NgnUser ngnUser : dl) {
						long id = ngnUser.getId();
						String username = ngnUser.getUsername();
						String mobile = ngnUser.getMobile();
						String email = ngnUser.getEmail();
						String aliasName = ngnUser.getAliasName();
						int userPoint = ngnUser.getUserPoint();
						int userType = ngnUser.getUserType();
						java.util.Date lastLogonDate = ngnUser.getLastLogonDate();
						java.util.Date createDate = ngnUser.getCreateDate();
						java.util.Date modifyDate = ngnUser.getModifyDate();
			%>
			<tr style="text-align: center;">
				<td><%=id%></td>
				<td><%=username%></td>
				<td><%=aliasName%></td>
				<td><%=userType == 0 ? "VIP用户" : "普通用户"%></td>
				<td><%=userPoint%></td>
				<td><%=mobile%></td>
				<td><%=email%></td>
				<td><%=lastLogonDate == null ? "-" : sdfDetail.format(lastLogonDate)%></td>
				<td><%=createDate == null ? "-" : sdfDetail.format(createDate)%></td>
				<td><%=modifyDate == null ? "-" : sdfDetail.format(modifyDate)%></td>

				<td><a href="javascript:openWin('modify.jsp?id=<%=id%>',620,600);">修改</a>&nbsp;&nbsp;&nbsp; <a href="javascript:confirmIt('doDelete.jsp?id=<%=id%>','确认删除这条信息么？');">删除</a></td>
			</tr>
			<%
				}
				} else {
			%>
			<tr align="center">
				<td colspan="20"><b>没有查询到数据!</b></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%@include file="/include/pageJsLabel.jsp"%>
</form>
<%@include file="/include/footer.jsp"%>
