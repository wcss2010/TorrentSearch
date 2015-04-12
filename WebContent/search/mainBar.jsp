
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/homepageInit.jsp"%>
<%
	//PAGE_TITLE="管理NgnOrg";
%>
<%@include file="/include/homepageHeader.jsp"%>

<%
        String source = request.getParameter("keyword");
	String keyword = new String((source != null?source:"").getBytes("ISO-8859-1"),"UTF8");

	HashMap<String, String> viewMap = new HashMap<String, String>();
	StringBuilder wheresql = new StringBuilder("where status>-1");
	wheresql.append(" order by id desc");
	DataList<NgnSearch> dl = dao.list(NgnSearch.class, wheresql.toString());
	for (NgnSearch ns : dl) {
		viewMap.put(ns.getSname(), ns.getSearchurl().replace("{SKey}", keyword));
	}
%>

<div align="left">
	<font size="3px"> 磁力导航&nbsp;点击切换>></font>
	<%
		if (viewMap.size() > 0) {

			for (Map.Entry<String, String> entry : viewMap.entrySet()) {
	%>
	<a href="<%=entry.getValue()%>" target="contentFrame"><font size="3px"><%=entry.getKey()%>、</font></a>

	<%
		}
		} else {
	%>
	没有查询到任何结果！
	<%
		}
	%>
</div>
<HR style="FILTER: alpha(opacity =         100, finishopacity =         0, style =         1)" width="100%" color=#0000FF SIZE=1>
<%@include file="/include/footer.jsp"%>
