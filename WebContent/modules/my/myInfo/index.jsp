<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%
MscUser mu=dao.load(MscUser.class,MSC_USER.getId());
%>
<script language="javascript">
$(document).ready(function() {
	$.formValidator.initConfig({
		formID : "editUserFormId",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});
	$("#man").formValidator({
		onShow : "请输入新的联系人",
		onFocus : "联系人不能为空",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系人两边不能有空符号"
		},
		onError : "联系人不能为空,请确认!"
	});
	$("#tel").formValidator({
		onShow : "请输入新的电话",
		onFocus : "格式例如：0577-88888888",
		onCorrect : "输入正确"
	}).inputValidator({
		min : 1,
		onError : "电话不能为空!"
	}).regexValidator({regExp:"^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(\\d{7,8})(-(\\d{3,}))?$",onError:"你输入的电话格式不正确"});
	$("#mobile").formValidator({
		onShow : "请新输入新的手机",
		onFocus : "手机不能为空",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 11,
		max : 11,
		onError : "手机号码必须为11位，请确认!"
	}).regexValidator({regExp:"mobile",dataType: "enum",onError:"你输入的手机号码格式不正确"});
	$("#email").formValidator({
		onShow : "请输入新的emial",
		onFocus :"格式例如:admin@service.com",
		onCorrect:"输入正确"
	}).regexValidator({regExp:"email",dataType:"enum",onError:"你输入的邮箱格式不正确"});
	$("#policeId").formValidator({
		onShow : "请输入新的单位名称",
		onFocus : "使用单位不能为空",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "使用单位两边不能有空符号"
		},
		onError : "使用单位不能为空!"
	});
	$("#department").formValidator({
		onShow : "请输入新的使用部门",
		onFocus : "使用部门不能为空",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "使用部门两边不能有空符号"
		},
		onError : "使用部门不能为空!"
	});
	$("#address").formValidator({
		onShow : "请输入新地址",
		onFocus : "地址不能为空",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "地址两边不能有空符号"
		},
		onError : "地址不能为空!"
	});
	
	$("#udpTransfer").formValidator({
		onShow:"请选择",
		onFocus:"",
		onCorrect:"正确"
	});
	$("#udpIp").formValidator({
		onShow:"请输入新的IP地址",
		onFocus:"格式例如:192.168.1.1",
		onCorrect:"正确",
	}).inputValidator({
		min:7,
		max:15,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "IP地址两边不能有空符号"
		}
	}).regexValidator({
		regExp:"ip4",dataType:"enum",onError:"IP地址格式不正确,请确认!"
	});
	
	$("#udpPort").formValidator({
		onShow:"请输入要修改的端口号",
		onFocus:"端口号不得为空,为0～65535",
		onCorrect:"正确",
	}).inputValidator({
		min:0,
		max:65535,
		type:"number",
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "端口号两边不能有空符号"
		},
		onErrorMin:"你输入的值必须大于等于0",
		onError:"端口号输入错误，请确认!"
	});
});
</script>
<form action="doEditUser.jsp" method="post" name="editUserForm" id="editUserFormId">
	<header></header>
<table width="500" border="0" cellpadding="0" cellspacing="0" class="msc-table">
	<input type="hidden" name="userId" value="<%=mu.getId() %>"/>
	<tbody>
	<tr>
		<th width="120" align="right">用户名：</th>
		<td align="left"><%=mu.getUsername() %></td>
	</tr>
	<tr>
		<th width="120" align="right">别名：</th>
		<td align="left"><input name="man" id="man" value="<%=mu.getAliasName() %>" type="text" class="input_001" /><span id="manTip" style="padding-bottom: 10px;"></span></td>
	</tr>
	<tr>
		<th width="120" align="right">电话：</th>
		<td align="left"><input name="tel" id="tel" value="<%=mu.getTelephone() %>" type="text" class="input_001" /><span id="telTip" style="padding-bottom: 10px;"></span></td>
	</tr>
	<tr>
		<th width="120" align="right">手机：</th>
		<td align="left"><input name="mobile" id="mobile" value="<%=mu.getMobile() %>" type="text" class="input_001" /><span id="mobileTip" style="padding-bottom: 10px;"></span></td>
	</tr>
	<tr>
		<th width="120" align="right">Email：</th>
		<td align="left"><input name="email" id="email" value="<%=mu.getEmail() %>" type="text" class="input_001" /><span id="emailTip" style="padding-bottom: 10px;"></span></td>
	</tr>
	<tr>
		<th width="120" align="right">使用单位：</th>
		<td align="left"><input name="policeId" value="<%=mu.getOrgName()%>" id="policeId" type="text" class="input_001" /><span id="policeIdTip" style="padding-bottom: 10px;"></span></td>
	</tr>

	<tr>
		<th width="125" align="right">WEB最后登录时间：</th>
		<td align="left"><%=mu.getLastLogonDate()==null ? "尚未登录":sdfDetail.format(mu.getLastLogonDate()) %></td>
	</tr>
	<tr>
		<th width="120" align="right">最后登录IP：</th>
		<td align="left"><%=mu.getLastLogonIp() %></td>
	</tr>
	<tr>
		<th width="120" align="right">最后修改时间：</th>
		<td align="left"><%=sdfDetail.format(mu.getModifyDate()) %></td>
	</tr>
	<tr>
		<td></td>
		<td height="30" align="left"><input type="image" src="<%=request.getContextPath() %>/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
		<img src="/images/button_fh.gif" style="cursor: pointer;" onclick="javascript:window.top.location='/workspace/'">
		</td>
	</tr>
	</tbody>
</table>
</form>
<div id="grpPerm" style="display:none;">
<span id="grpPermSpan"></span>
<span id="grpPermResContent"></span>
</div>
<div id="indiPerm" style="display:none;">
<span id="indiPermSpan"></span>
<span id="indiPermResContent"></span>
</div>
<script type="text/javascript">
<!--
$("#grpPermId").hover(function(){
	$(this).css("color","red");
	var isDisplay=$("#grpPerm").css("display");
	if(isDisplay=="none"){
		$.ajax({
			type:"get",
			data:"userId="+$("input[name='userId']").val(),
			url:"doAjaxGroupPerm.jsp",
			dataType:"html",
			success:function(msg){
				//var value=eval("("+msg+")");
				$("#grpPermSpan").css({"position":"absolute","left":"-16px","height":"30px","width":"100%","background":"url('/images/arr_ico.gif') no-repeat"});
				$("#grpPermResContent").append(msg);
				//alert(msg);
				},
			error:function(){alert("服务器未返回数据！");}
		});
		var width=$("#address").width();
		var height=$("#address").height();
		var offset=$(this).offset();
		var left=$("#address").offset().left;
		var top=offset.top;
		$("#grpPerm").css({"display":"block","position":"absolute","left":left+width+"px","top":top-height+"px","border":"1px solid #999","height":"auto", "width":"auto","padding":"18px 18px","line-height":"20px","background":"#FFFFFF"});
	}else{
		$(this).css("color","");
		$("#grpPerm").css("display","none");
		$("#grpPermResContent").empty();
	}
});
$("#individualPermId").hover(function(){
	$(this).css("color","red");
	var isDisplay=$("#indiPerm").css("display");
	if(isDisplay=="none"){
		$.ajax({
			type:"get",
			data:"userId="+$("input[name='userId']").val(),
			url:"doAjaxIndividualPerm.jsp",
			dataType:"html",
			success:function(msg){
				//var value=eval("("+msg+")");
				$("#indiPermSpan").css({"position":"absolute","left":"-16px","height":"30px","width":"100%","background":"url('/images/arr_ico.gif') no-repeat"});
				$("#indiPermResContent").append(msg);
				//alert(msg);
				},
			error:function(){alert("服务器未返回数据！");}
		});
		var width=$("#address").width();
		var height=$("#address").height();
		var offset=$(this).offset();
		var left=$("#address").offset().left;
		var top=offset.top;
		$("#indiPerm").css({"display":"block","position":"absolute","left":left+width+"px","top":top-height+"px","border":"1px solid #999","height":"auto", "width":"auto","padding":"18px 18px","line-height":"20px","background":"#FFFFFF"});
	}else{
		$(this).css("color","");
		$("#indiPerm").css("display","none");
		$("#indiPermResContent").empty();
	}
});
//-->
</script>
<%@include file="/include/footer.jsp"%>