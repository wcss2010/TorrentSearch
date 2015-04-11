
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long id = box.getLongParam("id");
	String opMsg = "操作成功！";
	long userid = box.getLongParam("userid");
	long touserid = box.getLongParam("touserid", 0);
	String msg = box.getParam("msg");
	java.util.Date senddate = new Date();
	int status = 1;

	NgnMsg ngnMsg = (NgnMsg) dao.load(NgnMsg.class, id);
	//开始do
	try {
		ngnMsg.setUserid(userid);
		ngnMsg.setTouserid(touserid);
		ngnMsg.setMsg(msg);
		ngnMsg.setSenddate(senddate);
		ngnMsg.setStatus(status);

		dao.update(ngnMsg);
	} catch (TransactionException e) {
		JSPLogger.error(e.getMessage(), e);
		opMsg = "操作失败！错误信息为：" + e.getMessage();

	}
	box.outJSAlert(opMsg, "window.opener.location.reload();window.close();");
	MscActionLogger.log(dao, request, "修改NgnMsg", "操作人：" + MSC_USER.getUsername() + "，修改了NgnMsg数据，ID为：" + id + "，内容为：\r\n" + String.valueOf(ngnMsg.GET_CHANGED_INFO()) + "\r\n" + opMsg);
%>