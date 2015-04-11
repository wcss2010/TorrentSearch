
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "修改用户";
%>
<%@include file="/include/header.jsp"%>
<%
	//获取参数
	long id = box.getLongParam("id");
	NgnUser ngnUser = (NgnUser) dao.load(NgnUser.class, id);
	String username = ngnUser.getUsername();
	String passwd = ngnUser.getPasswd();
	String mobile = ngnUser.getMobile();
	String email = ngnUser.getEmail();
	String aliasName = ngnUser.getAliasName();
	int userType = ngnUser.getUserType();
	int userPoint = ngnUser.getUserPoint();
	java.util.Date lastLogonDate = ngnUser.getLastLogonDate();
	java.util.Date createDate = ngnUser.getCreateDate();
	java.util.Date modifyDate = ngnUser.getModifyDate();
%>

<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "modifyNgnUser",
			debug : false,
			submitOnce : true,
			onError : function(msg, obj, errorlist) {
				alert(msg);
				return false;
			}
		});

		$("#username").formValidator({
			onShow : "请输入用户名",
			onFocus : "用户名至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "用户名两边不能有空符号"
			},
			onError : "你输入的用户名不正确,请确认!"
		});

		$("#passwd").formValidator({
			empty : true,
			onShow : "请输入密码",
			onFocus : "至少为6位",
			onCorrect : "密码合法"
		}).inputValidator({
			min : 6,
			empty : {
				leftempty : false,
				rightempty : false,
				emptyError : "密码两边不能有空符号"
			},
			onError : "密码输入不合法，请确认"
		});

		$("#passwd2").formValidator({
			empty : true,
			onShow : "请再次输入密码",
			onFocus : "至少为6位",
			onCorrect : "密码一致"
		}).inputValidator({
			min : 6,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "重复密码两边不能有空符号"
			},
			onError : "重复密码不能小于6位，请确认"
		}).compareValidator({
			desID : "passwd",
			operateor : "=",
			onError : "两次密码不一致，请确认!"
		});

		$("#mobile").formValidator({
			empty : true,
			onShow : "请输入手机号码",
			onFocus : "手机号码至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "手机号码两边不能有空符号"
			},
			onError : "你输入的手机号码不正确,请确认!"
		});

		$("#email").formValidator({
			empty : true,
			onShow : "请输入Email地址",
			onFocus : "Email地址至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "Email地址两边不能有空符号"
			},
			onError : "你输入的Email地址不正确,请确认!"
		});

		$("#aliasName").formValidator({
			empty : true,
			onShow : "请输入昵称",
			onFocus : "昵称至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "昵称两边不能有空符号"
			},
			onError : "你输入的昵称不正确,请确认!"
		});

		$("#lastLogonDate").formValidator({
			empty : true,
			onShow : "请输入上次登录时间",
			onFocus : "上次登录时间至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "上次登录时间两边不能有空符号"
			},
			onError : "你输入的上次登录时间不正确,请确认!"
		});

		$("#createDate").formValidator({
			empty : true,
			onShow : "请输入创建时间",
			onFocus : "创建时间至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "创建时间两边不能有空符号"
			},
			onError : "你输入的创建时间不正确,请确认!"
		});

		$("#modifyDate").formValidator({
			empty : true,
			onShow : "请输入修改时间",
			onFocus : "修改时间至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "修改时间两边不能有空符号"
			},
			onError : "你输入的修改时间不正确,请确认!"
		});

		$("#status").formValidator({
			empty : true,
			onShow : "请输入状态",
			onFocus : "状态至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "状态两边不能有空符号"
			},
			onError : "你输入的状态不正确,请确认!"
		});
		$("#userPoint").formValidator({
			empty : true,
			onShow : "请输入积分",
			onFocus : "状态至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "状态两边不能有空符号"
			},
			onError : "你输入的状态不正确,请确认!"
		});

	});
</script>
<form id="modifyNgnUser" name="modifyNgnUser" method="post" action="doModify.jsp">
	<input type="hidden" name="id" value="<%=id%>" />
	<table width="580" border="0" align="center" cellpadding="0" cellspacing="0" class="msc-table">
		<tr>
			<th align="right" width="100px">用户名:</th>
			<td align="left"><input type="text" id="username" name="username" size="24" class="input_001" value="<%=username%>" /> <span id="usernameTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">昵称:</th>
			<td align="left"><input type="text" id="aliasName" name="aliasName" size="24" class="input_001" value="<%=aliasName%>" /> <span id="aliasNameTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">用户类型:</th>
			<td align="left">
				<%
					if (userType == 0) {
				%> <label> <input id="userType" name="userType" type="radio" value="0" checked />VIP用户
			</label> <label><input id="userType" name="userType" type="radio" value="1" />普通用户 </label> <%
 	} else {
 %> <label> <input id="userType" name="userType" type="radio" value="0" />VIP用户
			</label> <label><input id="userType" name="userType" type="radio" value="1" checked />普通用户 </label> <%
 	}
 %>
			</td>
		</tr>
		<tr>
			<th align="right" width="100px">用户积分:</th>
			<td align="left"><input type="text" id="userPoint" name="userPoint" size="24" class="input_001" value="<%=userPoint%>" /> <span id="userPointTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">密码:</th>
			<td align="left"><input type="password" id="passwd" name="passwd" size="24" class="input_001" value="" /> <span id="passwdTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">确认密码:</th>
			<td align="left"><input type="password" id="passwd2" name="passwd2" size="24" class="input_001" value="" /> <span id="passwd2Tip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">手机号码:</th>
			<td align="left"><input type="text" id="mobile" name="mobile" size="24" class="input_001" value="<%=mobile%>" /> <span id="mobileTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">Email地址:</th>
			<td align="left"><input type="text" id="email" name="email" size="24" class="input_001" value="<%=email%>" /> <span id="emailTip"></span></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;" onclick="javascript:document.forms['modifyNgnUser'].reset();"></td>
		</tr>
	</table>
</form>
<%@include file="/include/footer.jsp"%>
