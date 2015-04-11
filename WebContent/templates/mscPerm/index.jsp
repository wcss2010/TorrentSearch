
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理MscPerm"; %>
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
DataList<MscPerm> dl = dao.pagelist(MscPerm.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">菜单所属的上级ID</th>
    <th width="50px">0.是菜单项，1是api</th>
    <th width="50px">权限的名称</th>
    <th width="50px">权限的描述</th>
    <th width="50px">拥有子元素的个数</th>
    <th width="50px">权限执行的url目录</th>
    <th width="50px">单位目录层次深度</th>
    <th width="50px">单位层次路径</th>
    <th width="50px">创建时间</th>
    <th width="50px">最后一次的修改时间</th>
    <th width="50px">状态</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(MscPerm mscPerm : dl){
		long id = mscPerm.getId();
		long parentId = mscPerm.getParentId();
		int permType = mscPerm.getPermType();
		String permName = mscPerm.getPermName();
		String permDesc = mscPerm.getPermDesc();
		int childNum = mscPerm.getChildNum();
		String actionUrl = mscPerm.getActionUrl();
		int menuLayer = mscPerm.getMenuLayer();
		String menuPath = mscPerm.getMenuPath();
		java.util.Date createDate = mscPerm.getCreateDate();
		java.util.Date modifyDate = mscPerm.getModifyDate();
		int status = mscPerm.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=parentId%></td>
      <td><%=permType%></td>
      <td><%=permName%></td>
      <td><%=permDesc%></td>
      <td><%=childNum%></td>
      <td><%=actionUrl%></td>
      <td><%=menuLayer%></td>
      <td><%=menuPath%></td>
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
