<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/init.jsp"%>
<%
	long permId = box.getLongParam("permId", -2);
	String permName = box.getParam("permName");
	String permUrl = box.getParam("URLName");
	String permDesc = box.getParam("permDesc");
	String displayOrder = box.getParam("permPrior");
	int parentId= box.getIntParam("parentId",-1);
	MscPerm mp = (MscPerm) dao.load(MscPerm.class, permId);
	if (mp != null) {

		int layer=mp.getMenuLayer();
		String prevLevel = mp.getMenuPath();
		mp.setPermName(permName);
		mp.setActionUrl(permUrl);
		mp.setPermDesc(permDesc);
		int prevParentId=(int)mp.getParentId();
		if(parentId!=-1)
			if(parentId!=prevParentId){
				//用户修改了栏目的父级继承
				///修改子栏目的所有displayOrder
				MscPerm mpCurrent=(MscPerm)dao.load(MscPerm.class, parentId);
				String displayOrderCurrentParent=mpCurrent.getMenuPath();
				int layerParent=mpCurrent.getMenuLayer();
				String prefixDisplayOrder=displayOrderCurrentParent.substring(0,(1+layerParent)*3);
				String newChildNumString=String.valueOf(mpCurrent.getChildNum()+1);
				newChildNumString="000".substring(newChildNumString.length())+newChildNumString;//将数值转换为前有0的字符串
				mpCurrent.setChildNum(mpCurrent.getChildNum()+1);
				dao.update(mpCurrent);
				mp.setParentId(parentId);
				mp.setMenuPath(prefixDisplayOrder+newChildNumString+prevLevel.substring((layerParent+2)*3));//修改本项的displayorder
				mp.setMenuLayer(layerParent+1);//修改本项的级别
				
				DataList<MscPerm> dlTmp=dao.list(MscPerm.class,"where parent_id="+mp.getId());
				int catGrade=layerParent+1;
				String replacement=mp.getMenuPath().substring(0,(catGrade+1)*3);
				while(dlTmp.hasNext()){
					MscPerm scT=dlTmp.next();
					String s=scT.getMenuPath().substring((catGrade+1)*3);
					scT.setMenuPath(replacement+s);
					dao.update(scT);
				}
				//修改子栏目的所有displayOrder ---end
				//修改原来所在栏目同级中且displayOrder位于该栏目后面级别的栏目及子栏目
				//先修改本栏目原交级栏目的孩子数
				MscPerm scPrev=dao.load(MscPerm.class,prevParentId);
				scPrev.setChildNum(scPrev.getChildNum()-1);
				dao.update(scPrev);
				//将同级的相前移动一位
				DataList<MscPerm>  dlTm=null;
				String clausePreEnd = String.valueOf(Integer.valueOf(displayOrder.substring(0, (layer) * 3)) + 1) + "000000000000000000".substring((layer) * 3);
				String clauseEnd = "000000000000000000".substring(clausePreEnd.length()) + clausePreEnd;
				dlTm = dao.list(MscPerm.class, "where menu_path>" + displayOrder + " and menu_path <" + clauseEnd);
				while (dlTm.hasNext()) {
					MscPerm scata = dlTm.next();
					String disOrder = scata.getMenuPath();
					String disOrder2 = String.valueOf(Integer.valueOf(disOrder.substring(layer * 3, (layer + 1) * 3)) - 1);
					String modifyS = "000".substring(disOrder2.length()) + disOrder2;
					scata.setMenuPath(disOrder.substring(0, layer * 3) + modifyS + disOrder.substring((layer + 1) * 3));
					dao.update(scata);
						}
				//修改原来所在栏目同级中且displayOrder位于该栏目后面级别的栏目及子栏目 ---end
			
		}
		mp.setModifyDate(new Date());
		dao.update(mp);
		MscUtils.refreshPermIdMap();
	
	}
	MscActionLogger.log(dao,request,"web"," 修改了权限信息，操作人："+MSC_USER.getUsername()+"，编辑了"+mp.getPermName()+"的权限");
	box.outJSAlert("修改成功！", "window.opener.location.reload();window.close();");
%>