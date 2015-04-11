<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "修改用户";
%>
<%
	long userId = box.getLongParam("id", -1);
	MscUser mu = dao.load(MscUser.class, userId);
%>
<%@include file="/include/header.jsp"%>
<%@include file="checkLicense.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "editUserFormId",
			debug : false,
			submitOnce : true,
			onError : function(msg, obj, errorlist) {
				alert(msg);
				return false;
			}
		});

		$("#passwd").formValidator({
			onShow : "请输入新密码",
			onFocus : "不输入则代表不修改密码",
			onCorrect : "密码合法"
		}).inputValidator({
			min : 0,
			empty : {
				leftempty : false,
				rightempty : false,
				emptyError : "密码两边不能有空符号"
			},
			onError : "密码输入不合法，请确认"
		});
		$("#passwd2").formValidator({
			onShow : "请再次输入密码",
			onFocus : "两次密码必须一致",
			onCorrect : "密码一致"
		}).inputValidator({
			min : 0,
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
			onShow : "请输入新的联系人",
			onFocus : "联系人不能为空",
			onCorrect : "正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "联系人两边不能有空符号"
			},
			onError : "联系人不能为空,请确认!"
		}).defaultPassed();
		$("#tel").formValidator({
			onShow : "请输入新的电话",
			onFocus : "格式例如：0577-88888888",
			onCorrect : "正确"
		}).inputValidator({
			min : 1,
			onError : "电话不能为空!"
		}).regexValidator({
			regExp : "^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",
			onError : "你输入的电话格式不正确"
		}).defaultPassed();
		$("#mobile").formValidator({
			onShow : "请新输入新的手机",
			onFocus : "手机不能为空",
			onCorrect : "正确"
		}).inputValidator({
			min : 11,
			max : 11,
			onError : "手机号码必须为11位，请确认!"
		}).regexValidator({
			regExp : "mobile",
			dataType : "enum",
			onError : "你输入的手机号码格式不正确"
		}).defaultPassed();
		$("#email").formValidator({
			onShow : "请输入新的emial",
			onFocus : "格式例如:admin@service.com",
			onCorrect : "正确"
		}).regexValidator({
			regExp : "email",
			dataType : "enum",
			onError : "你输入的邮箱格式不正确"
		}).defaultPassed();
		$("#policeId").formValidator({
			onShow : "请输入新的单位名称",
			onFocus : "使用单位不能为空",
			onCorrect : "正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "使用单位两边不能有空符号"
			},
			onError : "使用单位不能为空!"
		}).defaultPassed();
		$("#department").formValidator({
			onShow : "请输入新的使用部门",
			onFocus : "使用部门不能为空",
			onCorrect : "正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "使用部门两边不能有空符号"
			},
			onError : "使用部门不能为空!"
		}).defaultPassed();
		$("#address").formValidator({
			onShow : "请输入新地址",
			onFocus : "地址不能为空",
			onCorrect : "正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "地址两边不能有空符号"
			},
			onError : "地址不能为空!"
		}).defaultPassed();
	});
</script>
<form action="doEditUser.jsp" method="post" name="editUserForm" id="editUserFormId">
	<table border="0" cellpadding="0" cellspacing="0" class="msc-table"  width="450">
		<input type="hidden" name="id" value="<%=mu.getId()%>" />
		<tbody>
			<tr>
				<th width="100" align="right">用户名：</th>
				<td align="left"><input id="username" name="username" value="<%=mu.getUsername()%>" type="text" class="input_001" disabled="disabled" /><span id="usernameTip" style="padding-bottom: 10px;"></span></td>
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
				<th width="120" align="right">别名：</th>
				<td align="left"><input name="man" id="man" value="<%=mu.getAliasName()%>" type="text" class="input_001" /><span id="manTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="120" align="right">电话：</th>
				<td align="left"><input name="tel" id="tel" value="<%=mu.getTelephone()%>" type="text" class="input_001" /><span id="telTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="120" align="right">手机：</th>
				<td align="left"><input name="mobile" id="mobile" value="<%=mu.getMobile()%>" type="text" class="input_001" /><span id="mobileTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="120" align="right">Email：</th>
				<td align="left"><input name="email" id="email" value="<%=mu.getEmail()%>" type="text" class="input_001" /><span id="emailTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<th width="120" align="right">使用单位：</th>
				<td align="left"><input name="orgname" value="<%=mu.getOrgName()%>" id="orgname" type="text" class="input_001" /><span id="orgNameTip" style="padding-bottom: 10px;"></span></td>
			</tr>
			<tr>
				<td></td>
				<td height="30" align="left"><input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; &nbsp;&nbsp; <img src="/images/button_fh.gif" style="cursor: pointer;" onclick="window.location='index.jsp'" /></td>
			</tr>
		</tbody>
	</table>
</form>
<%@include file="/include/footer.jsp"%>