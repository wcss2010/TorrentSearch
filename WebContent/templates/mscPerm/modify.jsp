
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改MscPerm"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
MscPerm mscPerm = (MscPerm)dao.load(MscPerm.class,id);
long parentId = mscPerm.getParentId();
int permType = mscPerm.getPermType();
String permName = mscPerm.getPermName();
String permDesc = mscPerm.getPermDesc();
int childNum = mscPerm.getChildNum();
String actionUrl = mscPerm.getActionUrl();
int menuLayer = mscPerm.getMenuLayer();
String menuPath = mscPerm.getMenuPath();
java.util.Date createDate = mscPerm.getCreateDate();
java.util.Date modifyDate = mscPerm.getModifyDate();
int status = mscPerm.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyMscPerm",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

	
	$("#parentId").formValidator({
		empty : true,
		onShow : "请输入菜单所属的上级ID",
		onFocus : "菜单所属的上级ID至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "菜单所属的上级ID两边不能有空符号"
		},
		onError : "你输入的菜单所属的上级ID不正确,请确认!"
	});
	
	$("#permType").formValidator({
		empty : true,
		onShow : "请输入0.是菜单项，1是api",
		onFocus : "0.是菜单项，1是api至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "0.是菜单项，1是api两边不能有空符号"
		},
		onError : "你输入的0.是菜单项，1是api不正确,请确认!"
	});
	
	$("#permName").formValidator({
		empty : true,
		onShow : "请输入权限的名称",
		onFocus : "权限的名称至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "权限的名称两边不能有空符号"
		},
		onError : "你输入的权限的名称不正确,请确认!"
	});
	
	$("#permDesc").formValidator({
		empty : true,
		onShow : "请输入权限的描述",
		onFocus : "权限的描述至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "权限的描述两边不能有空符号"
		},
		onError : "你输入的权限的描述不正确,请确认!"
	});
	
	$("#childNum").formValidator({
		empty : true,
		onShow : "请输入拥有子元素的个数",
		onFocus : "拥有子元素的个数至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "拥有子元素的个数两边不能有空符号"
		},
		onError : "你输入的拥有子元素的个数不正确,请确认!"
	});
	
	$("#actionUrl").formValidator({
		empty : true,
		onShow : "请输入权限执行的url目录",
		onFocus : "权限执行的url目录至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "权限执行的url目录两边不能有空符号"
		},
		onError : "你输入的权限执行的url目录不正确,请确认!"
	});
	
	$("#menuLayer").formValidator({
		empty : true,
		onShow : "请输入单位目录层次深度",
		onFocus : "单位目录层次深度至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "单位目录层次深度两边不能有空符号"
		},
		onError : "你输入的单位目录层次深度不正确,请确认!"
	});
	
	$("#menuPath").formValidator({
		empty : true,
		onShow : "请输入单位层次路径",
		onFocus : "单位层次路径至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "单位层次路径两边不能有空符号"
		},
		onError : "你输入的单位层次路径不正确,请确认!"
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
		onShow : "请输入最后一次的修改时间",
		onFocus : "最后一次的修改时间至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "最后一次的修改时间两边不能有空符号"
		},
		onError : "你输入的最后一次的修改时间不正确,请确认!"
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
<form id="modifyMscPerm" name="modifyMscPerm" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">菜单所属的上级ID:</th>
      <td align="left">
         <input type="text" id="parentId" name="parentId" size="24" class="input_001" value="<%=parentId%>"/>
         <span id="parentIdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">0.是菜单项，1是api:</th>
      <td align="left">
         <input type="text" id="permType" name="permType" size="24" class="input_001" value="<%=permType%>"/>
         <span id="permTypeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">权限的名称:</th>
      <td align="left">
         <input type="text" id="permName" name="permName" size="24" class="input_001" value="<%=permName%>"/>
         <span id="permNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">权限的描述:</th>
      <td align="left">
         <input type="text" id="permDesc" name="permDesc" size="24" class="input_001" value="<%=permDesc%>"/>
         <span id="permDescTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">拥有子元素的个数:</th>
      <td align="left">
         <input type="text" id="childNum" name="childNum" size="24" class="input_001" value="<%=childNum%>"/>
         <span id="childNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">权限执行的url目录:</th>
      <td align="left">
         <input type="text" id="actionUrl" name="actionUrl" size="24" class="input_001" value="<%=actionUrl%>"/>
         <span id="actionUrlTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">单位目录层次深度:</th>
      <td align="left">
         <input type="text" id="menuLayer" name="menuLayer" size="24" class="input_001" value="<%=menuLayer%>"/>
         <span id="menuLayerTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">单位层次路径:</th>
      <td align="left">
         <input type="text" id="menuPath" name="menuPath" size="24" class="input_001" value="<%=menuPath%>"/>
         <span id="menuPathTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">创建时间:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value="<%=createDate==null?"-":sdfDetail.format(createDate)%>"/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">最后一次的修改时间:</th>
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
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyMscPerm'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
