<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "添加新的分类";
%>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
	$(function(){
		$.formValidator.initConfig({
			formID : "createCatForm",
			debug:false,
			submitOnce:true,
			onError : function(msg,obj,errorlist) {
				alert(msg);
				return false;
			}
		});
		
		$("#catName").formValidator({
			onShow:"请输入分类名称",
			onFocus:"分类名称不能为空",
			onCorrect:"输入正确"
		}).inputValidator({
			min :1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "分类名称两边不能有空符号"
			},
			onError : "分类名称不能为空,请确认!"
		});
		$("#catDesc").formValidator({
			onShow:"请输入分类备注",
			onFocus:"分类备注不得为空",
			onCorrect:"输入正确"
		}).inputValidator({
			min :1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "分类备注两边不能有空符号"
			},
			onError : "分类备注不能为空,请确认!"
		});
	});
</script>
<form action="doCreateCat.jsp" method="post" name="createCatForm" id="createCatForm">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="msc-table">
	<tbody>
		<tr>
			<th width="100" align="right">分类名称：</th>
			<td align="left"><input id="catName" name="catName" value="" type="text" class="input_001" /><span id="catNameTip" style="padding-bottom: 10px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">分类备注：</th>
			<td align="left"><input id="catDesc" name="catDesc" value="" type="text" class="input_001" /><span id="catDescTip" style="padding-bottom: 10px;"></span></td>
		</tr>
		<tr>
			<td></td>
			<td height="30" align="left"><input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;"
				onclick="javascript:document.forms['createCatForm'].reset();">&nbsp;&nbsp;<img src="/images/button_fh.gif" style="cursor:pointer;" onclick="javascript:history.back(-1);"/></td>
		</tr>
	</tbody>
</table>
</form>
<%@include file="/include/footer.jsp"%>
