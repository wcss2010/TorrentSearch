
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
long id = box.getLongParam("id");
String opMsg = "操作成功！";
int userType = box.getIntParam("userType",-1);
String username = box.getParam("username");
String passwd = box.getParam("passwd");
String mobile = box.getParam("mobile");
String email = box.getParam("email");
String aliasName = box.getParam("aliasName");
java.util.Date birthday = box.getDateParam("birthday");
int age = box.getIntParam("age",-1);
int gender = box.getIntParam("gender",-1);
String remark = box.getParam("remark");
String school = box.getParam("school");
String company = box.getParam("company");
String occupation = box.getParam("occupation");
String industry = box.getParam("industry");
int userPoint = box.getIntParam("userPoint",-1);
java.util.Date lastLogonDate = box.getDateParam("lastLogonDate");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

NgnUser ngnUser = (NgnUser)dao.load(NgnUser.class,id);
//开始do
try {
	ngnUser.setUserType(userType);
	ngnUser.setUsername(username);
	ngnUser.setPasswd(passwd);
	ngnUser.setMobile(mobile);
	ngnUser.setEmail(email);
	ngnUser.setAliasName(aliasName);
	ngnUser.setBirthday(birthday);
	ngnUser.setAge(age);
	ngnUser.setGender(gender);
	ngnUser.setRemark(remark);
	ngnUser.setSchool(school);
	ngnUser.setCompany(company);
	ngnUser.setOccupation(occupation);
	ngnUser.setIndustry(industry);
	ngnUser.setUserPoint(userPoint);
	ngnUser.setLastLogonDate(lastLogonDate);
	ngnUser.setCreateDate(createDate);
	ngnUser.setModifyDate(modifyDate);
	ngnUser.setStatus(status);
	
	dao.update(ngnUser);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();

}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"修改NgnUser","操作人："+MSC_USER.getUsername()+"，修改了NgnUser数据，ID为："+id+"，内容为：\r\n"+String.valueOf(ngnUser.GET_CHANGED_INFO())+"\r\n"+opMsg);
%>