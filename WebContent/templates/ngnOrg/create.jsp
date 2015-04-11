
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="新增NgnOrg"; %>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "createNgnOrg",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

$("#orgName").formValidator({
		empty : true,
		onShow : "请输入机构名称",
		onFocus : "机构名称至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "机构名称两边不能有空符号"
		},
		onError : "你输入的机构名称不正确,请确认!"
	});
$("#orgDesc").formValidator({
		empty : true,
		onShow : "请输入机构描述",
		onFocus : "机构描述至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "机构描述两边不能有空符号"
		},
		onError : "你输入的机构描述不正确,请确认!"
	});
$("#linkMan").formValidator({
		empty : true,
		onShow : "请输入联系人",
		onFocus : "联系人至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系人两边不能有空符号"
		},
		onError : "你输入的联系人不正确,请确认!"
	});
$("#telephone").formValidator({
		empty : true,
		onShow : "请输入联系电话",
		onFocus : "联系电话至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系电话两边不能有空符号"
		},
		onError : "你输入的联系电话不正确,请确认!"
	});
$("#mobile").formValidator({
		empty : true,
		onShow : "请输入联系手机",
		onFocus : "联系手机至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系手机两边不能有空符号"
		},
		onError : "你输入的联系手机不正确,请确认!"
	});
$("#address").formValidator({
		empty : true,
		onShow : "请输入联系地址",
		onFocus : "联系地址至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "联系地址两边不能有空符号"
		},
		onError : "你输入的联系地址不正确,请确认!"
	});
$("#zipcode").formValidator({
		empty : true,
		onShow : "请输入邮政编码",
		onFocus : "邮政编码至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "邮政编码两边不能有空符号"
		},
		onError : "你输入的邮政编码不正确,请确认!"
	});
$("#email").formValidator({
		empty : true,
		onShow : "请输入Email",
		onFocus : "Email至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "Email两边不能有空符号"
		},
		onError : "你输入的Email不正确,请确认!"
	});
$("#licenseNodeNum").formValidator({
		empty : true,
		onShow : "请输入授权节点数",
		onFocus : "授权节点数至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "授权节点数两边不能有空符号"
		},
		onError : "你输入的授权节点数不正确,请确认!"
	});
$("#licenseAdminNum").formValidator({
		empty : true,
		onShow : "请输入授权管理员数量",
		onFocus : "授权管理员数量至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "授权管理员数量两边不能有空符号"
		},
		onError : "你输入的授权管理员数量不正确,请确认!"
	});
$("#licenseUserNum").formValidator({
		empty : true,
		onShow : "请输入授权用户数量",
		onFocus : "授权用户数量至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "授权用户数量两边不能有空符号"
		},
		onError : "你输入的授权用户数量不正确,请确认!"
	});
$("#licenseExpiredDate").formValidator({
		empty : true,
		onShow : "请输入授权过期时间",
		onFocus : "授权过期时间至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "授权过期时间两边不能有空符号"
		},
		onError : "你输入的授权过期时间不正确,请确认!"
	});
$("#createDate").formValidator({
		empty : true,
		onShow : "请输入创建日期",
		onFocus : "创建日期至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "创建日期两边不能有空符号"
		},
		onError : "你输入的创建日期不正确,请确认!"
	});
$("#modifyDate").formValidator({
		empty : true,
		onShow : "请输入修改日期",
		onFocus : "修改日期至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "修改日期两边不能有空符号"
		},
		onError : "你输入的修改日期不正确,请确认!"
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

<form id="createNgnOrg" name="createNgnOrg" method="post" action="doCreate.jsp">
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100">机构名称:</th>
      <td align="left">
         <input type="text" id="orgName" name="orgName" size="24" class="input_001" value=""/>
         <span id="orgNameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">机构描述:</th>
      <td align="left">
         <input type="text" id="orgDesc" name="orgDesc" size="24" class="input_001" value=""/>
         <span id="orgDescTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">联系人:</th>
      <td align="left">
         <input type="text" id="linkMan" name="linkMan" size="24" class="input_001" value=""/>
         <span id="linkManTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">联系电话:</th>
      <td align="left">
         <input type="text" id="telephone" name="telephone" size="24" class="input_001" value=""/>
         <span id="telephoneTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">联系手机:</th>
      <td align="left">
         <input type="text" id="mobile" name="mobile" size="24" class="input_001" value=""/>
         <span id="mobileTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">联系地址:</th>
      <td align="left">
         <input type="text" id="address" name="address" size="24" class="input_001" value=""/>
         <span id="addressTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">邮政编码:</th>
      <td align="left">
         <input type="text" id="zipcode" name="zipcode" size="24" class="input_001" value=""/>
         <span id="zipcodeTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">Email:</th>
      <td align="left">
         <input type="text" id="email" name="email" size="24" class="input_001" value=""/>
         <span id="emailTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">授权节点数:</th>
      <td align="left">
         <input type="text" id="licenseNodeNum" name="licenseNodeNum" size="24" class="input_001" value=""/>
         <span id="licenseNodeNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">授权管理员数量:</th>
      <td align="left">
         <input type="text" id="licenseAdminNum" name="licenseAdminNum" size="24" class="input_001" value=""/>
         <span id="licenseAdminNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">授权用户数量:</th>
      <td align="left">
         <input type="text" id="licenseUserNum" name="licenseUserNum" size="24" class="input_001" value=""/>
         <span id="licenseUserNumTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">授权过期时间:</th>
      <td align="left">
         <input type="text" id="licenseExpiredDate" name="licenseExpiredDate" size="24" class="input_001" value=""/>
         <span id="licenseExpiredDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">创建日期:</th>
      <td align="left">
         <input type="text" id="createDate" name="createDate" size="24" class="input_001" value=""/>
         <span id="createDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">修改日期:</th>
      <td align="left">
         <input type="text" id="modifyDate" name="modifyDate" size="24" class="input_001" value=""/>
         <span id="modifyDateTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100">状态:</th>
      <td align="left">
         <input type="text" id="status" name="status" size="24" class="input_001" value=""/>
         <span id="statusTip"></span>
      </td>
     </tr>
    
    <tr>
			<td colspan="2" align="center">
			<input type="image" src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp; 
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['createNgnOrg'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
