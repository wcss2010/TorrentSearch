<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	long userId = box.getLongParam("id", -1);
	MscUser userSingle = (MscUser) dao.load(MscUser.class, userId);
	String[] permNames = request.getParameterValues("permName");
	//String selectAll = box.getParam("selectAll");
	Set<Long> setParent = new HashSet<Long>();
	StringBuilder sb = new StringBuilder();
	if (permNames != null) {
		for (String o : permNames) {
			MscPerm mp = dao.load(MscPerm.class, Long.parseLong(o));
			sb.append(o).append(",");
			setParent.add(mp.getParentId());
		}
		//把所选择的父级目录的ID也加上
		Iterator<Long> iter = setParent.iterator();
		while (iter.hasNext()) {
			long parentId = iter.next();
			sb.append(parentId).append(",");
		}
		if (sb != null && sb.length() > 0){
		    userSingle.setMscPerm(sb.toString().substring(0, sb.toString().length() - 1));
		}
	} else {
		if("admin".equals(userSingle.getUsername()))
		{
			userSingle.setMscPerm("*");
		}else{
			userSingle.setMscPerm("");
		}
	}
	dao.update(userSingle);
	MscActionLogger.log(dao, request, "web", "为用户名为:" + userSingle.getUsername() + "的用户分配菜单访问权限，操作人：" + MSC_USER.getUsername());
	box.outJSAlert("分配权限成功！", "window.opener.location.reload();window.close();");
%>
