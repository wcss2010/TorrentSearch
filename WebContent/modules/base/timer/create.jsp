
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "添加定时任务";
%>
<%@include file="/include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formID : "createNgnTimer",
			debug : false,
			submitOnce : true,
			onError : function(msg, obj, errorlist) {
				alert(msg);
				return false;
			}
		});

		$("#name").formValidator({
			empty : true,
			onShow : "请输入任务名称",
			onFocus : "至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "两边不能有空符号"
			},
			onError : "你输入的不正确,请确认!"
		});
		$("#timer").formValidator({
			empty : true,
			onShow : "请输入任务时间",
			onFocus : "至少3个字符",
			onCorrect : "输入正确"
		}).inputValidator({
			min : 1,
			empty : {
				leftEmpty : false,
				rightEmpty : false,
				emptyError : "两边不能有空符号"
			},
			onError : "你输入的不正确,请确认!"
		});
		$("#timerurl").formValidator({
			empty : true,
			onShow : "请输入任务URL",
			onFocus : "至少3个字符",
			onCorrect : "输入正确"
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

<form id="createNgnTimer" name="createNgnTimer" method="post"
	action="doCreate.jsp">
	<table width="580" border="0" align="center" cellpadding="0"
		cellspacing="0" class="msc-table">
		<tr>
			<th align="right" width="100">任务名称:</th>
			<td align="left"><input type="text" id="name" name="name"
				size="24" class="input_001" value="" /> <span id="nameTip">定时任务名称</span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">任务类型:</th>
			<td align="left"><label><input id="timerType"
					name="timerType" type="radio" value="1" />每天 </label> <label><input
					id="timerType" name="timerType" type="radio" value="2" checked />单次</label>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">执行时间:</th>
			<td align="left"><input type="text" id="timer" name="timer"
				size="24" class="input_001" value="" /> <span id="timerTip">任务执行时间</span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">任务URL:</th>
			<td align="left"><input type="text" id="timerurl"
				name="timerurl" size="24" class="input_001" value="" /> <span
				id="timerurlTip">需要触发的任务URL</span></td>
		</tr>
		<tr>
			<th align="right" width="100">参数1:</th>
			<td align="left"><input type="text" id="p1" name="p1" size="24"
				class="input_001" value="" /> </td>
		</tr>
		<tr>
			<th align="right" width="100">参数2:</th>
			<td align="left"><input type="text" id="p2" name="p2" size="24"
				class="input_001" value="" /> </td>
		</tr>
		<tr>
			<th align="right" width="100">参数3:</th>
			<td align="left"><input type="text" id="p3" name="p3" size="24"
				class="input_001" value="" /> </td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="image"
				src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp;
				<img src="/images/button_cz.gif" style="cursor: pointer;"
				onclick="javascript:document.forms['createNgnTimer'].reset();">
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript" src="/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#timer')
						.datetimepicker(
								{
									timeFormat : 'HH:mm:ss',
									dateFormat : 'yy-mm-dd',
									monthNames : [ '一月', '二月', '三月', '四月',
											'五月', '六月', '七月', '八月', '九月', '十月',
											'十一月', '十二月', ],
									dayNamesMin : [ '日', '一', '二', '三', '四',
											'五', '六' ],
									timeText : '已选时间',
									closeText : '完成',
									hourText : '请选择小时数',
									minuteText : '请选择分钟数',
									secondText : '请选择秒数',
									currentText : '当前时间',
									showButtonPanel : true,
									showMonthAfterYear : true,
									showTime : true,
									gotoCurrent : true
								});
	
			});
</script>
<%@include file="/include/footer.jsp"%>
