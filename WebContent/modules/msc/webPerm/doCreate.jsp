<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	long parentId = box.getLongParam("parentId", -1);
	String permName = box.getParam("permName");
	String permUrl = box.getParam("URLName");
	String permDesc = box.getParam("permDesc");
	MscPerm mp = new MscPerm();
	int layer = 0;
	mp.setCreateDate(new Date());
	mp.setPermDesc(permDesc);
	if (parentId == -1) {
		mp.setMenuLayer(0);
		DataList<MscPerm> dl = dao.list(MscPerm.class, "where parent_id=0");
		int l = dl.allsize() + 1;
		if (l < 10) {
			mp.setMenuPath("00" + String.valueOf(l) + "000000000000000");
		} else if (9 < l && l < 100) {
			mp.setMenuPath("0" + String.valueOf(l) + "000000000000000");
		} else {
			mp.setMenuPath(String.valueOf(l) + "000000000000000");
		}
		mp.setParentId(0);
	} else {
		MscPerm mpT = (MscPerm) dao.load(MscPerm.class, parentId);
		mpT.setChildNum(mpT.getChildNum() + 1);
		dao.update(mpT);
		mp.setParentId(mpT.getId());
		layer = mpT.getMenuLayer() + 1;
		mp.setMenuLayer(layer);
		DataList<MscPerm> dl = dao.list(MscPerm.class, "where parent_id=" + mpT.getId());
		int l = dl.allsize() + 1;
		String layPath = "";
		if (l < 10) {
			layPath = "00" + String.valueOf(l);
		} else if (9 < l && l < 100) {
			layPath = "0" + String.valueOf(l);
		} else {
			layPath = String.valueOf(l);
		}
		mp.setMenuPath(mpT.getMenuPath().substring(0, layer * 3) + layPath + "000000000000000000".substring((layer + 1) * 3));
	}
	mp.setActionUrl(permUrl);
	mp.setPermType(0);
	mp.setPermName(permName);
	mp.setPermDesc(permDesc);
	mp.setCreateDate(new Date());
	mp.setStatus(1);
	boolean sucOrNot = true;
	try {
		dao.save(mp);
	} catch (Exception e) {
		sucOrNot = false;
		JSPLogger.error(e.getMessage(), e);
	}
	if (sucOrNot) {
		MscUtils.refreshPermIdMap();
		MscActionLogger.log(dao, request, "web", "操作人：" + MSC_USER.getUsername() + ",创建了" + permName + "的权限");
		box.outJSAlert("添加成功！", "window.opener.location.reload();window.close();");
	}
%>