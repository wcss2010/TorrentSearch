
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理MscUser"; %>
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
DataList<MscUser> dl = dao.pagelist(MscUser.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">登录的用户名</th>
    <th width="50px">登录的密码</th>
    <th width="50px">对应菜单权限</th>
    <th width="50px">可管理单位的权限</th>
    <th width="50px">单位名称</th>
    <th width="50px">联系人</th>
    <th width="50px">电话</th>
    <th width="50px">手机</th>
    <th width="50px">Email</th>
    <th width="50px">最后登录时间</th>
    <th width="50px">最后登录IP</th>
    <th width="50px">建立时间</th>
    <th width="50px">最后修改时间</th>
    <th width="50px">状态</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(MscUser mscUser : dl){
		long id = mscUser.getId();
		String username = mscUser.getUsername();
		String passwd = mscUser.getPasswd();
		String mscPerm = mscUser.getMscPerm();
		String orgPerm = mscUser.getOrgPerm();
		String orgName = mscUser.getOrgName();
		String aliasName = mscUser.getAliasName();
		String telephone = mscUser.getTelephone();
		String mobile = mscUser.getMobile();
		String email = mscUser.getEmail();
		java.util.Date lastLogonDate = mscUser.getLastLogonDate();
		String lastLogonIp = mscUser.getLastLogonIp();
		java.util.Date createDate = mscUser.getCreateDate();
		java.util.Date modifyDate = mscUser.getModifyDate();
		int status = mscUser.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=username%></td>
      <td><%=passwd%></td>
      <td><%=mscPerm%></td>
      <td><%=orgPerm%></td>
      <td><%=orgName%></td>
      <td><%=aliasName%></td>
      <td><%=telephone%></td>
      <td><%=mobile%></td>
      <td><%=email%></td>
      <td><%=lastLogonDate==null?"-":sdfDetail.format(lastLogonDate)%></td>
      <td><%=lastLogonIp%></td>
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
