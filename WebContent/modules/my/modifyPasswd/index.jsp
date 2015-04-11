<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "userPwdModifyFormId",
			debug:false,
			submitOnce:true,
			onError : function(msg,obj,errorlist) {
				alert(msg);
				return false;
			}
		});
		$("#oldPwd").formValidator({
			onShow : "请输入原密码",
			onFocus : "原密码不能为空",
			onCorrect:"密码合法"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "密码两边不能有空符号"
			},
			onError : "密码不能为空,请确认"
		});
		$("#newPwd").formValidator({onShow:"请输入新密码",onFocus:"至少为3位",onCorrect:"密码合法"}).inputValidator({min:3,empty:{leftempty:false,rightempty:false,emptyError:"密码两边不能有空符号"},onError:"密码输入不合法，请确认"});
		$("#reNewPwd").formValidator({onShow:"请再次输入新密码",onFocus:"至少为3位",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空，请确认"}).compareValidator({desID:"newPwd",operateor:"=",onError:"两次密码不一致，请确认!"});
	});
</script>  
<form action="doModifyPwd.jsp" method="post" name="userPwdModifyForm" id="userPwdModifyFormId">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="msc-table">
	<tbody>
	  	<tr>
			<th width="100" align="right">原密码：</th>
			<td align="left"><input name="oldPwd" id="oldPwd"  type="password"  value=""  class="input_001" /><span id="oldPwdTip" style="padding-bottom: 5px;"></span></td>
		</tr> 
		<tr>
			<th width="100" align="right">新密码：</th>
			<td align="left"><input name="newPwd" id="newPwd" type="password" value="" class="input_001" /><span id="newPwdTip" style="padding-bottom: 5px;"></span></td>
		</tr>
		<tr>
			<th width="100" align="right">重复密码：</th>
			<td align="left"><input name="reNewPwd" type="password" id="reNewPwd" value="" class="input_001" /><span id="reNewPwdTip" style="padding-bottom: 5px;"></span></td>
		</tr>
		<tr>
			<td height="30" colspan="2" align="center"><input type="image"" src="/images/button_xg.gif" style="cursor: pointer;">&nbsp;&nbsp; <img src="/images/button_cz.gif"
				style="cursor: pointer;" onclick="javascript:document.forms['userPwdModifyForm'].reset();"></td>
		</tr>
	</tbody>
</table>
</form>
<%@include file="/include/footer.jsp"%>
