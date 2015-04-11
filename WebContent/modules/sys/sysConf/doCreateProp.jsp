<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	String propName = box.getParam("propName");
	String propDesc = box.getParam("propDesc");
	String propValue = box.getParam("propValue");
	int id = box.getIntParam("pid");
	String inputDesc = box.getParam("inputDesc");
	SysConfig scg = (SysConfig) dao.load(SysConfig.class, id);
	SysConfig sc = new SysConfig();
	sc.setCreateDate(new Date());
	sc.setCatName(scg.getCatName());
	sc.setPropComment(propDesc);
	sc.setStatus(1);
	sc.setInputComment(inputDesc);
	sc.setPropName(propName);
	sc.setPropValue(propValue);
	DataList<SysConfig> dl = dao.list(SysConfig.class, "where cat_name=" + "'" + scg.getCatName() + "'");
	int l = dl.allsize() + 1;
	if (l < 10) {
		sc.setDisplayOrder(scg.getDisplayOrder().substring(0, 3) + "00" + String.valueOf(l));
	} else if (9 < l && l < 100) {
		sc.setDisplayOrder(scg.getDisplayOrder().substring(0, 3) + "0" + String.valueOf(l));
	} else {
		sc.setDisplayOrder(scg.getDisplayOrder().substring(0, 3) + String.valueOf(l));
	}
	boolean sucOrNot = true;
	try {
		dao.save(sc);

		SysConfigUtils.reload();
	} catch (Exception e) {
		sucOrNot = false;
		JSPLogger.error(e.getMessage(), e);
	}
	if (sucOrNot) {
		MscActionLogger.log(dao, request, "添加属性", "操作人：" + MSC_USER.getUsername() + ",在" + scg.getPropComment() + "类别下添加了" + propName + "的属性");
		box.outJSAlert("添加成功！", "window.opener.location.reload();window.close();");
	} else {
		box.outJSAlert("添加失败,请重新添加！", "window.opener.location.reload();window.close();");
	}
%>