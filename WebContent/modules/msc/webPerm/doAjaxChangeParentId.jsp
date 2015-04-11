<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	long permId=box.getLongParam("permId",-1);
long layer=box.getLongParam("layer");
String selectSql = "where perm_type=0 order by menu_path";//列出所有的权限
DataList<MscPerm> list= dao.list(MscPerm.class,selectSql);
%>
<ul style="list-style: none;">
	<%for (MscPerm mp:list){
	String allString="|--";
	//allString=allString.substring(0,mp.getMenuLayer()*6);
	if(permId!=mp.getId() && layer>mp.getMenuLayer()){//不输出其本身
%>
	<li onmouseover="mouseOverEvent(this);" onmouseout="mouseOutEvent(this);" onclick="mouseClick(this);"
		id="<%=mp.getId() %>"><%=allString %><%=mp.getPermName()%></li>
	<%
	}
}
%>
</ul>
<script>
	function mouseOverEvent(arg) {
		$(arg).css({
			"color" : "red",
			"cursor" : "pointer"
		});
	}
	function mouseOutEvent(arg) {
		$(arg).css("color", "");
	}
	function mouseClick(arg){
		$("input[name='parentId']").val($(arg).attr("id"));
		var parentName=$(arg).text();
		parentName=parentName.replace(/-/g,'');
		parentName=parentName.replace('|','');
		$("#parentIdEvent").val(parentName);
		$("#changeParentId").css("display","none");
	}
</script>
