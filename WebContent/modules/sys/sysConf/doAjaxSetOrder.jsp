<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	long id=box.getLongParam("id");
	SysConfig sc=dao.load(SysConfig.class, id);
	String operation=box.getParam("operation");
	String selectSql ="";
	String displayOrder=sc.getDisplayOrder();
	if(!"".equals(operation)){
		if("up".equals(operation)){
		selectSql=" where cat_name="+"'"+sc.getCatName()+"'"+" and prop_name is not null and status>-1 and display_order<"+displayOrder+ " order by display_order desc";
		}
		else if("down".equals(operation)){
			selectSql=" where cat_name="+"'"+sc.getCatName()+"'"+" and prop_name is not null and status>-1 and display_order>"+displayOrder+ " order by display_order";
		}
		//对上面的是上升或是下降进行排序
	DataList<SysConfig> dlOpt=dao.list(SysConfig.class, selectSql);
		SysConfig scOpt= dlOpt.get(0);
		String displayOrderOpt=scOpt.getDisplayOrder();
		scOpt.setDisplayOrder(displayOrder);
		sc.setDisplayOrder(displayOrderOpt);
		try{
		dao.update(scOpt);
		dao.update(sc);
		}catch(Exception e){
			JSPLogger.error(e.getMessage(),e);
		}
		box.outJS("refresDisplayOrder('"+sc.getDisplayOrder()+"')");
	}
//将处理后的结果正常输出
selectSql=" where cat_name="+"'"+sc.getCatName()+"'"+" and prop_name is not null and status>-1"+ " order by display_order";//列出所有的权限
DataList<SysConfig> list=null;
try{
list= dao.list(SysConfig.class,selectSql);
}catch(Exception e){
	JSPLogger.error(e.getMessage(),e);
}
	
%>

<%
	int i=0;
	int length=list.size();
	for (SysConfig s:list){
		i++;
	//String allString="|--------------------------------------------------------------------------------";
	//allString=allString.substring(0,sc.getLayer()*6);
%>
<li style="list-style: none;" onmouseover="mouseOverEvent(this);" onmouseout="mouseOutEvent(this);" onclick="mouseClick(this);" id="<%=s.getId() %>"><%=s.getPropComment() %>&nbsp; <%
if(id==s.getId()){
	if(i!=1){
%> <span onclick="upOperation();" style="cursor: pointer; font-weight: bolder;">↑</span>&nbsp; <%	
	}
	if(i!=length){
%> <span onclick="downOperation();" style="cursor: pointer; font-weight: bolder;">↓</span> <%
	}
}
	out.println("</li>");
}
%> <script>
	function mouseOverEvent(arg) {
		$(arg).css({
			"color" : "red",
		});
	}
	function mouseOutEvent(arg) {
		$(arg).css("color", "");
	}
</script>