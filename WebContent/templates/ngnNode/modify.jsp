
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改NgnNode"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
NgnNode ngnNode = (NgnNode)dao.load(NgnNode.class,id);
String nodeName = ngnNode.getNodeName();
String nodePass = ngnNode.getNodePass();
int nodeType = ngnNode.getNodeType();
String aliasName = ngnNode.getAliasName();
long orgId = ngnNode.getOrgId();
java.util.Date lastLogonDate = ngnNode.getLastLogonDate();
java.util.Date createDate = ngnNode.getCreateDate();
java.util.Date modifyDate = ngnNode.getModifyDate();
int status = ngnNode.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyNgnNode",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

	
	$("#nodeName").formValidator({
		empty : true,
		onShow : "请输入节点名称",
		onFocus : "节点名称至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "节点名称两边不能有空符号"
		},
		onError : "你输入的节点名称不正确,请确认!"
	});
	
	$("#nodePass").formValidator({
		empty : true,
		onShow : "请输入节点密码",
		onFocus : "节点密码至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "节点密码两边不能有空符号"
		},
		onError : "你输入的节点密码不正确,请确认!"
	});
	
	$("#nodeType").formValidator({
		empty : true,
		onShow : "请输入节点类型，0公共节点，1私有节点",
		onFocus : "节点类型，0公共节点，1私有节点至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "节点类型，0公共节点，1私有节点两边不能有空符号"
		},
		onError : "你输入的节点类型，0公共节点，1私有节点不正确,请确认!"
	});
	
	$("#aliasName").formValidator({
		empty : true,
		onShow : "请输入别名",
		onFocus : "别名至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "别名两边不能有空符号"
		},
		onError : "你输入的别名不正确,请确认!"
	});
	
	$("#orgId").formValidator({
		empty : true,
		onShow : "请输入归属机构",
		onFocus : "归属机构至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "归属机构两边不能有空符号"
		},
		onError : "你输入的归属机构不正确,请确认!"
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
<form id="modifyNgnNode" name="modifyNgnNode" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">节点名称:</th>
      <td align="left">
         <input type="text" id="nodeName" name="nodeName" size="24" class="input_001" value="<%=nodeName%>"/>
         <span id="nodeNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">节点密码:</th>
      <td align="left">
         <input type="text" id="nodePass" name="nodePass" size="24" class="input_001" value="<%=nodePass%>"/>
         <span id="nodePassTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">节点类型，0公共节点，1私有节点:</th>
      <td align="left">
         <input type="text" id="nodeType" name="nodeType" size="24" class="input_001" value="<%=nodeType%>"/>
         <span id="nodeTypeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">别名:</th>
      <td align="left">
         <input type="text" id="aliasName" name="aliasName" size="24" class="input_001" value="<%=aliasName%>"/>
         <span id="aliasNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">归属机构:</th>
      <td align="left">
         <input type="text" id="orgId" name="orgId" size="24" class="input_001" value="<%=orgId%>"/>
         <span id="orgIdTip"></span>
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
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyNgnNode'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
