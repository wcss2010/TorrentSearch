<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/include/init.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=PAGE_TITLE %> - 抱歉，您没有这个操作权限！</title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
</html>
<script type="text/javascript">
alert("您没有此权限操作！");
opener.parent.frames['mainFrame'].reload();
</script>