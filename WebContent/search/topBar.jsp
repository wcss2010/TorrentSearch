
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/homepageInit.jsp"%>
<%
	//PAGE_TITLE="管理NgnOrg";
%>
<%@include file="/include/homepageHeader.jsp"%>

<%
	String keyword = java.net.URLDecoder.decode(box.getParam("keyword"), "utf8");

	String msg = "";
	DataList<NgnMsg> dl = dao.list(NgnMsg.class, "where status >= 1 and userId = 10000 and toUserId = 0 order by sendDate desc");
	if (dl != null && dl.size() > 0) {
		msg = dl.get(0).getMsg();
	}
%>
<form action="/btSearch.jsp" id="pageForm" method="post" target="_parent">
	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td>名称：<input type="text" id="keyword" name="keyword" value="<%=keyword%>" style="color: gray;" size="100" />&nbsp;<input type="submit" value="搜索" id="search" /></td>
			<td>
				<%
					if (msg != null && !msg.isEmpty()) {
				%><u><font size="3px" color="#333333">通知：<%=msg%></font> </u> <%
 	}
 %>
			</td>
		</tr>
	</table>
</form>
<%@include file="/include/footer.jsp"%>