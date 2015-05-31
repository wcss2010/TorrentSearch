
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE="定时任务";
%>
<%@include file="/include/header.jsp"%>
<%
	//当前页面
int CURRENT_PAGE = 1;
int pageNum = box.getIntParam("pageNo");
if (pageNum != 0) {
	CURRENT_PAGE = pageNum;
}
StringBuilder wheresql = new StringBuilder("where status>-1");
wheresql.append(" order by id desc");
DataList<NgnTimer> dl = dao.pagelist(NgnTimer.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
int PAGE_COUNT = dl.pagecount();
int ALL_SIZE = dl.allsize();
%>
<script type="text/javascript">
	
</script>
<form action="index.jsp" id="pageForm" method="post">
	<table width="620" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<a href="javascript:openWin('create.jsp',620,600);"><img
				src="/images/button_tj.gif" style="cursor: pointer;" /></a>
			</td>
		</tr>
	</table>
	<input type="hidden" id="pageNo" name="pageNo" value="<%=pageNum%>" />
	<%@include file="/include/pageJsLabel.jsp"%>
	<table width="100%" cellspacing="0" cellpadding="0" border="0"
		align="center" class="msc-table">
		<thead>
			<tr>
				<th width="50px">任务名称</th>
				<th width="50px">任务类型</th>
				<th width="50px">执行时间</th>
				<th width="50px">任务URL</th>
				<th width="50px">参数1</th>
				<th width="50px">参数2</th>
				<th width="50px">参数3</th>
				<th width="50px">创建时间</th>

				<th width="50px">操作</th>
			</tr>
		</thead>
		<tbody>

			<%
				if(ALL_SIZE>0){
				for(NgnTimer ngnTimer : dl){
					long id = ngnTimer.getId();
					String name = ngnTimer.getName();
					int timertype = ngnTimer.getTimertype();
					java.util.Date timer = ngnTimer.getTimer();
					String timerurl = ngnTimer.getTimerurl();
					String p1 = ngnTimer.getP1();
					String p2 = ngnTimer.getP2();
					String p3 = ngnTimer.getP3();
					java.util.Date createtime = ngnTimer.getCreatetime();
					int status = ngnTimer.getStatus();
			%>
			<tr style="text-align: center;">
				<td><%=name%></td>
				<td><%=timertype==1?"每天执行":"只执行一次"%></td>
				<td><%=timer==null?"-":sdfDetail.format(timer)%></td>
				<td><%=timerurl%></td>
				<td><%=p1%></td>
				<td><%=p2%></td>
				<td><%=p3%></td>
				<td><%=createtime==null?"-":sdfDetail.format(createtime)%></td>

				<td><a
					href="javascript:confirmIt('doDelete.jsp?id=<%=id%>','确认删除这条信息么？');">删除</a>
				</td>
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
