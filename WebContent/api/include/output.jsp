<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.text.*,java.util.*,java.util.Map.*,java.io.*"%>
<%
	Map m = new HashMap();
	m.put("code", RETCODE);
	m.put("msg", MESSAGE);
	if (DATA!=null){
		m.put("data", DATA);
	}
	if (DATA_ALLSIZE>0)
	{
		m.put("dataAllSize", DATA);
	}
	if (DATA_STARTPOS>0)
	{
		m.put("dataStartPos", DATA);
	}
	if (DATA_RESULTNUM>0)
	{
		m.put("dataResultNum", DATA);
	}
	out.clear();
%>
<%=JsonUtils.toJSONString(m)%>