
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改NgnMsg"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
NgnMsg ngnMsg = (NgnMsg)dao.load(NgnMsg.class,id);
long userid = ngnMsg.getUserid();
long touserid = ngnMsg.getTouserid();
String msg = ngnMsg.getMsg();
java.util.Date senddate = ngnMsg.getSenddate();
int status = ngnMsg.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyNgnMsg",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

	
	$("#userid").formValidator({
		empty : true,
		onShow : "请输入发送者ID",
		onFocus : "发送者ID至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "发送者ID两边不能有空符号"
		},
		onError : "你输入的发送者ID不正确,请确认!"
	});
	
	$("#touserid").formValidator({
		empty : true,
		onShow : "请输入接收者ID",
		onFocus : "接收者ID至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "接收者ID两边不能有空符号"
		},
		onError : "你输入的接收者ID不正确,请确认!"
	});
	
	$("#msg").formValidator({
		empty : true,
		onShow : "请输入消息内容",
		onFocus : "消息内容至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "消息内容两边不能有空符号"
		},
		onError : "你输入的消息内容不正确,请确认!"
	});
	
	$("#senddate").formValidator({
		empty : true,
		onShow : "请输入发送日期",
		onFocus : "发送日期至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "发送日期两边不能有空符号"
		},
		onError : "你输入的发送日期不正确,请确认!"
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
<form id="modifyNgnMsg" name="modifyNgnMsg" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">发送者ID:</th>
      <td align="left">
         <input type="text" id="userid" name="userid" size="24" class="input_001" value="<%=userid%>"/>
         <span id="useridTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">接收者ID:</th>
      <td align="left">
         <input type="text" id="touserid" name="touserid" size="24" class="input_001" value="<%=touserid%>"/>
         <span id="touseridTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">消息内容:</th>
      <td align="left">
         <input type="text" id="msg" name="msg" size="24" class="input_001" value="<%=msg%>"/>
         <span id="msgTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">发送日期:</th>
      <td align="left">
         <input type="text" id="senddate" name="senddate" size="24" class="input_001" value="<%=senddate==null?"-":sdfDetail.format(senddate)%>"/>
         <span id="senddateTip"></span>
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
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyNgnMsg'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
