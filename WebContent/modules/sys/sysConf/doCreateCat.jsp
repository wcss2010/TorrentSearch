<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	String catName = box.getParam("catName");
	String catDesc = box.getParam("catDesc");
	String inputDesc = box.getParam("inputDesc");
	DataList<SysConfig> ds = dao.list(SysConfig.class, "where cat_name='" + catName + "' and status>0");
	if (ds.allsize() == 0) {
		SysConfig sc = new SysConfig();
		sc.setCreateDate(new Date());
		sc.setCatName(catName);
		sc.setPropComment(catDesc);
		sc.setInputComment(inputDesc);
		sc.setStatus(1);
		sc.setPropName(null);
		sc.setPropValue(null);
		DataList<SysConfig> dl = dao.list(SysConfig.class, "where prop_name is null");
		int l = dl.allsize() + 1;
		if (l < 10) {
			sc.setDisplayOrder("00" + String.valueOf(l) + "000");
		} else if (9 < l && l < 100) {
			sc.setDisplayOrder("0" + String.valueOf(l) + "000");
		} else {
			sc.setDisplayOrder(String.valueOf(l) + "000");
		}
		boolean sucOrNot = true;
		try {
			dao.save(sc);
		} catch (Exception e) {
			sucOrNot = false;
			JSPLogger.error(e.getMessage(), e);
		}
		if (sucOrNot) {
			MscActionLogger.log(dao, request, "创建分类", "操作人：" + MSC_USER.getUsername() + ",创建了" + catName + "的分类");
			box.outJSAlert("添加成功！", "window.opener.location.reload();window.close();");
		} else {
			box.outJSAlert("添加失败,请重新添加！", "window.opener.location.reload();window.close();");
		}
	} else {
		box.outJSAlert("添加失败,该分类已经存在,请重新添加！", "window.opener.location.reload();window.close();");
	}
%>