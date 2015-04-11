<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE = "修改权限";%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<%
	MscPerm mp = (MscPerm) dao.load(MscPerm.class, Long.valueOf(box.getParam("permId")));
%>
<script language="javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"permSaveFormId",onError:function(msg){alert(msg);return false;},onSuccess:function(){return true;}});
	$("#permName").formValidator({onShow:"请输入权限名",onFocus:"权限名至少1个字符",onCorrect:"该名称有效"}).inputValidator({min:1,max:50,empty : {
		leftEmpty : false,
		rightEmpty : false,
		emptyError : "权限名称两边不能有空符号"
	},
	onError : "权限名称长度输入错误,请确认!"});
	$("#URLName").formValidator({onShow:"请输入权限URL",onFocus:"请不要轻易更改此项",onCorrect:"输入合法"}).inputValidator({min:2,max:100,empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"},onError:"URL目录名长度输入错误,请确认!"});
	$("#permDesc").formValidator({onShow:"请输入权限的描述",onFocus:"描述要简洁",onCorrect:"输入成功"}).inputValidator({min:1,max:100,onError : "权限描述长度输入错误，请确认！"});
});
</script>
<form action="doEdit.jsp" method="post" name="permSaveForm" id="permSaveFormId">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="msc-table">
	<tbody>
		<tr>
			<input type="hidden" name="permId" value="<%=box.getParam("permId")%>" />
			<th width="100" align="right">权限名称：</th>
			<td align="left"><input name="permName" id="permName" type="text" value="<%=mp.getPermName()%>" class="input_001" /><span id="permNameTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">URL目录名：</th>
			<td align="left"><input  name="URLName" id="URLName" type="text" value="<%=mp.getActionUrl()%>" class="input_001" /><span id="URLNameTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">权限描述：</th>
			<td align="left"><input  name="permDesc" id="permDesc" type="text" value="<%=mp.getPermDesc()%>" class="input_001" /><span id="permDescTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">优先级：</th>
			<td align="left"><input  name="permPrior" id="displayOrder" type="text" value="<%=mp.getMenuPath()%>" class="input_001" /><span id="permPriorTip" style="padding-bottom:5px;"></span>
			<br><span style="padding-bottom: 10px;color:red;">*表示本项在同级别下所出现的位置顺序。显示数字共分6级，三位表示一个级，
				从左至右，第一个三位表示第一级，本项是第几级就修改第几个三位数，不够三位，采取前补0.</span>
			</td>
		</tr>
			<%if(mp.getMenuLayer()>0){ %>
		<tr>
			<th width="100" align="right">更改本项隶属关系：</th>
			<td align="left"><input  name="itemAffiliation" id="parentIdEvent" type="text" style="color:gray;" value="请单击此处" readonly="readonly" class="input_001" /><span id="parentIdEventTip" style="padding-bottom:5px;"></span>
			<input type="hidden" name="parentId" id="parentId"/>
			</td>
		</tr>
		<%} %>
		<tr>
			<td height="30" colspan="2" align="center"><input type="image" src="/images/button_xg.gif" style="cursor: pointer;">&nbsp;&nbsp; <img src="/images/button_fh.gif" style="cursor: pointer;"
				onclick="javascript:history.back(-1);" /></td>
		</tr>
	</tbody>
</table>
</form>
<div id="changeParentId" style="display:none;">
<span id="changeParentIdSpan"></span>
<span id="changeParentIdContent"></span>
<span><a href="#"  style="color: red;" id="close1">关闭</a></span>
</div>
<div id="changeColumnOrder" style="display:none">
<span id="changColumnOrderSpan"></span>
<span id="changeColumnOrderContentSpan"></span>
<span><a href="#"  style="color: red;" id="close">关闭</a></span>
</div>
<script type="text/javascript">
<!--
$("#parentIdEvent").click(function(){
	var isDisplay=$("#changeParentId").css("display");
	if(isDisplay=="none"){
		var width=$("#parentIdEvent").width();
		var offset=$("#parentIdEvent").offset();
		var top=offset.top;
		var left = offset.left;
		$.ajax({
			type:"get",
			data:"permId=<%=box.getParam("permId")%>&layer=<%=mp.getMenuLayer()%>",
			url:"doAjaxChangeParentId.jsp",
			dataType:"html",
			success:function(msg){
				//var value=eval("("+msg+")");
				$("#changeParentIdContent").empty();
				$("#changeParentIdContent").append(msg);
				//alert(msg);
				},
			error:function(){alert("服务器未返回数据！");},
			complete:function(){
				var contentHeight=$("#changeParentId").height();
				var spanTop=contentHeight/2;
				top=top-spanTop;
				$("#changeParentIdSpan").css({"position":"absolute","top":spanTop+"px","left":"-16px","height":"30px","width":"18px","background":"url('/images/arr_ico.gif') no-repeat"});
				$("#changeParentId").css({"display":"block","position":"absolute","left":left+width+"px","top":top+"px","border":"1px solid #999","height":"auto", "width":"auto","padding":"18px 18px","line-height":"20px","background":"#FFFFFF"});
			}
		});
	}else{
		$("#changeParentId").css("display","none");
		$("#changeParentIdContent").empty();
	}
});
$("#displayOrder").click(function(){
	var isDisplay=$("#changeColumnOrder").css("display");
	if(isDisplay=="none"){
		ajaxRequestDisplayOrder("");
	}else{
		$(this).css("color","");
		$("#changeColumnOrder").css("display","none");
		$("#changeColumnOrderContentSpan").empty();
	}
});
function ajaxRequestDisplayOrder(flag){
	var width=$("#displayOrder").width();
	var offset=$("#displayOrder").offset();
	var top=offset.top;
	var left = offset.left;
	$.ajax({
		type:"get",
		data:"permId=<%=mp.getId()%>&operation="+flag,
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
			$("#changColumnOrderSpan").css({"position":"absolute","top":spanTop+"px","left":"-16px","height":"30px","width":"18px","background":"url('/images/arr_ico.gif') no-repeat"});
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
//-->
$("#close").click(function(){
	$("#changeColumnOrderContentSpan").empty();
	$("#changeColumnOrder").css("display","none");
});
$("#close1").click(function(){
	$("#changeParentIdContent").empty();
	$("#changeParentId").css("display","none");
});
</script>
<%@include file="/include/footer.jsp"%>