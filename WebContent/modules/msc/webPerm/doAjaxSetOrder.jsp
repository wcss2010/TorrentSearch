<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	long permId=box.getLongParam("permId");
	MscPerm mp=dao.load(MscPerm.class, permId);
	long mpParentId=mp.getParentId();
	String operation=box.getParam("operation");
	String selectSql ="";
		String dispayOrder=mp.getMenuPath();
	if(!"".equals(operation)){
		if("up".equals(operation)){
		selectSql=" where parent_id="+mpParentId+" and menu_path<"+dispayOrder+" order by menu_path desc";
		}
		else if("down".equals(operation)){
			selectSql=" where parent_id="+mpParentId+" and menu_path>"+dispayOrder+" order by menu_path";
		}
		//对上面的是上升或是下降进行排序
		DataList<MscPerm> dlOpt=dao.list(MscPerm.class, selectSql);
		MscPerm scOpt= dlOpt.get(0);
		String displayOrderOpt=scOpt.getMenuPath();
		scOpt.setMenuPath(mp.getMenuPath());
		mp.setMenuPath(displayOrderOpt);
		dao.update(scOpt);
		dao.update(mp);
		//将隶属于本栏目的子栏目的menu_path一同修改
		DataList<MscPerm> dlTmp=dao.list(MscPerm.class,"where parent_id="+permId);
		int catGrade=mp.getMenuLayer();
		String replacement=mp.getMenuPath().substring(0,(catGrade+1)*3);
		while(dlTmp.hasNext()){
			MscPerm scT=dlTmp.next();
			String s=scT.getMenuPath().substring((catGrade+1)*3);
			scT.setMenuPath(replacement+s);
			dao.update(scT);
		}
		dlTmp=dao.list(MscPerm.class,"where parent_id="+scOpt.getId());
		catGrade=scOpt.getMenuLayer();
		replacement=scOpt.getMenuPath().substring(0,(catGrade+1)*3);
		while(dlTmp.hasNext()){
			MscPerm scT=dlTmp.next();
			String s=scT.getMenuPath().substring((catGrade+1)*3);
			scT.setMenuPath(replacement+s);
			dao.update(scT);
		}
		box.outJS("refresDisplayOrder('"+mp.getMenuPath()+"')");
	}
	
//将处理后的结果正常输出
selectSql=" where perm_type=0 and parent_id="+mpParentId+" order by menu_path";//列出所有的权限
DataList<MscPerm> list= dao.list(MscPerm.class,selectSql);
%>

	<%
	int i=0;
	int length=list.size();
	for (MscPerm sc:list){
		i++;
	//String allString="|--------------------------------------------------------------------------------";
	//allString=allString.substring(0,sc.getLayer()*6);
%>
	<li style="list-style: none;" onmouseover="mouseOverEvent(this);" onmouseout="mouseOutEvent(this);" onclick="mouseClick(this);"
		id="<%=sc.getId() %>"><%=sc.getPermName() %>&nbsp;
<%
if(permId==sc.getId()){
	if(i!=1){
%>
	<span onclick="upOperation();" style="cursor:pointer;font-weight: bolder;">↑</span>&nbsp;
<%	
	}
	if(i!=length){
%>
	<span onclick="downOperation();" style="cursor:pointer;font-weight: bolder;">↓</span>
<%
	}
}
	out.println("</li>");
}
%>
<script>
	function mouseOverEvent(arg) {
		$(arg).css({
			"color" : "red"
		});
	}
	function mouseOutEvent(arg) {
		$(arg).css("color", "");
	}
	function mouseClick(arg){
		//$("input[name='parentId']").val($(arg).attr("id"));
		var parentName=$(arg).text();
		parentName=parentName.replace(/-/g,'');
		parentName=parentName.replace('|','');
		//$("#parentIdEvent").val(parentName);
		$("#changeParentId").css("display","none");
	}
</script>
