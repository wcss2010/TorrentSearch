<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,uw.dm.*,uw.util.web.*" %>
<%
Map<String, String[]> PAGE_LABEL_MAP = new HashMap<String,String[]>();
PAGE_LABEL_MAP.put("pageNo",new String[]{"1"});
%>
<table width="100%" border="0" align="center">
	<tr class="footer">
		<td align="left">
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
			<a href="<%=request.getRequestURI() %>?<%=ParamUtils.getPageParameterString(request,PAGE_LABEL_MAP) %>">首页</a>
			<%PAGE_LABEL_MAP.put("pageNo",new String[]{String.valueOf(CURRENT_PAGE - 1)}); %>
			<a href="<%=request.getRequestURI() %>?<%=ParamUtils.getPageParameterString(request,PAGE_LABEL_MAP) %>">前页</a>
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
			<%PAGE_LABEL_MAP.put("pageNo",new String[]{String.valueOf(CURRENT_PAGE + 1)}); %>
			<a href="<%=request.getRequestURI() %>?<%=ParamUtils.getPageParameterString(request,PAGE_LABEL_MAP) %>">后页</a>
			<%PAGE_LABEL_MAP.put("pageNo",new String[]{String.valueOf(PAGE_COUNT)}); %>
			<a href="<%=request.getRequestURI() %>?<%=ParamUtils.getPageParameterString(request,PAGE_LABEL_MAP) %>">末页</a>
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
<script type="text/javascript" src="/js/common.js"></script>