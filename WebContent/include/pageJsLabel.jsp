<%@ page contentType="text/html; charset=UTF-8"%>
<table width="100%" border="0" align="center">
	<tr class="footer">
		<td align="left">
			<input type="hidden" id="pageCount" name="pageCount" value="<%=PAGE_COUNT %>">
			共有<%=ALL_SIZE%>条信息&nbsp;每页<%=RESULT_NUM%>条&nbsp;合计<%=PAGE_COUNT%>页 &nbsp;当前页:
			<%=CURRENT_PAGE%>
		</td>
		<td align="right">
			<%
				if (CURRENT_PAGE <= 1) {
			%>
			首页 前页
			<%
				} else {
			%>
			<a href="javascript:go2page('1');">首页</a>
			<a href="javascript:go2page('<%=(CURRENT_PAGE - 1)%>');">前页</a>
			<%
				}
			%>
			<%
				if (CURRENT_PAGE >= PAGE_COUNT) {
			%>
			后页 末页
			<%
				} else {
			%>
			<a href="javascript:go2page('<%=(CURRENT_PAGE + 1)%>');">后页</a>
			<a href="javascript:go2page('<%=PAGE_COUNT%>');">末页</a>
			<%
				}
			%>
			&nbsp;&nbsp;转到：
			<input type="text" id="editPageNo" size="3" value="<%=CURRENT_PAGE%>">
			页
			<input type="button" value="GO" onclick="go2page()">
		</td>
	</tr>
</table>