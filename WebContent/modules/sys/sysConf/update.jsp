<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE = "修改配置属性";%>
<%@include file="/include/header.jsp"%>
<%
	SysConfig sc = (SysConfig) dao.load(SysConfig.class, Long.valueOf(box.getParam("id")));
%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({formID:"permSaveFormId",onError:function(msg){alert(msg);return false;},onSuccess:function(){return true;}});
	$("#propName").formValidator({onShow:"请输入属性名称",onFocus:"权限名至少1个字符",onCorrect:"该名称有效"}).inputValidator({min:1,onError:"你输入的属性名称个数不对"});
	$("#propValue").formValidator({onShow:"请输入属性值",onFocus:"请不要轻易更改此项",onCorrect:"输入合法"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"两边不能有空符号"},onError:"不能为空,请确认"});
	$("#propDesc").formValidator({onShow:"请输入属性备注",onFocus:"备注要简洁",onCorrect:"输入成功"}).inputValidator({min:1,onError:"备注不可以为空！"});
	$("#inputDesc").formValidator({onShow:"请输入输入说明",onFocus:"说明要简洁",onCorrect:"输入成功"}).inputValidator({min:1,onError:"输入说明不可以为空！"});
	
});
</script>
<form action="doUpdate.jsp" method="post" name="permSaveForm" id="permSaveFormId">
<table width="450" border="0" cellpadding="0" cellspacing="0" class="msc-table">
	<tbody>
		<tr>
			<input type="hidden" name="id" value="<%=box.getParam("id")%>" />
			<th width="100" align="right">属性名称：</th>
			<td align="left"><input name="propName" id="propName" type="text" value="<%=sc.getPropName()%>" class="input_001" /><span id="propNameTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">属性值：</th>
			<td align="left"><textarea id="propValue" name="propValue" cols="30" rows="5" class="input_001"><%=sc.getPropValue()%></textarea><span id="propValueTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">属性备注：</th>
			<td align="left"><input  name="propDesc" id="propDesc" type="text" value="<%=sc.getPropComment()%>" class="input_001" /><span id="propDescTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">输入说明：</th>
			<td align="left"><input  name="inputDesc" id="inputDesc" type="text" value="<%=sc.getInputComment()%>" class="input_001" /><span id="inputDescTip" style="padding-bottom:5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">优先级：</th>
			<td align="left"><input  name="propPrior" id="displayOrder" type="text" value="<%=sc.getDisplayOrder()%>" class="input_001" /><span id="propPriorTip" style="padding-bottom:5px;"></span>
			<br><span style="padding-bottom: 10px;color:red;">*表示本项在同级别下所出现的位置顺序。显示数字共分2级，三位表示一个级，
				从左至右，第一个三位表示第一级，本项是第几级就修改第几个三位数，不够三位，采取前补0.</span>
			</td>
		</tr>
		<tr>
			<td height="30" colspan="2" align="center"><input type="image" src="/images/button_xg.gif" style="cursor: pointer;">&nbsp;&nbsp;<img src="/images/button_fh.gif" style="cursor: pointer;"
				onclick="window.location='index.jsp'" /></td>
		</tr>
	</tbody>
</table>
</form>
<div id="changeColumnOrder" style="display:none">
<span id="changColumnOrderSpan"></span>
<span id="changeColumnOrderContentSpan"></span>
<a href="#"  style="color: red;" id="close">关闭</a>
</div>
<script type="text/javascript">
<!--
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
		data:"id=<%=sc.getId()%>&operation="+flag,
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

$("#close").click(function(){
	$("#changeColumnOrderContentSpan").empty();
	$("#changeColumnOrder").css("display","none");
});
//-->
</script>
<%@include file="/include/footer.jsp"%>