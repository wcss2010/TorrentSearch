
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改NgnSay"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
NgnSay ngnSay = (NgnSay)dao.load(NgnSay.class,id);
String usersay = ngnSay.getUsersay();
String syscmd = ngnSay.getSyscmd();
String cmdcontent = ngnSay.getCmdcontent();
String cmdp1 = ngnSay.getCmdp1();
String cmdp2 = ngnSay.getCmdp2();
String cmdp3 = ngnSay.getCmdp3();
String cmdp4 = ngnSay.getCmdp4();
String cmdp5 = ngnSay.getCmdp5();
java.util.Date createtime = ngnSay.getCreatetime();
int status = ngnSay.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyNgnSay",
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
<form id="modifyNgnSay" name="modifyNgnSay" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="usersay" name="usersay" size="24" class="input_001" value="<%=usersay%>"/>
         <span id="usersayTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="syscmd" name="syscmd" size="24" class="input_001" value="<%=syscmd%>"/>
         <span id="syscmdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdcontent" name="cmdcontent" size="24" class="input_001" value="<%=cmdcontent%>"/>
         <span id="cmdcontentTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdp1" name="cmdp1" size="24" class="input_001" value="<%=cmdp1%>"/>
         <span id="cmdp1Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdp2" name="cmdp2" size="24" class="input_001" value="<%=cmdp2%>"/>
         <span id="cmdp2Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdp3" name="cmdp3" size="24" class="input_001" value="<%=cmdp3%>"/>
         <span id="cmdp3Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdp4" name="cmdp4" size="24" class="input_001" value="<%=cmdp4%>"/>
         <span id="cmdp4Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="cmdp5" name="cmdp5" size="24" class="input_001" value="<%=cmdp5%>"/>
         <span id="cmdp5Tip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="createtime" name="createtime" size="24" class="input_001" value="<%=createtime==null?"-":sdfDetail.format(createtime)%>"/>
         <span id="createtimeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value="<%=status%>"/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyNgnSay'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
