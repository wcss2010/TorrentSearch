<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="uw.dm.*,uw.util.web.*,uw.dm.*,org.guihuotv.search.web.pojo.*" %>
<%
String sql="where status>-1 order by display_order";
DataList<SysConfig> dl = dao.list(SysConfig.class,sql);
%>
<input type="button" value="添加一级分类"  onclick="window.location='createCategory.jsp'"/>
<font color="red"><b>未经开发商指导，请勿随意修改！！！</b></font>
<table class="msc-table" width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
	<tbody>
	<% for(SysConfig sc:dl ){ %>
		<%
			if(sc.getPropName()==""){ 
		%>
		<tr>
			<th style="padding-left: 10px; text-align: left" colspan="2" ><b><%=sc.getPropComment()%>(<%=sc.getCatName() %>)&nbsp;：</b><a href="createProp.jsp?pid=<%=sc.getId()%>">添加配置属性</a>
				<a href="doDeleteCat.jsp?catName=<%=sc.getCatName()%>"  onclick="return confirm('确认删除该分类及其所属的所有配置属性么？')">删除该分类</a>
			</th>
		</tr>
		<%}else{ %>
		<tr>
		<form>
			<td width="200px" style="text-align: right;"><%=sc.getPropComment()%>(<%=sc.getPropName() %>)</td>
			<td><input type="text" id="pValue" name="pValue" value="<%=sc.getPropValue()%>" disabled="disabled"/>
			<a href="update.jsp?id=<%=sc.getId() %>"  id="xg"  class="xg">修改</a>
			<a href="doDeleteProp.jsp?id=<%=sc.getId() %>"  id="sc"   onclick="return confirm('你确定要删除该属性么？')">删除</a>
			<%=sc.getInputComment() %>
			<!--  <a href="#"  name="propPrior"  id="displayOrder" onclick="sort(<%=sc.getId()%>)">排序</a><span id="propPriorTip" style="padding-bottom:5px;"></span>  -->
			</td>
		</form>
		</tr>
		<%} %>
		<%} %>
	</tbody>
</table>
<div id="changeColumnOrder" style="display:none">
<span id="changColumnOrderSpan"></span>
<span id="changeColumnOrderContentSpan"></span>
<span><a href="#"  style="color: red;" id="close">关闭</a></span>
</div>
<script type="text/javascript">
<!--
var pid=0;
function sort(id){
	pid=id;
	var isDisplay=$("#changeColumnOrder").css("display");
	if(isDisplay=="none"){
		ajaxRequestDisplayOrder("");
	}else{
		$(this).css("color","");
		$("#changeColumnOrder").css("display","none");
		$("#changeColumnOrderContentSpan").empty();
	}
	
};
function ajaxRequestDisplayOrder(flag){
	var width=$("#displayOrder").width();
	var offset=$("#displayOrder").offset();
	var top=offset.top;
	var left = offset.left;
	$.ajax({
		type:"get",
		data:"id="+pid+"&operation="+flag, 
		url:"doAjaxSetOrder.jsp",
		dataType:"html",
		success:function(msg){
			$("#changeColumnOrderContentSpan").append(msg);
		},
		error:function(){
			alert("服务器未返回！");
		},
			complete:function(){
			var contentHeight=$("#changeColumnOrder").height();
			var spanTop=contentHeight/2;
			top=top-spanTop;
			$("#changColumnOrderSpan").css({"position":"absolute","top":spanTop+"px","left":"16px","height":"30px","width":"18px","background":"url('/images/arr_ico.gif') no-repeat"});
			$("#changeColumnOrder").css({"display":"block","position":"absolute","left":left+width+"px","top":top+"px","border":"1px solid #999","height":"auto", "width":"auto","padding":"18px 18px","line-height":"20px","background":"#FFFFFF"});
		} 
	});
};
function upOperation(){
	var flag="up";
	$("#changeColumnOrderContentSpan").empty();
	ajaxRequestDisplayOrder(flag);
}
function downOperation(){
	var flag="down";
	$("#changeColumnOrderContentSpan").empty();
	ajaxRequestDisplayOrder(flag);
}
function refresDisplayOrder(value){
	$("#displayOrder").val(value);
}

$("#close").click(function(){
	$("#changeColumnOrderContentSpan").empty();
	$("#changeColumnOrder").css("display","none");
});
//-->

</script>
