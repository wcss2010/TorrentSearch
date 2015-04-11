<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "添加新的配置属性";
%>
<%@include file="/include/header.jsp"%>
<%
	int pid = box.getIntParam("pid");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "createpropForm",
			onError : function(msg) {
				alert(msg);
				return false;
			},
			onSuccess : function() {
				return true;
			}
		});
		$("#propName").formValidator({
			onShow : "请输入属性名称",
			onFocus : "权限名至少1个字符",
			onCorrect : "该名称有效"
		}).inputValidator({
			min : 1,
			onError : "属性名称不得为空"
		});
		$("#propValue").formValidator({
			onShow : "请输入属性值",
			onFocus : "属性值不得为空",
			onCorrect : "输入合法"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "两边不能有空符号"
			},
			onError : "属性值不能为空,请确认"
		});
		$("#propDesc").formValidator({
			onShow : "请输入属性备注",
			onFocus : "备注要简洁",
			onCorrect : "输入成功"
		}).inputValidator({
			min : 1,
			onError : "属性备注不可以为空！"
		});
		$("#inputDesc").formValidator({
			onShow : "请输入输入说明",
			onFocus : "说明要简洁",
			onCorrect : "输入成功"
		}).inputValidator({
			min : 1,
			onError : "说明不可以为空！"
		});
	});
</script>
<form action="doCreateProp.jsp" method="post" name="createpropForm" id="createpropForm">
	<input type="hidden" id="pid" name="pid" value="<%=pid%>" />
	<table width="500" border="0" cellpadding="0" cellspacing="0" class="msc-table">
		<tbody>
			<tr>
				<th width="100" align="right">属性名称：</th>
				<td align="left"><input id="propName" name="propName" value="" type="text" class="input_001" /><span id="propNameTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">属性值：</th>
				<td align="left"><textarea id="propValue" name="propValue" cols="30" rows="5" class="input_001"></textarea><span id="propValueTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">属性备注：</th>
				<td align="left"><input id="propDesc" name="propDesc" value="" type="text" class="input_001" /><span id="propDescTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">输入说明：</th>
				<td align="left"><input id="inputDesc" name="inputDesc" value="" type="text" class="input_001" /><span id="inputDescTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td height="30" align="left"><input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;" onclick="javascript:document.forms['createpropForm'].reset();">&nbsp;&nbsp;<img src="/images/button_fh.gif" style="cursor: pointer;" onclick="javascript:history.back(-1);" /></td>
			</tr>
		</tbody>
	</table>
</form>
<%@include file="/include/footer.jsp"%>
