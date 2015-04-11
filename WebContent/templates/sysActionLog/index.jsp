
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理SysActionLog"; %>
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
DataList<SysActionLog> dl = dao.pagelist(SysActionLog.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
int PAGE_COUNT = dl.pagecount();
int ALL_SIZE = dl.allsize();

%>
<script type="text/javascript">
</script>
<form action="index.jsp" id="pageForm" method="post">
	 <table  width="620" cellspacing="0" cellpadding="0" border="0" >
		<tr>
			<td>名称：<input type="text" id="orgName" name="orgName" value="" style="color:gray;" size="20"/></td>
			<td align="left">
			<input id="butSubmit" type="image" src="/images/button_cx.gif" />&nbsp;&nbsp;
			<a href="javascript:openWin('create.jsp',620,600);"><img src="/images/button_tj.gif" style="cursor: pointer;" /></a></td>
		</tr>
	</table>
<input type="hidden" id="pageNo" name="pageNo" value="<%=pageNum%>" /> 
<%@include file="/include/pageJsLabel.jsp"%>
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="msc-table">
	<thead>
		<tr>
    <th width="50px"></th>
    <th width="50px">操作的用户</th>
    <th width="50px">操作类型。1.访问日志 2.操作日志</th>
    <th width="50px">操作的模块</th>
    <th width="50px">操作的指令</th>
    <th width="50px">操作的内容</th>
    <th width="50px">操作的IP</th>
    <th width="50px">操作的日期</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(SysActionLog sysActionLog : dl){
		long id = sysActionLog.getId();
		long userId = sysActionLog.getUserId();
		int actionType = sysActionLog.getActionType();
		String actionModule = sysActionLog.getActionModule();
		String actionCommand = sysActionLog.getActionCommand();
		String actionBody = sysActionLog.getActionBody();
		String actionIp = sysActionLog.getActionIp();
		java.util.Date actionDate = sysActionLog.getActionDate();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=userId%></td>
      <td><%=actionType%></td>
      <td><%=actionModule%></td>
      <td><%=actionCommand%></td>
      <td><%=actionBody%></td>
      <td><%=actionIp%></td>
      <td><%=actionDate==null?"-":sdfDetail.format(actionDate)%></td>
      
  	<td><a href="javascript:openWin('modify.jsp?id=<%=id%>',620,600);" >修改</a>&nbsp;&nbsp;&nbsp;<a href="javascript:confirmIt('doDelete.jsp?id=<%=id%>','确认删除这条信息么？');">删除</a>
  	</td>
  	</tr>
    <%
    	}}else{
    %>
     <tr align="center"><td colspan="20"><b>没有查询到数据!</b></td></tr>
    <%} %>
	</tbody>
</table>
<%@include file="/include/pageJsLabel.jsp"%>
</form>	
<script type="text/javascript">
<!--
	$(document).ready(function() {
		$('a.colorbox').colorbox({innerHeight:"430px",innerWidth:"600px"});
	});
//-->
</script>
<%@include file="/include/footer.jsp"%>
