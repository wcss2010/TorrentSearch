
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增SysActionLog"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createSysActionLog",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#userId").formValidator({
		empty : true,
		onShow : "请输入操作的用户",
		onFocus : "操作的用户至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的用户两边不能有空符号"
		},
		onError : "你输入的操作的用户不正确,请确认!"
	});
$("#actionType").formValidator({
		empty : true,
		onShow : "请输入操作类型。1.访问日志 2.操作日志",
		onFocus : "操作类型。1.访问日志 2.操作日志至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作类型。1.访问日志 2.操作日志两边不能有空符号"
		},
		onError : "你输入的操作类型。1.访问日志 2.操作日志不正确,请确认!"
	});
$("#actionModule").formValidator({
		empty : true,
		onShow : "请输入操作的模块",
		onFocus : "操作的模块至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的模块两边不能有空符号"
		},
		onError : "你输入的操作的模块不正确,请确认!"
	});
$("#actionCommand").formValidator({
		empty : true,
		onShow : "请输入操作的指令",
		onFocus : "操作的指令至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的指令两边不能有空符号"
		},
		onError : "你输入的操作的指令不正确,请确认!"
	});
$("#actionBody").formValidator({
		empty : true,
		onShow : "请输入操作的内容",
		onFocus : "操作的内容至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的内容两边不能有空符号"
		},
		onError : "你输入的操作的内容不正确,请确认!"
	});
$("#actionIp").formValidator({
		empty : true,
		onShow : "请输入操作的IP",
		onFocus : "操作的IP至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的IP两边不能有空符号"
		},
		onError : "你输入的操作的IP不正确,请确认!"
	});
$("#actionDate").formValidator({
		empty : true,
		onShow : "请输入操作的日期",
		onFocus : "操作的日期至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "操作的日期两边不能有空符号"
		},
		onError : "你输入的操作的日期不正确,请确认!"
	});

});

</script>

<form id="createSysActionLog" name="createSysActionLog" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">操作的用户:</th>
      <td align="left">
         <input type="text" id="userId" name="userId" size="24" class="input_001" value=""/>
         <span id="userIdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作类型。1.访问日志 2.操作日志:</th>
      <td align="left">
         <input type="text" id="actionType" name="actionType" size="24" class="input_001" value=""/>
         <span id="actionTypeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作的模块:</th>
      <td align="left">
         <input type="text" id="actionModule" name="actionModule" size="24" class="input_001" value=""/>
         <span id="actionModuleTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作的指令:</th>
      <td align="left">
         <input type="text" id="actionCommand" name="actionCommand" size="24" class="input_001" value=""/>
         <span id="actionCommandTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作的内容:</th>
      <td align="left">
         <input type="text" id="actionBody" name="actionBody" size="24" class="input_001" value=""/>
         <span id="actionBodyTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作的IP:</th>
      <td align="left">
         <input type="text" id="actionIp" name="actionIp" size="24" class="input_001" value=""/>
         <span id="actionIpTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">操作的日期:</th>
      <td align="left">
         <input type="text" id="actionDate" name="actionDate" size="24" class="input_001" value=""/>
         <span id="actionDateTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createSysActionLog'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
