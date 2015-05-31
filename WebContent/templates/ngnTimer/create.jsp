
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增NgnTimer"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createNgnTimer",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#name").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#timertype").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#timer").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#timerurl").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#p1").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#p2").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#p3").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#createtime").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});
$("#status").formValidator({
		empty : true,
		onShow : "请输入",
		onFocus : "至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "两边不能有空符号"
		},
		onError : "你输入的不正确,请确认!"
	});

});

</script>

<form id="createNgnTimer" name="createNgnTimer" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="name" name="name" size="24" class="input_001" value=""/>
         <span id="nameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="timertype" name="timertype" size="24" class="input_001" value=""/>
         <span id="timertypeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="timer" name="timer" size="24" class="input_001" value=""/>
         <span id="timerTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="timerurl" name="timerurl" size="24" class="input_001" value=""/>
         <span id="timerurlTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="p1" name="p1" size="24" class="input_001" value=""/>
         <span id="p1Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="p2" name="p2" size="24" class="input_001" value=""/>
         <span id="p2Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="p3" name="p3" size="24" class="input_001" value=""/>
         <span id="p3Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="createtime" name="createtime" size="24" class="input_001" value=""/>
         <span id="createtimeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value=""/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createNgnTimer'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
