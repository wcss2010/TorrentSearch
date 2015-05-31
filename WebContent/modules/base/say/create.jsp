
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "新增语音指令";
%>
<%@include file="/include/header.jsp"%>

<form id="createNgnSay" name="createNgnSay" method="post"
	action="doCreate.jsp">
	<table width="580" border="0" align="center" cellpadding="0"
		cellspacing="0" class="msc-table">
		<tr>
			<th align="right" width="100">语音指令:</th>
			<td align="left"><input type="text" id="usersay" name="usersay"
				size="24" class="input_001" value="" /> <span id="usersayTip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令:</th>
			<td align="left"><input type="text" id="syscmd" name="syscmd"
				size="24" class="input_001" value="" /> <span id="syscmdTip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令内容:</th>
			<td align="left"><input type="text" id="cmdcontent"
				name="cmdcontent" size="24" class="input_001" value="" /> <span
				id="cmdcontentTip"></span></td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令参数1:</th>
			<td align="left"><input type="text" id="cmdp1" name="cmdp1"
				size="24" class="input_001" value="" /> <span id="cmdp1Tip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令参数2:</th>
			<td align="left"><input type="text" id="cmdp2" name="cmdp2"
				size="24" class="input_001" value="" /> <span id="cmdp2Tip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令参数3:</th>
			<td align="left"><input type="text" id="cmdp3" name="cmdp3"
				size="24" class="input_001" value="" /> <span id="cmdp3Tip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令参数4:</th>
			<td align="left"><input type="text" id="cmdp4" name="cmdp4"
				size="24" class="input_001" value="" /> <span id="cmdp4Tip"></span>
			</td>
		</tr>
		<tr>
			<th align="right" width="100">响应指令参数5:</th>
			<td align="left"><input type="text" id="cmdp5" name="cmdp5"
				size="24" class="input_001" value="" /> <span id="cmdp5Tip"></span>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="image"
				src="/images/button_tj.gif" style="cursor: pointer;" />&nbsp;&nbsp;
				<img src="/images/button_cz.gif" style="cursor: pointer;"
				onclick="javascript:document.forms['createNgnSay'].reset();">
			</td>
		</tr>
	</table>
</form>
<%@include file="/include/footer.jsp"%>
