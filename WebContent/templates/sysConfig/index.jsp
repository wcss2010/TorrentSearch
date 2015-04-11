
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理SysConfig"; %>
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
DataList<SysConfig> dl = dao.pagelist(SysConfig.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">分类名</th>
    <th width="50px">属性名</th>
    <th width="50px">属性数值</th>
    <th width="50px">属性备注</th>
    <th width="50px">输入说明</th>
    <th width="50px">显示排序</th>
    <th width="50px">建立时间</th>
    <th width="50px">最后修改时间</th>
    <th width="50px">状态。1为正常，-1为标记删除</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(SysConfig sysConfig : dl){
		long id = sysConfig.getId();
		String catName = sysConfig.getCatName();
		String propName = sysConfig.getPropName();
		String propValue = sysConfig.getPropValue();
		String propComment = sysConfig.getPropComment();
		String inputComment = sysConfig.getInputComment();
		String displayOrder = sysConfig.getDisplayOrder();
		java.util.Date createDate = sysConfig.getCreateDate();
		java.util.Date modifyDate = sysConfig.getModifyDate();
		int status = sysConfig.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=catName%></td>
      <td><%=propName%></td>
      <td><%=propValue%></td>
      <td><%=propComment%></td>
      <td><%=inputComment%></td>
      <td><%=displayOrder%></td>
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
