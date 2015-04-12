
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/homepageInit.jsp"%>
<%
	//PAGE_TITLE="管理NgnOrg";
%>
<%@include file="/include/homepageHeader.jsp"%>

<%
	String source = request.getParameter("keyword");
	String keyword = "";

	if (SysConfigUtils.getString("homepage", "URIEncoding") == null || (SysConfigUtils.getString("homepage", "URIEncoding") != null && !SysConfigUtils.getString("homepage", "URIEncoding").equals("utf8"))) {
		keyword = new String((source != null ? source : "").getBytes("ISO-8859-1"), "UTF8");
	} else {
		keyword = source;
	}

	ArrayList<String> names = new ArrayList<String>();
	ArrayList<String> urls = new ArrayList<String>();
	StringBuilder wheresql = new StringBuilder("where status>-1");
	wheresql.append(" order by id desc");
	DataList<NgnSearch> dl = dao.list(NgnSearch.class, wheresql.toString());
	for (NgnSearch ns : dl) {
		names.add(ns.getSname());
		urls.add(ns.getSearchurl().replace("{SKey}", keyword));
	}
%>

<div align="left">
	<font size="3px"> 磁力导航&nbsp;点击切换>></font>
	<%
		if (names.size() > 0 && names.size() == urls.size()) {

			names.trimToSize();
			urls.trimToSize();
			for (int k = 0; k < names.size(); k++) {
				String name = names.get(k);
				String url = urls.get(k);
	%>
	<a href="<%=url%>" target="contentFrame"><font size="3px"><%=name%>、</font></a>

	<%
		}
		} else {
	%>
	没有查询到任何结果！
	<%
		}
	%>
</div>
<HR style="FILTER: alpha(opacity =                     100, finishopacity =                     0, style =                     1)" width="100%" color=#0000FF SIZE=1>
<%@include file="/include/footer.jsp"%>
