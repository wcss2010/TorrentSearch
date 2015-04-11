
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理NgnNode"; %>
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
DataList<NgnNode> dl = dao.pagelist(NgnNode.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">节点名称</th>
    <th width="50px">节点密码</th>
    <th width="50px">节点类型，0公共节点，1私有节点</th>
    <th width="50px">别名</th>
    <th width="50px">归属机构</th>
    <th width="50px">上次登录时间</th>
    <th width="50px">创建时间</th>
    <th width="50px">修改时间</th>
    <th width="50px">状态</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(NgnNode ngnNode : dl){
		long id = ngnNode.getId();
		String nodeName = ngnNode.getNodeName();
		String nodePass = ngnNode.getNodePass();
		int nodeType = ngnNode.getNodeType();
		String aliasName = ngnNode.getAliasName();
		long orgId = ngnNode.getOrgId();
		java.util.Date lastLogonDate = ngnNode.getLastLogonDate();
		java.util.Date createDate = ngnNode.getCreateDate();
		java.util.Date modifyDate = ngnNode.getModifyDate();
		int status = ngnNode.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=nodeName%></td>
      <td><%=nodePass%></td>
      <td><%=nodeType%></td>
      <td><%=aliasName%></td>
      <td><%=orgId%></td>
      <td><%=lastLogonDate==null?"-":sdfDetail.format(lastLogonDate)%></td>
      <td><%=createDate==null?"-":sdfDetail.format(createDate)%></td>
      <td><%=modifyDate==null?"-":sdfDetail.format(modifyDate)%></td>
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
