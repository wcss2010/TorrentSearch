<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%!void recurDelCatalog(MscPerm sc, DAOFactory dao) {//循环删除子目录
		DataList<MscPerm> dlMpDel = null;
		try {
			dlMpDel = dao.list(MscPerm.class, "where parent_id=" + sc.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dlMpDel != null && dlMpDel.size() > 0) {
			while (dlMpDel.hasNext()) {
				MscPerm scDel = dlMpDel.next();
				try {
					dao.delete(scDel);
				} catch (Exception e) {
					JSPLogger.error(e.getMessage(),e);
				}
				recurDelCatalog(scDel, dao);
			}
		}
	}%>
<%
	long permId = box.getLongParam("permId", -1);
	MscPerm mp = (MscPerm) dao.load(MscPerm.class, permId);
	if (mp != null) {
		dao.delete(mp);
		recurDelCatalog(mp,dao);
		//把同级目录中后面的，优先级低于本目录的DISPLAY_ORDER的相应值依次向前修改
		int layer = mp.getMenuLayer();
		DataList<MscPerm> dlTm = null;
		String displayOrder = mp.getMenuPath();
		if (layer == 0) {//一级情况
			dlTm = dao.list(MscPerm.class, "where menu_path>" + displayOrder);
		} else {//其他情况
			String clausePreEnd = String.valueOf(Integer.valueOf(displayOrder.substring(0, (layer) * 3)) + 1) + "000000000000000000".substring((layer) * 3);
			String clauseEnd = "000000000000000000".substring(clausePreEnd.length()) + clausePreEnd;
			dlTm = dao.list(MscPerm.class, "where menu_path>" + displayOrder + " and menu_path <" + clauseEnd);
				}
		while (dlTm.hasNext()) {
			MscPerm scata = dlTm.next();
			String disOrder = scata.getMenuPath();
			String disOrder2 = String.valueOf(Integer.valueOf(disOrder.substring(layer * 3, (layer + 1) * 3)) - 1);
			String modifyS = "000".substring(disOrder2.length()) + disOrder2;
			scata.setMenuPath(disOrder.substring(0, layer * 3) + modifyS + disOrder.substring((layer + 1) * 3));
			dao.update(scata);
				}
		MscUtils.refreshPermIdMap();
	}
	MscActionLogger.log(dao,request,"web","操作人："+MSC_USER.getUsername()+",删除了"+mp.getPermName()+"的权限");
	box.outJSAlert("删除成功！", "window.opener.location.reload();window.close();");
%>