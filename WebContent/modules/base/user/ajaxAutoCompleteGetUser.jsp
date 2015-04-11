<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	String orgName = box.getParam("term");
	DataList<NgnUser> dl = dao.list(NgnUser.class, "where status>0 and username like ? order by username", new Object[] { "%" + orgName + "%" }, 0, 30);
	StringBuilder html = new StringBuilder();
	html.append('[');
	for (NgnUser lc : dl) {
		html.append("{\"label\":\"" + lc.getUsername() + "\",\"value\":\"" + lc.getUsername() + "\",\"id\":\"" + lc.getId() + "\"},");
	}
	if (html.length() > 1) {
		html.setCharAt(html.length() - 1, ']');
	} else {
		html.append(']');
	}
	out.clear();
	out.print(html.toString());
%>