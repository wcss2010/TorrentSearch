<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<html>
<head>
<title>TM-NMS管理菜单</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/js/commons.js" ></script>
<script type="text/javascript">
	$(function() {
		$('li').click(function() {
			$('.currentlink').removeClass('currentlink');
			$(this).addClass('currentlink');
		});
		$.post('fixHost.jsp', {
			'host' : window.location.host
		});
	});
</script>
</head>
<body id="msc-menu">
	<div>
		<div style="padding: 0 20px 20px 15px;"></div>
		<ul>
			<%
				MscUser mu = (MscUser) session.getAttribute("userInfo");
					if (mu != null) {
						String permStr = mu.getMscPerm();
						if (!"".equals(permStr)) {
							String selectSql = " where perm_type=0 order by menu_path";//列出超级管理员所拥有的权限
							if (!"admin".equals(mu.getUsername())) {
								selectSql = " where perm_type=0 and id in (" + permStr + ") order by menu_path";
							}
							DataList<MscPerm> dl = dao.list(MscPerm.class, selectSql);
							for (MscPerm mp : dl) {
								//if (ProductVerify3.checkWebLicense(mp.getActionUrl()))
									if (0 == mp.getMenuLayer()) {
										out.print("<li class=\"category\">" + mp.getPermName() + "</li>");
									} else {
										out.print("<li><a href=\"/modules" + mp.getActionUrl() + "\" target=\"mainFrame\">" + mp.getPermName() + "</a></li>");
									}
							}
						}
					}
			%>
		</ul>
	</div>
</body>
</html>