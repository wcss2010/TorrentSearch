
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%PAGE_TITLE="修改NgnSearch"; %>
<%@include file="/include/header.jsp"%>
<%
//获取参数
long id = box.getLongParam("id");
NgnSearch ngnSearch = (NgnSearch)dao.load(NgnSearch.class,id);
long userId = ngnSearch.getUserId();
String name = ngnSearch.getName();
String searchurl = ngnSearch.getSearchurl();
int status = ngnSearch.getStatus();

%>

<script type="text/javascript">
$(document).ready(function(){
	$.formValidator.initConfig({
		formID : "modifyNgnSearch",
		debug:false,
		submitOnce:true,
		onError : function(msg,obj,errorlist) {
			alert(msg);
			return false;
		}
	});

	
	$("#userId").formValidator({
		empty : true,
		onShow : "请输入用户ID",
		onFocus : "用户ID至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "用户ID两边不能有空符号"
		},
		onError : "你输入的用户ID不正确,请确认!"
	});
	
	$("#name").formValidator({
		empty : true,
		onShow : "请输入名称",
		onFocus : "名称至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "名称两边不能有空符号"
		},
		onError : "你输入的名称不正确,请确认!"
	});
	
	$("#searchurl").formValidator({
		empty : true,
		onShow : "请输入搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符",
		onFocus : "搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符至少3个字符",
		onCorrect:"输入正确"
	}).inputValidator({
		min : 1,
		empty : {
			leftEmpty : false,
			rightEmpty : false,
			emptyError : "搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符两边不能有空符号"
		},
		onError : "你输入的搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符不正确,请确认!"
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
<form id="modifyNgnSearch" name="modifyNgnSearch" method="post" action="doModify.jsp">
<input type="hidden" name="id" value="<%=id%>" />
<table width="580" border="0"  align="center" cellpadding="0" cellspacing="0" class="msc-table">
    <tr><th align="right" width="100px">用户ID:</th>
      <td align="left">
         <input type="text" id="userId" name="userId" size="24" class="input_001" value="<%=userId%>"/>
         <span id="userIdTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">名称:</th>
      <td align="left">
         <input type="text" id="name" name="name" size="24" class="input_001" value="<%=name%>"/>
         <span id="nameTip"></span>
      </td>
     </tr>
    <tr><th align="right" width="100px">搜索引擎URL关键字部分以{key}为占位符,如果是需要中文转译的关键字则是用{ekey}为占位符:</th>
      <td align="left">
         <input type="text" id="searchurl" name="searchurl" size="24" class="input_001" value="<%=searchurl%>"/>
         <span id="searchurlTip"></span>
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
			<img src="/images/button_cz.gif" style="cursor: pointer;"	onclick="javascript:document.forms['modifyNgnSearch'].reset();"> 
			</td>
		</tr>
</table>
</form>
<%@include file="/include/footer.jsp"%>
