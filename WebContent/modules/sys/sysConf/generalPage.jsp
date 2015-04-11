<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="uw.dm.*,uw.util.web.*,uw.dm.*,org.guihuotv.search.web.pojo.*" %>
<%
String sql="where status>-1 order by display_order";
DataList<SysConfig> dl = dao.list(SysConfig.class,sql);
%>
<font color="red"><b>未经开发商指导，请勿随意修改！！！</b></font>
<table class="msc-table" width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
	<tbody>
	<% for(SysConfig sc:dl ){ %>
		<%
			if(sc.getDisplayOrder().endsWith("000")){
		%>
		<tr>
			<th style="padding-left: 10px;text-align: left;" colspan="2" ><b><%=sc.getPropComment()%>(<%=sc.getCatName() %>)&nbsp;：</b></th>
		</tr>
		<%}else{ %>
		<tr>
		<form>
			<td width="200px" style="text-align: right;"><%=sc.getPropComment()%>(<%=sc.getPropName() %>)</td>
			<td><input type="text" id="pValue" name="pValue" value="<%=sc.getPropValue()%>" disabled="disabled"/>
			<a href="doGeneralUpdate.jsp?id=<%=sc.getId() %>"  id="xg"  class="xg" >修改</a>
			<%=sc.getInputComment() %>
			</td>
		</form>
		</tr>
		<%} %>
		<%} %>
	</tbody>
</table>
<br />
<br />
<br />
<script type="text/javascript">
<!--
	$(function(){
		$(".xg").click(function(){
			var url=$(this).attr("href");
			var value=$(this).prev("input").val();
			url=url+"&pValue="+value;
			if($(this).text()=="保存"){
				$(this).attr("href",url);
				return true;
			}
			$(this).prev("input").removeAttr("disabled");
			$(this).text("保存");
			return false;
		});
	});
//-->
</script>