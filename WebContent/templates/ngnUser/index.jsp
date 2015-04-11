
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="管理NgnUser"; %>
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
DataList<NgnUser> dl = dao.pagelist(NgnUser.class, wheresql.toString(), CURRENT_PAGE, RESULT_NUM);
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
    <th width="50px">用户类型，0VIP用户，1普通用户</th>
    <th width="50px">用户名</th>
    <th width="50px">密码</th>
    <th width="50px">手机号码</th>
    <th width="50px">Email地址</th>
    <th width="50px">昵称</th>
    <th width="50px">生日</th>
    <th width="50px">年龄</th>
    <th width="50px">性别(0女1男)</th>
    <th width="50px">备注</th>
    <th width="50px">学校</th>
    <th width="50px">公司</th>
    <th width="50px">职业</th>
    <th width="50px">行业</th>
    <th width="50px">用户积分</th>
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
	for(NgnUser ngnUser : dl){
		long id = ngnUser.getId();
		int userType = ngnUser.getUserType();
		String username = ngnUser.getUsername();
		String passwd = ngnUser.getPasswd();
		String mobile = ngnUser.getMobile();
		String email = ngnUser.getEmail();
		String aliasName = ngnUser.getAliasName();
		java.util.Date birthday = ngnUser.getBirthday();
		int age = ngnUser.getAge();
		int gender = ngnUser.getGender();
		String remark = ngnUser.getRemark();
		String school = ngnUser.getSchool();
		String company = ngnUser.getCompany();
		String occupation = ngnUser.getOccupation();
		String industry = ngnUser.getIndustry();
		int userPoint = ngnUser.getUserPoint();
		java.util.Date lastLogonDate = ngnUser.getLastLogonDate();
		java.util.Date createDate = ngnUser.getCreateDate();
		java.util.Date modifyDate = ngnUser.getModifyDate();
		int status = ngnUser.getStatus();
		
%>
	<tr style="text-align: center;">
      <td><%=id%></td>
      <td><%=userType%></td>
      <td><%=username%></td>
      <td><%=passwd%></td>
      <td><%=mobile%></td>
      <td><%=email%></td>
      <td><%=aliasName%></td>
      <td><%=birthday==null?"-":sdfDetail.format(birthday)%></td>
      <td><%=age%></td>
      <td><%=gender%></td>
      <td><%=remark%></td>
      <td><%=school%></td>
      <td><%=company%></td>
      <td><%=occupation%></td>
      <td><%=industry%></td>
      <td><%=userPoint%></td>
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
