
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理NgnOrg"; %>
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
DataList<NgnOrg> dl = dao.pagelist(NgnOrg.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">机构名称</th>
    <th width="50px">机构描述</th>
    <th width="50px">联系人</th>
    <th width="50px">联系电话</th>
    <th width="50px">联系手机</th>
    <th width="50px">联系地址</th>
    <th width="50px">邮政编码</th>
    <th width="50px">Email</th>
    <th width="50px">授权节点数</th>
    <th width="50px">授权管理员数量</th>
    <th width="50px">授权用户数量</th>
    <th width="50px">授权过期时间</th>
    <th width="50px">创建日期</th>
    <th width="50px">修改日期</th>
    <th width="50px">状态</th>
    
		<th width="50px">操作</th>
		</tr>
	</thead>
	<tbody>
	
<%
if(ALL_SIZE>0){
	for(NgnOrg ngnOrg : dl){
		long id = ngnOrg.getId();
		String orgName = ngnOrg.getOrgName();
		String orgDesc = ngnOrg.getOrgDesc();
		String linkMan = ngnOrg.getLinkMan();
		String telephone = ngnOrg.getTelephone();
		String mobile = ngnOrg.getMobile();
		String address = ngnOrg.getAddress();
		String zipcode = ngnOrg.getZipcode();
		String email = ngnOrg.getEmail();
		int licenseNodeNum = ngnOrg.getLicenseNodeNum();
		int licenseAdminNum = ngnOrg.getLicenseAdminNum();
		int licenseUserNum = ngnOrg.getLicenseUserNum();
		java.util.Date licenseExpiredDate = ngnOrg.getLicenseExpiredDate();
		java.util.Date createDate = ngnOrg.getCreateDate();
		java.util.Date modifyDate = ngnOrg.getModifyDate();
		int status = ngnOrg.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=orgName%></td>
      <td><%=orgDesc%></td>
      <td><%=linkMan%></td>
      <td><%=telephone%></td>
      <td><%=mobile%></td>
      <td><%=address%></td>
      <td><%=zipcode%></td>
      <td><%=email%></td>
      <td><%=licenseNodeNum%></td>
      <td><%=licenseAdminNum%></td>
      <td><%=licenseUserNum%></td>
      <td><%=licenseExpiredDate==null?"-":sdfDetail.format(licenseExpiredDate)%></td>
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
