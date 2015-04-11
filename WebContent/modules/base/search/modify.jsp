
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "修改聚合搜索项";
%>
<%@include file="/include/header.jsp"%>
<%
	//获取参数
	long id = box.getLongParam("id");
	NgnSearch ngnSearch = (NgnSearch) dao.load(NgnSearch.class, id);
	long userId = ngnSearch.getUserId();
	String sname = ngnSearch.getSname();
	String searchurl = ngnSearch.getSearchurl();
	int status = ngnSearch.getStatus();
%>

<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "modifyNgnSearch",
			debug : false,
			submitOnce : true,
			onError : function(msg, obj, errorlist) {
				alert(msg);
				return false;
			}
		});

		$("#userId").formValidator({
			empty : true,
			onShow : "请输入用户ID",
			onFocus : "用户ID至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "用户ID两边不能有空符号"
			},
			onError : "你输入的用户ID不正确,请确认!"
		});

		$("#sname").formValidator({
			empty : true,
			onShow : "请输入名称",
			onFocus : "名称至少3个字符",
			onCorrect : "输入正确"
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
			onShow : "请输入搜索引擎地址",
			onFocus : "搜索引擎地址至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "搜索引擎地址两边不能有空符号"
			},
			onError : "你输入的搜索引擎地址不正确,请确认!"
		});

		$("#status").formValidator({
			empty : true,
			onShow : "请输入状态",
			onFocus : "状态至少3个字符",
			onCorrect : "输入正确"
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
	<table width="580" border="0" align="center" cellpadding="0" cellspacing="0" class="msc-table">
		<input type="hidden" id="userId" name="userId" size="24" class="input_001" value="<%=userId%>" />
		<input type="hidden" id="status" name="status" size="24" class="input_001" value="<%=status%>" />

		<tr>
			<th align="right" width="100px">名称:</th>
			<td align="left"><input type="text" id="sname" name="sname" size="24" class="input_001" value="<%=sname%>" /> <span id="nameTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100px">搜索引擎地址(关键字以{SKey}代替):</th>
			<td align="left"><textarea id="searchurl" name="searchurl" cols="30" rows="5" class="input_001"><%=searchurl%></textarea><span id="searchurlTip"></span></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="image" src="/images/button_xg.gif" style="cursor: pointer;" />&nbsp;&nbsp; <img src="/images/button_cz.gif" style="cursor: pointer;" onclick="javascript:document.forms['modifyNgnSearch'].reset();"></td>
		</tr>
	</table>
</form>
<%@include file="/include/footer.jsp"%>
