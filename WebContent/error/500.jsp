<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp" %>
<%@include file="/include/header.jsp" %>
<div>
出错了，<br/>
可能的原因：添加时出现异常或数据库记录为空<br/>
<%=errorInfo %>
</div>
<%@include file="/include/footer.jsp"%>