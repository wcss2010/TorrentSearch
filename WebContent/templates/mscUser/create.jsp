
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增MscUser"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createMscUser",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#username").formValidator({
		empty : true,
		onShow : "请输入登录的用户名",
		onFocus : "登录的用户名至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "登录的用户名两边不能有空符号"
		},
		onError : "你输入的登录的用户名不正确,请确认!"
	});
$("#passwd").formValidator({
		empty : true,
		onShow : "请输入登录的密码",
		onFocus : "登录的密码至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "登录的密码两边不能有空符号"
		},
		onError : "你输入的登录的密码不正确,请确认!"
	});
$("#mscPerm").formValidator({
		empty : true,
		onShow : "请输入对应菜单权限",
		onFocus : "对应菜单权限至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "对应菜单权限两边不能有空符号"
		},
		onError : "你输入的对应菜单权限不正确,请确认!"
	});
$("#orgPerm").formValidator({
		empty : true,
		onShow : "请输入可管理单位的权限",
		onFocus : "可管理单位的权限至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "可管理单位的权限两边不能有空符号"
		},
		onError : "你输入的可管理单位的权限不正确,请确认!"
	});
$("#orgName").formValidator({
		empty : true,
		onShow : "请输入单位名称",
		onFocus : "单位名称至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "单位名称两边不能有空符号"
		},
		onError : "你输入的单位名称不正确,请确认!"
	});
$("#aliasName").formValidator({
		empty : true,
		onShow : "请输入联系人",
		onFocus : "联系人至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系人两边不能有空符号"
		},
		onError : "你输入的联系人不正确,请确认!"
	});
$("#telephone").formValidator({
		empty : true,
		onShow : "请输入电话",
		onFocus : "电话至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "电话两边不能有空符号"
		},
		onError : "你输入的电话不正确,请确认!"
	});
$("#mobile").formValidator({
		empty : true,
		onShow : "请输入手机",
		onFocus : "手机至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "手机两边不能有空符号"
		},
		onError : "你输入的手机不正确,请确认!"
	});
$("#email").formValidator({
		empty : true,
		onShow : "请输入Email",
		onFocus : "Email至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "Email两边不能有空符号"
		},
		onError : "你输入的Email不正确,请确认!"
	});
$("#lastLogonDate").formValidator({
		empty : true,
		onShow : "请输入最后登录时间",
		onFocus : "最后登录时间至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "最后登录时间两边不能有空符号"
		},
		onError : "你输入的最后登录时间不正确,请确认!"
	});
$("#lastLogonIp").formValidator({
		empty : true,
		onShow : "请输入最后登录IP",
		onFocus : "最后登录IP至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "最后登录IP两边不能有空符号"
		},
		onError : "你输入的最后登录IP不正确,请确认!"
	});
$("#createDate").formValidator({
		empty : true,
		onShow : "请输入建立时间",
		onFocus : "建立时间至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "建立时间两边不能有空符号"
		},
		onError : "你输入的建立时间不正确,请确认!"
	});
$("#modifyDate").formValidator({
		empty : true,
		onShow : "请输入最后修改时间",
		onFocus : "最后修改时间至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "最后修改时间两边不能有空符号"
		},
		onError : "你输入的最后修改时间不正确,请确认!"
	});
$("#status").formValidator({
		empty : true,
		onShow : "请输入状态",
		onFocus : "状态至少3个字符",
		onCorrect:"输入正确"
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

<form id="createMscUser" name="createMscUser" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">登录的用户名:</th>
      <td align="left">
         <input type="text" id="username" name="username" size="24" class="input_001" value=""/>
         <span id="usernameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">登录的密码:</th>
      <td align="left">
         <input type="text" id="passwd" name="passwd" size="24" class="input_001" value=""/>
         <span id="passwdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">对应菜单权限:</th>
      <td align="left">
         <input type="text" id="mscPerm" name="mscPerm" size="24" class="input_001" value=""/>
         <span id="mscPermTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">可管理单位的权限:</th>
      <td align="left">
         <input type="text" id="orgPerm" name="orgPerm" size="24" class="input_001" value=""/>
         <span id="orgPermTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">单位名称:</th>
      <td align="left">
         <input type="text" id="orgName" name="orgName" size="24" class="input_001" value=""/>
         <span id="orgNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">联系人:</th>
      <td align="left">
         <input type="text" id="aliasName" name="aliasName" size="24" class="input_001" value=""/>
         <span id="aliasNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">电话:</th>
      <td align="left">
         <input type="text" id="telephone" name="telephone" size="24" class="input_001" value=""/>
         <span id="telephoneTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">手机:</th>
      <td align="left">
         <input type="text" id="mobile" name="mobile" size="24" class="input_001" value=""/>
         <span id="mobileTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">Email:</th>
      <td align="left">
         <input type="text" id="email" name="email" size="24" class="input_001" value=""/>
         <span id="emailTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">最后登录时间:</th>
      <td align="left">
         <input type="text" id="lastLogonDate" name="lastLogonDate" size="24" class="input_001" value=""/>
         <span id="lastLogonDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">最后登录IP:</th>
      <td align="left">
         <input type="text" id="lastLogonIp" name="lastLogonIp" size="24" class="input_001" value=""/>
         <span id="lastLogonIpTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">建立时间:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value=""/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">最后修改时间:</th>
      <td align="left">
         <input type="text" id="modifyDate" name="modifyDate" size="24" class="input_001" value=""/>
         <span id="modifyDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">状态:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value=""/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createMscUser'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
