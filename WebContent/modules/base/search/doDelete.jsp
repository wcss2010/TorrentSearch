
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long id = box.getLongParam("id");
	String opMsg = "";
	//开始do
	NgnSearch ngnSearch = (NgnSearch) dao.load(NgnSearch.class, id);
	try {
		dao.delete(ngnSearch);
	} catch (Exception e) {
		JSPLogger.error(e.getMessage(), e);
		opMsg = "操作失败！错误信息为：" + e.getMessage();
	}
	MscActionLogger.log(dao, request, "删除NgnSearch", "操作人：" + MSC_USER.getUsername() + "，删除了NgnSearch数据，ID为：" + id + "，内容为：\r\n" + String.valueOf(ngnSearch) + "\r\n" + opMsg);
	out.clear();
	out.print(opMsg);
%>