
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long id = box.getLongParam("id");
	String opMsg = "操作成功！";
	long userId = box.getLongParam("userId");
	String sname = box.getParam("sname");
	String searchurl = box.getParam("searchurl");
	int status = box.getIntParam("status", 1);

	NgnSearch ngnSearch = (NgnSearch) dao.load(NgnSearch.class, id);
	//开始do
	try {
		ngnSearch.setUserId(userId);
		ngnSearch.setSname(sname);
		ngnSearch.setSearchurl(searchurl);
		ngnSearch.setStatus(status);

		dao.update(ngnSearch);
	} catch (TransactionException e) {
		JSPLogger.error(e.getMessage(), e);
		opMsg = "操作失败！错误信息为：" + e.getMessage();

	}
	box.outJSAlert(opMsg, "window.opener.location.reload();window.close();");
	MscActionLogger.log(dao, request, "修改NgnSearch", "操作人：" + MSC_USER.getUsername() + "，修改了NgnSearch数据，ID为：" + id + "，内容为：\r\n" + String.valueOf(ngnSearch.GET_CHANGED_INFO()) + "\r\n" + opMsg);
%>