<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE = "增加权限";%>
<%@include file="/include/header.jsp" %>
<%@include file="checkLicense.jsp"%>
<script type="text/javascript">
	$(function(){
		$.formValidator.initConfig({
			formID : "permSaveForm",
			debug:false,
			submitOnce:true,
			onError : function(msg,obj,errorlist) {
				alert(msg);
				return false;
			}
		});
		$("#permName").formValidator({
			onShow:"请输入权限名称",
			onFocus:"权限名称简洁为好",
			onCorrect:"输入正确"
		}).inputValidator({
			min :1,
			max:50,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "权限名称两边不能有空符号"
			},
			onError : "权限名称长度输入错误,请确认!"
		});
		$("#URLName").formValidator({
			onShow:"请输入URL目录名",
			onFocus:"URL目录名不得为空",
			onCorrect:"输入正确"
		}).inputValidator({
			min :2,
			max:100,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "URL目录名两边不能有空符号"
			},
			onError : "URL目录名长度输入错误,请确认!"
		});
		$("#permDesc").formValidator({
			onShow:"请输入权限描述",
			onFocus:"权限描述不得为空,简洁为好",
			onCorrect:"输入正确"
		}).inputValidator({
			min :1,
			max:100,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "权限描述两边不能有空符号"
			},
			onError : "权限描述长度输入错误，请确认！"
		});
	});
</script>
<form action="doCreate.jsp" method="post" name="permSaveForm" id="permSaveForm">
<table width="600px" border="0" cellpadding="0" cellspacing="0" class="msc-table">
<tbody>
	<tr>
		<input type="hidden" name="parentId" value="<%=box.getParam("parentId") %>" />
		<th align="right">权限名称：</th>
		<td align="left"><input name="permName" id="permName" type="text" class="input_001" /><span id="permNameTip" style="padding-bottom:5px;"></span></td>
	</tr>
	<tr>
		<th align="right">URL目录名：</th>
		<td  align="left"><input name="URLName" id="URLName" type="text" class="input_001" /><span id="URLNameTip" style="padding-bottom:5px;"></span></td>
	</tr>
	<tr>
		<th align="right">权限描述：</th>
		<td  align="left"><input name="permDesc" type="text" class="input_001"  id="permDesc"/><span id="permDescTip" style="padding-bottom:5px;"></span></td>
	</tr>
	<tr>
		<td></td>
		<td height="30" align="left"><input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />
		&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;" onclick="javascript:document.forms['permSaveForm'].reset();">
		&nbsp;&nbsp; <img src="/images/button_fh.gif" style="cursor:pointer;" onclick="javascript:history.back(-1);"/>
		</td>
	</tr>
</tbody>
</table>
</form>
<%@include file="/include/footer.jsp"%>