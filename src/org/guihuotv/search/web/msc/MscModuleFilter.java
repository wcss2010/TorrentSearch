package org.guihuotv.search.web.msc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.guihuotv.search.web.pojo.MscUser;

/**
 * 用于过滤权限模块
 * 
 * @author axeon
 * 
 */
public class MscModuleFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		res.setLocale(req.getLocale());
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		// 初始权限
		MscUser mscUser = (MscUser) session.getAttribute("userInfo");// 将登入后的用户放在session�?
		String mscPerm = (String) session.getAttribute("ownPerms");
		// 校验唯一登陆
		MscSingleLogonInfo msli=null;
		if(mscUser!=null)
			msli = MscSingleLogonService.checkSingleLogon(mscUser.getId());
		if (msli == null || !msli.getSessionId().equals(session.getId())) {
			request.getRequestDispatcher("/adminForceLogout.jsp").forward(req,res);
		} else {
			// 进行权限�?��
			String url = req.getServletPath();
			int p = url.lastIndexOf('/');
			String prefix = "/modules";
			if (p > prefix.length()) {
				url = url.substring(prefix.length(), p);
			}

			Long pid = MscUtils.permIdMap.get(url);
			if (pid == null) {
				url = "/workspace/noPerm.jsp";
				//request.getRequestDispatcher(url).forward(req,res);
			} else {
				if ("*".equals(mscUser.getMscPerm())) {// 如果是超级管理员
					filterChain.doFilter(request, response);
				} else if (mscPerm.indexOf(pid + ",") > -1) {// 如果是有权限的url
					filterChain.doFilter(request, response);
				} else {
					url = "/workspace/noPerm.jsp";
					request.getRequestDispatcher(url).forward(req,res);
				}
			}
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}
}
