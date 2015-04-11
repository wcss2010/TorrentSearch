
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增SysConfig"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createSysConfig",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#catName").formValidator({
		empty : true,
		onShow : "请输入分类名",
		onFocus : "分类名至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "分类名两边不能有空符号"
		},
		onError : "你输入的分类名不正确,请确认!"
	});
$("#propName").formValidator({
		empty : true,
		onShow : "请输入属性名",
		onFocus : "属性名至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "属性名两边不能有空符号"
		},
		onError : "你输入的属性名不正确,请确认!"
	});
$("#propValue").formValidator({
		empty : true,
		onShow : "请输入属性数值",
		onFocus : "属性数值至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "属性数值两边不能有空符号"
		},
		onError : "你输入的属性数值不正确,请确认!"
	});
$("#propComment").formValidator({
		empty : true,
		onShow : "请输入属性备注",
		onFocus : "属性备注至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "属性备注两边不能有空符号"
		},
		onError : "你输入的属性备注不正确,请确认!"
	});
$("#inputComment").formValidator({
		empty : true,
		onShow : "请输入输入说明",
		onFocus : "输入说明至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "输入说明两边不能有空符号"
		},
		onError : "你输入的输入说明不正确,请确认!"
	});
$("#displayOrder").formValidator({
		empty : true,
		onShow : "请输入显示排序",
		onFocus : "显示排序至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "显示排序两边不能有空符号"
		},
		onError : "你输入的显示排序不正确,请确认!"
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
		onShow : "请输入状态。1为正常，-1为标记删除",
		onFocus : "状态。1为正常，-1为标记删除至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "状态。1为正常，-1为标记删除两边不能有空符号"
		},
		onError : "你输入的状态。1为正常，-1为标记删除不正确,请确认!"
	});

});

</script>

<form id="createSysConfig" name="createSysConfig" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">分类名:</th>
      <td align="left">
         <input type="text" id="catName" name="catName" size="24" class="input_001" value=""/>
         <span id="catNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">属性名:</th>
      <td align="left">
         <input type="text" id="propName" name="propName" size="24" class="input_001" value=""/>
         <span id="propNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">属性数值:</th>
      <td align="left">
         <input type="text" id="propValue" name="propValue" size="24" class="input_001" value=""/>
         <span id="propValueTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">属性备注:</th>
      <td align="left">
         <input type="text" id="propComment" name="propComment" size="24" class="input_001" value=""/>
         <span id="propCommentTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">输入说明:</th>
      <td align="left">
         <input type="text" id="inputComment" name="inputComment" size="24" class="input_001" value=""/>
         <span id="inputCommentTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">显示排序:</th>
      <td align="left">
         <input type="text" id="displayOrder" name="displayOrder" size="24" class="input_001" value=""/>
         <span id="displayOrderTip"></span>
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
    <tr><th align="right" width="100">状态。1为正常，-1为标记删除:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value=""/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createSysConfig'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
