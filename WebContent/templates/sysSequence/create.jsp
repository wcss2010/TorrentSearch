
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增SysSequence"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createSysSequence",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#sequenceId").formValidator({
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
$("#tableDesc").formValidator({
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
$("#incrementNum").formValidator({
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
$("#createDate").formValidator({
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
$("#lastUpdate").formValidator({
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

<form id="createSysSequence" name="createSysSequence" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="sequenceId" name="sequenceId" size="24" class="input_001" value=""/>
         <span id="sequenceIdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="tableDesc" name="tableDesc" size="24" class="input_001" value=""/>
         <span id="tableDescTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="incrementNum" name="incrementNum" size="24" class="input_001" value=""/>
         <span id="incrementNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value=""/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="lastUpdate" name="lastUpdate" size="24" class="input_001" value=""/>
         <span id="lastUpdateTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createSysSequence'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
