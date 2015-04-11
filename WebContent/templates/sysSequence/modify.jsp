
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改SysSequence"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
SysSequence sysSequence = (SysSequence)dao.load(SysSequence.class,table_name);
long sequenceId = sysSequence.getSequenceId();
String tableDesc = sysSequence.getTableDesc();
int incrementNum = sysSequence.getIncrementNum();
java.util.Date createDate = sysSequence.getCreateDate();
java.util.Date lastUpdate = sysSequence.getLastUpdate();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifySysSequence",
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
<form id="modifySysSequence" name="modifySysSequence" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="sequenceId" name="sequenceId" size="24" class="input_001" value="<%=sequenceId%>"/>
         <span id="sequenceIdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="tableDesc" name="tableDesc" size="24" class="input_001" value="<%=tableDesc%>"/>
         <span id="tableDescTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="incrementNum" name="incrementNum" size="24" class="input_001" value="<%=incrementNum%>"/>
         <span id="incrementNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value="<%=createDate==null?"-":sdfDetail.format(createDate)%>"/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="lastUpdate" name="lastUpdate" size="24" class="input_001" value="<%=lastUpdate==null?"-":sdfDetail.format(lastUpdate)%>"/>
         <span id="lastUpdateTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifySysSequence'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
