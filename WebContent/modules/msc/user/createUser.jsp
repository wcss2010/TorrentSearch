<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="创建新用户";%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<script type="text/javascript">
	$(function() {
		$.formValidator.initConfig({
			formID : "addUserForm",
			debug : false,
			submitOnce : true,
			onError : function(msg, obj, errorlist) {
				alert(msg);
				return false;
			}
		});
		$("#username").formValidator({
			onShow : "请输入用户名",
			onFocus : "用户名不得为空,至少为3个字符.",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 3,
			onError : "用户名输入不合法！"
		});
		$("#sentryName").formValidator({
			onShow : "请输入哨位名称",
			onFocus : "哨位名称不得为空,至少为3个字符.",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 3,
			onError : "哨位名称输入不合法！"
		});
		$("#sentryDesc").formValidator({
			onShow : "请输入哨位描述",
			onFocus : "哨位描述不得为空,至少为3个字符.",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 3,
			onError : "哨位描述输入不合法！"
		});
		$("#sentryLat").formValidator({
			onShow : "请输入纬度",
			onFocus : "纬度不得为空.",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 3,
			onError : "纬度输入不合法！"
		});
		$("#sentryLng").formValidator({
			onShow : "请输入经度",
			onFocus : "经度不得为空.",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 3,
			onError : "经度输入不合法！"
		});
		$("#passwd").formValidator({
			onShow : "请输入密码",
			onFocus : "至少为3位",
			onCorrect : "密码合法"
		}).inputValidator({
			min : 3,
			empty : {
				leftempty : false,
				rightempty : false,
				emptyError : "密码两边不能有空符号"
			},
			onError : "密码输入不合法，请确认"
		});
		$("#passwd2").formValidator({
			onShow : "请再次输入密码",
			onFocus : "至少为3位",
			onCorrect : "密码一致"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "重复密码两边不能有空符号"
			},
			onError : "重复密码不能为空，请确认"
		}).compareValidator({
			desID : "passwd",
			operateor : "=",
			onError : "两次密码不一致，请确认!"
		});
		$("#man").formValidator({
			onShow : "请输入联系人",
			onFocus : "联系人不能为空",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "联系人两边不能有空符号"
			},
			onError : "联系人不能为空,请确认!"
		});
		$("#tel").formValidator({
			onShow : "请输入联系电话",
			onFocus : "格式例如：0577-88888888",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			onError : "电话不能为空!"
		}).regexValidator({
			regExp : "^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",
			onError : "你输入的电话格式不正确"
		});
		$("#mobile").formValidator({
			onShow : "请输入手机号码",
			onFocus : "手机不能为空",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 11,
			max : 11,
			onError : "手机号码必须为11位，请确认!"
		}).regexValidator({
			regExp : "mobile",
			dataType : "enum",
			onError : "你输入的手机号码格式不正确"
		});
		$("#email").formValidator({
			onShow : "请输入Email地址",
			onFocus : "格式例如：admin@service.com",
			onCorrect : "输入正确"
		}).regexValidator({
			regExp : "email",
			dataType : "enum",
			onError : "你输入的邮箱格式不正确"
		});
		$("#orgname").formValidator({
			onShow : "请输入使用单位",
			onFocus : "使用单位不能为空",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "使用单位两边不能有空符号"
			},
			onError : "使用单位不能为空!"
		});
		$("#orgdept").formValidator({
			onShow : "请输入使用部门",
			onFocus : "使用部门不能为空",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "使用部门两边不能有空符号"
			},
			onError : "使用部门不能为空!"
		});
		$("#address").formValidator({
			onShow : "请输入地址",
			onFocus : "地址不能为空",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "地址两边不能有空符号"
			},
			onError : "地址不能为空!"
		});

	});
</script>
<html>
<form action="doCreateUser.jsp" method="post" name="addUserForm" id="addUserForm">
	<table width="450" border="0" cellpadding="0" cellspacing="0" class="msc-table">
		<tbody>
			<tr>
				<th width="100" align="right">用户名：</th>
				<td align="left"><input id="username" name="username" value="" type="text" class="input_001" /><span id="usernameTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">密码：</th>
				<td align="left"><input id="passwd" name="passwd" value="" type="password" class="input_001" /><span id="passwdTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">确认密码：</th>
				<td align="left"><input id="passwd2" name="passwd2" value="" type="password" class="input_001" /><span id="passwd2Tip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">联系人：</th>
				<td align="left"><input name="man" id="man" value="" type="text" class="input_001" /><span id="manTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">电话：</th>
				<td align="left"><input name="tel" id="tel" value="" type="text" class="input_001" /><span id="telTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">手机：</th>
				<td align="left"><input name="mobile" id="mobile" value="" type="text" class="input_001" /><span id="mobileTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">Email：</th>
				<td align="left"><input name="email" id="email" value="" type="text" class="input_001" /><span id="emailTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="100" align="right">使用单位：</th>
				<td align="left"><input name="orgname" value="" id="orgname" type="text" class="input_001" /><span id="orgnameTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td height="30" align="left"><input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;" onclick="javascript:document.forms['addUserForm'].reset();">
			</tr>
		</tbody>
	</table>
</form>
</html>
<%@include file="/include/footer.jsp"%>