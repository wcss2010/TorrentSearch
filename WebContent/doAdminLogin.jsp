<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="org.guihuotv.search.web.pojo.*,org.guihuotv.search.web.msc.*,org.guihuotv.search.web.util.*,org.guihuotv.search.web.util.*"%>
<%@ page import="uw.util.web.*,uw.dm.*,java.util.*,java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	PageBox box = new PageBox(request, response, out);
	String username = box.getParam("username");
	session.setAttribute("logonName", username);//解决回显时中文乱码
	String passwd = box.getParam("passwd");
	String randCode = box.getParam("randCode");
	String flag = "";
	DAOFactory dao = DAOFactory.getInstance();

	if (randCode.equals("apiLogin")) {
		randCode = session.getAttribute("randCode").toString();
	}

	if ("login".equals(box.getParam("operation"))) {
		if (!randCode.equals(session.getAttribute("randCode"))) {
			flag = "randCode";
			out.clear();
			response.sendRedirect("adminLogin.jsp?errorflag=" + flag + "&username=" + username);
			return;
		} else {
			String whereSql = "where status=1 and username=? and passwd=?";
			MscUser ea = (MscUser) dao.listSingle(MscUser.class, whereSql, new Object[] { username, PasswordUtils.encode3Password(passwd) });
			if (ea == null) {
				flag = "up";
				out.clear();
				response.sendRedirect("adminLogin.jsp?errorflag=" + flag + "&username=" + username);
				return;
			} else if (randCode.equals(session.getAttribute("randCode"))) {
				String lastIp = box.getRealIp();
				if ("0:0:0:0:0:0:0:1".equals(lastIp)) {
					lastIp = "127.0.0.1";
				}
				ea.setLastLogonDate(new java.util.Date());
				ea.setLastLogonIp(lastIp);
				dao.update(ea);
				//处理登录用户的拥有的权限，将其放入session
				session.setAttribute("userInfo", ea);
				session.setAttribute("ownPerms", ea.getMscPerm());
				//检查重复登录
				MscSingleLogonInfo msli = MscSingleLogonService.checkSingleLogon(ea.getId());
				if (msli != null) {
					//说明有重复登录！
					out.clear();
					response.sendRedirect("/adminForceLogon.jsp");
					return;
				} else {
					//处理msli
					MscSingleLogonService.logon(ea.getId(), ea.getUsername(), session.getId(), lastIp);
					out.clear();
					response.sendRedirect("/workspace/");
					return;
				}
			}
		}
	} else if ("logout".equals(box.getParam("operation"))) {
		MscUser mscUser = (MscUser) session.getAttribute("userInfo");
		//登出msli。
		if (mscUser != null)
			MscSingleLogonService.logout(mscUser.getId());
		session.removeAttribute("userInfo");
		session.removeAttribute("ownPerms");
		session.removeAttribute("logonName");
		response.sendRedirect("/adminLogin.jsp");
	}
%>