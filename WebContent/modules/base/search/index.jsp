
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE="管理聚合搜索";
%>
<%@include file="/include/header.jsp"%>
<%
	//当前页面
int CURRENT_PAGE = 1;
int pageNum = box.getIntParam("pageNo");
String searNames = box.getParam("searNames");
if (pageNum != 0) {
	CURRENT_PAGE = pageNum;
}
StringBuilder wheresql = new StringBuilder("where status>-1");

if (searNames != null && !searNames.isEmpty())
{
	wheresql.append(" and sname like '%" + searNames + "%'");
}

wheresql.append(" order by id desc");
DataList<NgnSearch> dl = dao.pagelist(NgnSearch.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
int PAGE_COUNT = dl.pagecount();
int ALL_SIZE = dl.allsize();
%>
<script type="text/javascript">
	
</script>
<form action="index.jsp" id="pageForm" method="post">
	<table width="620" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td>名称：<input type="text" id="searNames" name="searNames" value="<%=searNames%>" style="color: gray;" size="20" /></td>
			<td align="left"><input id="butSubmit" type="image" src="/images/button_cx.gif" />&nbsp;&nbsp; <a href="javascript:openWin('create.jsp',620,600);"><img src="/images/button_tj.gif" style="cursor: pointer;" /></a></td>
		</tr>
	</table>
	<input type="hidden" id="pageNo" name="pageNo" value="<%=pageNum%>" />
	<%@include file="/include/pageJsLabel.jsp"%>
	<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="msc-table">
		<thead>
			<tr>
				<th width="50px">ID</th>
				<th width="50px">分享者ID</th>
				<th width="50px">名称</th>
				<th width="50px">搜索引擎地址</th>
				<th width="50px">状态</th>

				<th width="50px">操作</th>
			</tr>
		</thead>
		<tbody>

			<%
				if(ALL_SIZE>0){
									for(NgnSearch ngnSearch : dl){
										long id = ngnSearch.getId();
										long userId = ngnSearch.getUserId();
										String name = ngnSearch.getSname();
										String searchurl = ngnSearch.getSearchurl();
										int status = ngnSearch.getStatus();
			%>
			<tr style="text-align: center;">
				<td><%=id%></td>
				<td><%=userId == 10000?"管理员":DictUtils.getUserName(userId)%></td>
				<td><%=name%></td>
				<td><%=searchurl%></td>
				<td><%=status == 1?"启用":"停用"%></td>

				<td><a href="javascript:openWin('modify.jsp?id=<%=id%>',620,600);">修改</a>&nbsp;&nbsp;&nbsp;<a href="javascript:confirmIt('doDelete.jsp?id=<%=id%>','确认删除这条信息么？');">删除</a></td>
			</tr>
			<%
				}}else{
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
<script type="text/javascript">
<!--
	$(document).ready(function() {
		$('a.colorbox').colorbox({
			innerHeight : "430px",
			innerWidth : "600px"
		});
	});
//-->
</script>
<%@include file="/include/footer.jsp"%>
