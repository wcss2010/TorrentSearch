
<%@page pageEncoding="UTF-8"%>
<%@include file="/include/homepageInit.jsp"%>
<%
	//PAGE_TITLE="管理NgnOrg";
%>
<%@include file="/include/homepageHeader.jsp"%>

<div class="page">
	<div class="header">
		<%=SysConfigUtils.getString("homepage", "codeA").replace("empty", "")%>
	</div>
	<div class="content">
		<div>
			<img src="<%=SysConfigUtils.getString("homepage", "logo")%>" title="BT樱桃 磁力链接搜索引擎" alt="btcherry" />
		</div>
		<form action="/btSearch.jsp">
			<div style="padding-top: 20px;">
				<input name="keyword" id="keyword" type="text" placeholder="搜索影视、明星、游戏、软件..." />
			</div>
			<div style="padding-top: 10px;">
				<input type="submit" value="搜索" id="search" />
			</div>
			<div style="padding-top: 10px;">
				<%
					String hs = SysConfigUtils.getString("homepage", "hotSearch");
					if (hs != null) {
						String[] hst = hs.split(",");
						for (String ss : hst) {
				%>
				<a style="margin-left: 5px;" href="/btSearch.jsp?keyword=<%=ss%>"><%=ss%></a>
				<%
					}
					}
				%>
			</div>
		</form>
	</div>
	<div class="footer">
		<hr />
		<div style="width: 64%; margin-left: auto; margin-right: auto;">
			<div style="float: left; width: 12%;">&nbsp;</div>
			<div style="float: left; width: 28%; text-align: left;">
				<div style="font-weight: bold;"><%=SysConfigUtils.getString("homepage", "websitename")%></div>
				<span><%=SysConfigUtils.getString("homepage", "description")%></span>
			</div>
			<div style="float: left; width: 5%;">&nbsp;</div>
			<div style="float: left; width: 28%; text-align: left;">
				<div style="font-weight: bold;">磁力链接</div>
				<span>磁力链接(<a href="http://en.wikipedia.org/wiki/Magnet_link">Magnet URI Scheme</a>)是一种新型的分享形式，每个链接对应一个BT种子文件。您可以通过软件下载磁力链接指向的资源，例如迅雷、BitComet、QQ旋风，也可以使用云点播服务在线观看影视资源，例如迅雷云播、百度云盘等。
				</span>
			</div>
			<div style="float: left; width: 5%;">&nbsp;</div>
			<div style="float: left; width: 20%; text-align: left;">
				<ul>
					<li><a href="mailto:<%=SysConfigUtils.getString("homepage", "email")%>">联系我们</a></li>
				</ul>

				<div style="clear: both; margin-bottom: 20px;"><%=SysConfigUtils.getString("homepage", "htmlcount").replace("empty", "")%></div>
			</div>
			<div style="clear: both; margin-bottom: 20px;"></div>
		</div>
	</div>
</div>

<%@include file="/include/footer.jsp"%>