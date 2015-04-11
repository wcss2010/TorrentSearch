
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/init.jsp"%>
<%
String opMsg = "操作成功！";
//开始do
NgnOrg ngnOrg = new NgnOrg();
String orgName = box.getParam("orgName");
String orgDesc = box.getParam("orgDesc");
String linkMan = box.getParam("linkMan");
String telephone = box.getParam("telephone");
String mobile = box.getParam("mobile");
String address = box.getParam("address");
String zipcode = box.getParam("zipcode");
String email = box.getParam("email");
int licenseNodeNum = box.getIntParam("licenseNodeNum",-1);
int licenseAdminNum = box.getIntParam("licenseAdminNum",-1);
int licenseUserNum = box.getIntParam("licenseUserNum",-1);
java.util.Date licenseExpiredDate = box.getDateParam("licenseExpiredDate");
java.util.Date createDate = box.getDateParam("createDate");
java.util.Date modifyDate = box.getDateParam("modifyDate");
int status = box.getIntParam("status",-1);

try {
	ngnOrg.setId(dao.getSequenceId(NgnOrg.class));
	
	ngnOrg.setOrgName(orgName);
	ngnOrg.setOrgDesc(orgDesc);
	ngnOrg.setLinkMan(linkMan);
	ngnOrg.setTelephone(telephone);
	ngnOrg.setMobile(mobile);
	ngnOrg.setAddress(address);
	ngnOrg.setZipcode(zipcode);
	ngnOrg.setEmail(email);
	ngnOrg.setLicenseNodeNum(licenseNodeNum);
	ngnOrg.setLicenseAdminNum(licenseAdminNum);
	ngnOrg.setLicenseUserNum(licenseUserNum);
	ngnOrg.setLicenseExpiredDate(licenseExpiredDate);
	ngnOrg.setCreateDate(createDate);
	ngnOrg.setModifyDate(modifyDate);
	ngnOrg.setStatus(status);
	
	dao.save(ngnOrg);
}catch(TransactionException e){
	JSPLogger.error(e.getMessage(),e);
	opMsg = "操作失败！错误信息为："+e.getMessage();
}
box.outJSAlert(opMsg,"window.opener.location.reload();window.close();");
MscActionLogger.log(dao,request,"添加NgnOrg","操作人："+MSC_USER.getUsername()+",新建了NgnOrg数据，内容为：\r\n"+ngnOrg.toString()+"\r\n"+opMsg);
%>