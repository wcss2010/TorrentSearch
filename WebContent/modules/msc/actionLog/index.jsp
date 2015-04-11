<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%@include file="/include/header.jsp"%>
<%
SimpleDateFormat sdfSql=new SimpleDateFormat("yyyyMM");
String loggerLevel=box.getParam("loggerLevel");
String timeStart = box.getParam("timeStart",FastDateTools.getFirstDayOfMonth(new java.util.Date())+" 00:00:00");
String timeEnd = box.getParam("timeEnd",FastDateTools.getEndDayOfMonth(new java.util.Date())+" 23:59:59");

int CURRENT_PAGE = 1;
CURRENT_PAGE= box.getIntParam("pageNo",1);
RESULT_NUM=30;
//计算出当月要查询的表
Calendar calendar=Calendar.getInstance();
StringBuilder sbWhere =new StringBuilder(" a LEFT JOIN msc_user b ON (a.user_id=b.id) where 1=1");
if(!"".equals(box.getParam("username"))){
	sbWhere.append(" and b.username like '%").append(box.getParam("username")).append("%'");
}
if(!"".equals(box.getParam("userId"))){
	sbWhere.append(" and a.user_id =").append(box.getParam("userId"));
}
if(!"".equals(timeStart)){
	sbWhere.append(" and a.action_date>'").append(timeStart).append(" 00:00:00'");
	String[] monthArray=timeStart.substring(0,7).split("-");
	calendar.set(Calendar.MONTH,Integer.valueOf(monthArray[monthArray.length-1])-1);
}
if(!"".equals(box.getParam("timeEnd"))){
	sbWhere.append(" and a.action_date<'").append(box.getParam("timeEnd")).append(" 23:59:59'");
}
if(!"".equals(loggerLevel)){
	sbWhere.append(" and a.action_type='").append(loggerLevel).append("'");
}
String tableName="sys_action_log_"+sdfSql.format(calendar.getTime());
String orderBy=" order by a.id desc";
String sql="SELECT a.id,a.user_id,a.action_module,a.action_date,a.action_body,a.action_type,a.action_ip,b.username FROM "+tableName+sbWhere+orderBy;
int startIndex=(CURRENT_PAGE-1)*RESULT_NUM;
DataSet dlAl=null;
try{
dlAl=dao.queryForDataSet(sql,startIndex,RESULT_NUM);
}catch (Exception e){
	JSPLogger.error(e.getMessage(),e);
	out.clear();
	session.setAttribute("errorInfo","对不起，还没有该月份日志！");
	box.outJSAlert("对不起，还没有该月份日志!", "window.location='index.jsp'");
}
if(dlAl!=null){
int ALL_SIZE = dlAl.allsize();
int PAGE_COUNT = (int)Math.ceil((double)ALL_SIZE/RESULT_NUM);
%>

<form action="index.jsp" id="pageForm" method="post" onSubmit="javascript:return valideTime();">
<table width="850" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="left">用 户 名： <input name="username" value="<%=box.getParam("username") %>" size="12" />
		操作类型：<select name="loggerLevel">
			<option value="">全部</option>
			<option value="1" <%if("1".equals(loggerLevel)){out.print("selected");} %>>访问日志</option>
			<option value="2" <%if("2".equals(loggerLevel)){out.print("selected");} %>>操作日志</option>
		</select>
	<td align="left">起始时间： <input name="timeStart" size="18" id="timeStart" value="<%=timeStart%>" />
	结束时间： <input name="timeEnd" id="timeEnd" type="text" size="18" value="<%=timeEnd%>"/></td>
	<td align="left"><input type="image" src="/images/button_cx.gif" /></td>
	</tr>
</table>
<input type="hidden" id="pageNo" name="pageNo" value="<%=CURRENT_PAGE%>" /> <%@include file="/include/pageJsLabel.jsp"%>
</form>
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center" class="msc-table">
	<thead>
	<tr>
		<th align="center">ID</th>
		<th align="center">用户名</th>
		<th align="center">操作类型</th>
		<th align="center">作用模块</th>
		<th align="center">内容</th>
		<th align="center">操作时间</th>
		</tr>
	</thead>
	<tbody>
	<%
		if(dlAl==null || dlAl.allsize()==0){
	%>
		<tr>
		<td align="center" colspan="5"><b>没有查询到数据!</b></td>
		</tr>
	<%}else{
		while (dlAl.next()) {
	%>
		<tr>
			<td><%=dlAl.getString("id") %></td>
			<td><%=dlAl.getString("username")%></td>
			<td><%if(dlAl.getInt("action_type")==1){out.println("web");}else if(dlAl.getInt("action_type")==2){out.println("api");} %></td>
			<td><%=dlAl.getString("action_module")%></td>
			<td align="left"><%=dlAl.getString("action_body")%></td>
			<td ><%=sdfDetail.format(dlAl.getDate("action_date"))%></td>
		</tr>
		<%
		}
	%>
	<%} %>
	</tbody>
</table>
<%@include file="/include/pageJsLabel.jsp"%>
<script type="text/javascript">
function valideTime(){
var timeStart=$("input[name='timeStart']").val();
var timeEnd=$("input[name='timeEnd']").val();
if(timeStart.substring(0,7)!=timeEnd.substring(0,7)&&timeEnd!=""){
		alert("对不起，不可以跨月份查询！");
		return false;
	}
	if ($('#timeStart').val()>=$('#timeEnd').val()){
	alert('结束时间必须大于开始时间！');
	return false;
	}
}

$(document).ready(function() {
    $('#timeStart').datetimepicker({
    	timeFormat:'HH:mm:ss',
    	dateFormat:'yy-mm-dd',
    	monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月',],
    	dayNamesMin: ['日','一','二','三','四','五','六'],
    	timeText:'已选时间',
    	closeText:'完成',
    	hourText:'请选择小时数',
    	minuteText:'请选择分钟数',
    	secondText:'请选择秒数',
    	currentText:'当前时间',
    	showButtonPanel:true,
    	showMonthAfterYear:true,
    	showTime:true,
    	gotoCurrent: true
    });
    $('#timeEnd').datetimepicker({
    	timeFormat:'HH:mm:ss',
    	dateFormat:'yy-mm-dd',
    	monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月',],
    	dayNamesMin: ['日','一','二','三','四','五','六'],
    	timeText:'已选时间',
    	closeText:'完成',
    	hourText:'请选择小时数',
    	minuteText:'请选择分钟数',
    	secondText:'请选择秒数',
    	currentText:'当前时间',
    	showButtonPanel:true,
    	showMonthAfterYear:true,
    	gotoCurrent: true,
    	onClose: function(dateText,inst){
    		if ($('#timeStart').val()>=$('#timeEnd').val()){
    			alert('结束时间必须大于开始时间！');
    		}
    	}
    });
}); 
</script>
<%} %>
<%@include file="/include/footer.jsp"%>
