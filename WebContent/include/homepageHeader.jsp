<%@page import="org.guihuotv.search.web.util.SysConfigUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%=SysConfigUtils.getString("homepage", "websitename") %> -- <%=PAGE_TITLE%></title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="keywords" content="<%=SysConfigUtils.getString("homepage", "keywords") %>">
<meta name="description" content="<%=SysConfigUtils.getString("homepage", "description") %>">

<link href="/css/home.css" rel="Stylesheet"/>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/js/jqueryui/jquery-ui-1.10.3.custom.css">
<script type="text/javascript" src="/js/jqueryui/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/js/colorbox/jquery.colorbox.js"></script>
<link href="/js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/commons.js"></script>
<script type="text/javascript" src="/js/formValidator/formValidator-4.1.3.js"></script>
<script type="text/javascript" src="/js/formValidator/formValidatorRegex.js"></script>
<link href="/js/jquery-cluetip-master/jquery.cluetip.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-cluetip-master/jquery.cluetip.js"></script>
</head>
<body id="msc-body">