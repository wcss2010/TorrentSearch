<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="uw.*" %>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp" %>
<%@include file="checkLicense.jsp"%>
<div style="padding:10px 30px 50px 30px;border-collapse:collapse;border:solid #eaf1f8 medium;">
<table>
<tr><td><input type="button" value="添加一级权限" onclick="javascript:location.href='createPerm.jsp?height=300&width=450'" class="thickbox"/></td></tr>
<%
String selectSql = " where perm_type=0 order by menu_path";//列出所有的权限
DataList<MscPerm> list= dao.list(MscPerm.class,selectSql);
for (MscPerm mp:list){
	String allString="|--------------------------------------------------------------------------------";
	allString=allString.substring(0,mp.getMenuLayer()*6);
%>
<tr><td style="padding-top:10px;">
<%=allString%><%=mp.getPermName() %>
<a href="edit.jsp?height=300&width=450&permId=<%=mp.getId() %>"><img  alt="修改" title="修改" src="/images/edit.gif"/></a>
<a href="doDelete.jsp?height=300&width=450&permId=<%=mp.getId() %>" onClick="return delConfirm();"><img title="删除" alt="删除" src="/images/delete.gif"></img></a>
<%
if(mp.getParentId()==0){
%>
<a href="createPerm.jsp?height=300&width=450&parentId=<%=mp.getId() %>" class="thickbox"><img src="/images/add.gif" title="添加下一级" alt="添加下级"></img></a>
<%
}
%>
</td></tr>
<%
	//out.println(mp.getPermName());
out.print("");
}
%>
</table>
</div>
<script type="text/javascript">
<!--
function delConfirm(){
	if(confirm("要永久删除该权限吗？")){
		return true;
	}else{
		return false;
			}
}
//-->
</script>
<%@include file="/include/footer.jsp"%>