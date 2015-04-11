<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
	PAGE_TITLE = "本系统由焰火工作室出品！";
%>
<%@include file="/include/header.jsp"%>
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="480" height="480">
				<param name="movie" value="/images/welcome.swf">
				<param name="quality" value="high">
				<embed src="/images/welcome.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="480" height="480"></embed>
			</object></td>
	</tr>
</table>

<%@ include file="/include/footer.jsp"%>