
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理NgnMsg"; %>
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
DataList<NgnMsg> dl = dao.pagelist(NgnMsg.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">ID</th>
    <th width="50px">发送者ID</th>
    <th width="50px">接收者ID</th>
    <th width="50px">消息内容</th>
    <th width="50px">发送日期</th>
    <th width="50px">状态</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(NgnMsg ngnMsg : dl){
		long id = ngnMsg.getId();
		long userid = ngnMsg.getUserid();
		long touserid = ngnMsg.getTouserid();
		String msg = ngnMsg.getMsg();
		java.util.Date senddate = ngnMsg.getSenddate();
		int status = ngnMsg.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=userid%></td>
      <td><%=touserid%></td>
      <td><%=msg%></td>
      <td><%=senddate==null?"-":sdfDetail.format(senddate)%></td>
      <td><%=status%></td>
      
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
