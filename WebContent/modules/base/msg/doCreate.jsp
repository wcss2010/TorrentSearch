
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	String opMsg = "操作成功！";
	//开始do
	NgnMsg ngnMsg = new NgnMsg();
	long userid = 10000;
	long touserid = box.getLongParam("touserid",0);
	String msg = box.getParam("msg");
	java.util.Date senddate = new Date();
	int status = 1;

	try {
		ngnMsg.setId(dao.getSequenceId(NgnMsg.class));

		ngnMsg.setUserid(userid);
		ngnMsg.setTouserid(touserid);
		ngnMsg.setMsg(msg);
		ngnMsg.setSenddate(senddate);
		ngnMsg.setStatus(status);

		dao.save(ngnMsg);
	} catch (TransactionException e) {
		JSPLogger.error(e.getMessage(), e);
		opMsg = "操作失败！错误信息为：" + e.getMessage();
	}
	box.outJSAlert(opMsg, "window.opener.location.reload();window.close();");
	MscActionLogger.log(dao, request, "添加NgnMsg", "操作人：" + MSC_USER.getUsername() + ",新建了NgnMsg数据，内容为：\r\n" + ngnMsg.toString() + "\r\n" + opMsg);
%>