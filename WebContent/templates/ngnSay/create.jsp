
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增NgnSay"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createNgnSay",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#usersay").formValidator({
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
$("#syscmd").formValidator({
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
$("#cmdcontent").formValidator({
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
$("#cmdp1").formValidator({
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
$("#cmdp2").formValidator({
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
$("#cmdp3").formValidator({
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
$("#cmdp4").formValidator({
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
$("#cmdp5").formValidator({
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

<form id="createNgnSay" name="createNgnSay" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="usersay" name="usersay" size="24" class="input_001" value=""/>
         <span id="usersayTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="syscmd" name="syscmd" size="24" class="input_001" value=""/>
         <span id="syscmdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdcontent" name="cmdcontent" size="24" class="input_001" value=""/>
         <span id="cmdcontentTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdp1" name="cmdp1" size="24" class="input_001" value=""/>
         <span id="cmdp1Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdp2" name="cmdp2" size="24" class="input_001" value=""/>
         <span id="cmdp2Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdp3" name="cmdp3" size="24" class="input_001" value=""/>
         <span id="cmdp3Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdp4" name="cmdp4" size="24" class="input_001" value=""/>
         <span id="cmdp4Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">:</th>
      <td align="left">
         <input type="text" id="cmdp5" name="cmdp5" size="24" class="input_001" value=""/>
         <span id="cmdp5Tip"></span>
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
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createNgnSay'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
