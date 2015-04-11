<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long userId = box.getLongParam("id");
	MscUser mu = dao.load(MscUser.class, userId);
	mu.setStatus(1);
	boolean sucOrNot = true;
	try {
		dao.update(mu);
	} catch (Exception e) {
		sucOrNot = false;
	}
	if (sucOrNot) {
		out.println("操作成功！");
	} else {
		out.println("操作失败！请重新操作！");
	}
	MscActionLogger.log(dao, request, "web", mu.getUsername() + "被解冻，操作人：" + MSC_USER.getUsername());
%>