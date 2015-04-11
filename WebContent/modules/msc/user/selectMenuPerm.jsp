<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="请选择相应的权限";%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<%
MscUser mu=(MscUser)dao.load(MscUser.class,box.getLongParam("id"));
String sql="select count(id) from msc_perm where perm_type=0";
long count=dao.queryForCount(sql);
%>
请为
<span style="font-size: 15px; font-weight: bold;"><%=mu.getUsername()%></span>
重新分配权限：
<br></br>
<hr>
<div style="padding: 10px 30px 50px 30px; border-collapse: collapse; border: thin #ccc solid;">
	<form action="doSelectMenuPerm.jsp" method="post" name="selectUserPerm">
		<img src="/images/button_xg.gif" style="cursor: pointer;" onclick="javascript:document.forms['selectUserPerm'].submit();" />&nbsp; &nbsp;<img src="/images/button_cz.gif" style="cursor: pointer;" onclick="document.forms['selectUserPerm'].reset();" /> &nbsp;
		<br></br>
		<%
String permText=mu.getMscPerm();
//列出该用户都有哪些权限，放在一个list中，不用String.indexOf()是因为19和9会被误匹配！
String[] permArray=permText.split(",");
List<String> listAll=new ArrayList<String>();
for (String s :permArray){
	listAll.add(s);
}
%>
		<input type="checkbox" name="selectAll" <%if("admin".equals(mu.getUsername())||permArray.length==count){out.print("checked");} %> value="selectAll" id="selectAllId" /><label for id="selectAllId"><span style="font-size: 15px;">全选 / 取消</span></label><br></br>
		<%
String selectSql = " where perm_type=0 order by menu_path";//列出所有的权限
DataList<MscPerm> list= dao.list(MscPerm.class,selectSql);
for (MscPerm mp:list){
	String allString="|--------------------------------------------------------------------------------";
	allString=allString.substring(0,mp.getMenuLayer()*6);
	String idAttr="";
	String nameAttr="";
	if(mp.getMenuLayer()==0){
		idAttr=String.valueOf(mp.getId());
	}else{
		idAttr="childOf"+String.valueOf(mp.getParentId());
		nameAttr="permName";
	}
%>
		<label for="<%=idAttr %>"><%=allString%><%=mp.getPermName() %></label> <input type="checkbox" value="<%=mp.getId()%>"  name="<%=nameAttr%>"  id="<%=idAttr %>" <%if("admin".equals(mu.getUsername())||listAll.contains(String.valueOf(mp.getId()))){out.print("checked");} %> />
		<%
	out.print("<br></br>");
}
%>
		<input type="hidden" name="id" value="<%=box.getParam("id")%>"/>
	</form>
</div>
<script type="text/javascript">
<!--
	$("input[type='checkbox']").click(function() {
		recursion($(this));
		if ($(this).attr("name") != "selectAll")
			isCheckAll();//处理每操作一个checkbox（除selectAll外）时检查是否是全部选择或全部取消状态
	});
	function recursion(o) {
		var findId = "childOf" + o.val();
		var statusOpt = o[0].checked;
		$("input[checked!=" + statusOpt + "]").each(function() {
			if ($(this).attr('id') == findId) {
				//1. jquery 1.6 以上 
				//$(this).prop('checked', statusOpt);
				//1. jquery 1.6 以下
				//$(this).attr('checked', statusOpt);
				//通用写法
				this.checked=statusOpt;
				recursion($(this));
			}
		});
	}
	function isCheckAll(){
		var selectAllStatus=true;
		$("input[type='checkbox'][name!='selectAll']").each(function(){
			if(this.checked==false){
				selectAllStatus=false;
				return false;
			}
		});
		$("input[type='checkbox'][name='selectAll']")[0].checked=selectAllStatus;
	}
	$("input[type='checkbox'][name='selectAll']").click(function() {//全选OR全取消
		var status=this.checked;
		$("input[type='checkbox']").each(function(){
			this.checked = status;
			
		});
	});
//-->
</script>
<%@include file="/include/footer.jsp"%>