
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改NgnUser"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
NgnUser ngnUser = (NgnUser)dao.load(NgnUser.class,id);
int userType = ngnUser.getUserType();
String username = ngnUser.getUsername();
String passwd = ngnUser.getPasswd();
String mobile = ngnUser.getMobile();
String email = ngnUser.getEmail();
String aliasName = ngnUser.getAliasName();
java.util.Date birthday = ngnUser.getBirthday();
int age = ngnUser.getAge();
int gender = ngnUser.getGender();
String remark = ngnUser.getRemark();
String school = ngnUser.getSchool();
String company = ngnUser.getCompany();
String occupation = ngnUser.getOccupation();
String industry = ngnUser.getIndustry();
int userPoint = ngnUser.getUserPoint();
java.util.Date lastLogonDate = ngnUser.getLastLogonDate();
java.util.Date createDate = ngnUser.getCreateDate();
java.util.Date modifyDate = ngnUser.getModifyDate();
int status = ngnUser.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyNgnUser",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

	
	$("#userType").formValidator({
		empty : true,
		onShow : "请输入用户类型，0VIP用户，1普通用户",
		onFocus : "用户类型，0VIP用户，1普通用户至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "用户类型，0VIP用户，1普通用户两边不能有空符号"
		},
		onError : "你输入的用户类型，0VIP用户，1普通用户不正确,请确认!"
	});
	
	$("#username").formValidator({
		empty : true,
		onShow : "请输入用户名",
		onFocus : "用户名至少3个字符",
		onCorrect:"输入正确"
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
		onFocus : "密码至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "密码两边不能有空符号"
		},
		onError : "你输入的密码不正确,请确认!"
	});
	
	$("#mobile").formValidator({
		empty : true,
		onShow : "请输入手机号码",
		onFocus : "手机号码至少3个字符",
		onCorrect:"输入正确"
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
		onCorrect:"输入正确"
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
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "昵称两边不能有空符号"
		},
		onError : "你输入的昵称不正确,请确认!"
	});
	
	$("#birthday").formValidator({
		empty : true,
		onShow : "请输入生日",
		onFocus : "生日至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "生日两边不能有空符号"
		},
		onError : "你输入的生日不正确,请确认!"
	});
	
	$("#age").formValidator({
		empty : true,
		onShow : "请输入年龄",
		onFocus : "年龄至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "年龄两边不能有空符号"
		},
		onError : "你输入的年龄不正确,请确认!"
	});
	
	$("#gender").formValidator({
		empty : true,
		onShow : "请输入性别(0女1男)",
		onFocus : "性别(0女1男)至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "性别(0女1男)两边不能有空符号"
		},
		onError : "你输入的性别(0女1男)不正确,请确认!"
	});
	
	$("#remark").formValidator({
		empty : true,
		onShow : "请输入备注",
		onFocus : "备注至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "备注两边不能有空符号"
		},
		onError : "你输入的备注不正确,请确认!"
	});
	
	$("#school").formValidator({
		empty : true,
		onShow : "请输入学校",
		onFocus : "学校至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "学校两边不能有空符号"
		},
		onError : "你输入的学校不正确,请确认!"
	});
	
	$("#company").formValidator({
		empty : true,
		onShow : "请输入公司",
		onFocus : "公司至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "公司两边不能有空符号"
		},
		onError : "你输入的公司不正确,请确认!"
	});
	
	$("#occupation").formValidator({
		empty : true,
		onShow : "请输入职业",
		onFocus : "职业至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "职业两边不能有空符号"
		},
		onError : "你输入的职业不正确,请确认!"
	});
	
	$("#industry").formValidator({
		empty : true,
		onShow : "请输入行业",
		onFocus : "行业至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "行业两边不能有空符号"
		},
		onError : "你输入的行业不正确,请确认!"
	});
	
	$("#userPoint").formValidator({
		empty : true,
		onShow : "请输入用户积分",
		onFocus : "用户积分至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "用户积分两边不能有空符号"
		},
		onError : "你输入的用户积分不正确,请确认!"
	});
	
	$("#lastLogonDate").formValidator({
		empty : true,
		onShow : "请输入上次登录时间",
		onFocus : "上次登录时间至少3个字符",
		onCorrect:"输入正确"
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
		onCorrect:"输入正确"
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
		onCorrect:"输入正确"
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
<form id="modifyNgnUser" name="modifyNgnUser" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">用户类型，0VIP用户，1普通用户:</th>
      <td align="left">
         <input type="text" id="userType" name="userType" size="24" class="input_001" value="<%=userType%>"/>
         <span id="userTypeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">用户名:</th>
      <td align="left">
         <input type="text" id="username" name="username" size="24" class="input_001" value="<%=username%>"/>
         <span id="usernameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">密码:</th>
      <td align="left">
         <input type="text" id="passwd" name="passwd" size="24" class="input_001" value="<%=passwd%>"/>
         <span id="passwdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">手机号码:</th>
      <td align="left">
         <input type="text" id="mobile" name="mobile" size="24" class="input_001" value="<%=mobile%>"/>
         <span id="mobileTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">Email地址:</th>
      <td align="left">
         <input type="text" id="email" name="email" size="24" class="input_001" value="<%=email%>"/>
         <span id="emailTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">昵称:</th>
      <td align="left">
         <input type="text" id="aliasName" name="aliasName" size="24" class="input_001" value="<%=aliasName%>"/>
         <span id="aliasNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">生日:</th>
      <td align="left">
         <input type="text" id="birthday" name="birthday" size="24" class="input_001" value="<%=birthday==null?"-":sdfDetail.format(birthday)%>"/>
         <span id="birthdayTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">年龄:</th>
      <td align="left">
         <input type="text" id="age" name="age" size="24" class="input_001" value="<%=age%>"/>
         <span id="ageTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">性别(0女1男):</th>
      <td align="left">
         <input type="text" id="gender" name="gender" size="24" class="input_001" value="<%=gender%>"/>
         <span id="genderTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">备注:</th>
      <td align="left">
         <input type="text" id="remark" name="remark" size="24" class="input_001" value="<%=remark%>"/>
         <span id="remarkTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">学校:</th>
      <td align="left">
         <input type="text" id="school" name="school" size="24" class="input_001" value="<%=school%>"/>
         <span id="schoolTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">公司:</th>
      <td align="left">
         <input type="text" id="company" name="company" size="24" class="input_001" value="<%=company%>"/>
         <span id="companyTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">职业:</th>
      <td align="left">
         <input type="text" id="occupation" name="occupation" size="24" class="input_001" value="<%=occupation%>"/>
         <span id="occupationTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">行业:</th>
      <td align="left">
         <input type="text" id="industry" name="industry" size="24" class="input_001" value="<%=industry%>"/>
         <span id="industryTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">用户积分:</th>
      <td align="left">
         <input type="text" id="userPoint" name="userPoint" size="24" class="input_001" value="<%=userPoint%>"/>
         <span id="userPointTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">上次登录时间:</th>
      <td align="left">
         <input type="text" id="lastLogonDate" name="lastLogonDate" size="24" class="input_001" value="<%=lastLogonDate==null?"-":sdfDetail.format(lastLogonDate)%>"/>
         <span id="lastLogonDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">创建时间:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value="<%=createDate==null?"-":sdfDetail.format(createDate)%>"/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">修改时间:</th>
      <td align="left">
         <input type="text" id="modifyDate" name="modifyDate" size="24" class="input_001" value="<%=modifyDate==null?"-":sdfDetail.format(modifyDate)%>"/>
         <span id="modifyDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">状态:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value="<%=status%>"/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyNgnUser'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
