<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<DIV id=header>
	<H2>
		<A href="${pageContext.request.contextPath}/index"><IMG
			alt="unnamed"
			src="${pageContext.request.contextPath}/media/images/logo.gif"
			border=0></A>
	</H2>
</DIV>
<UL class="popmenu_popup headermenu_popup" id=advsearch_menu
	style="DISPLAY: none; width: 60px">
	<LI style="width: 60px"><A href="/ejforum/advsearch.jsp">网页搜索</A></LI>
	<LI style="width: 60px"><A
		href="javascript:searchImages('localhost/ejforum');">图片搜索</A></LI>
</UL>
<DIV id=headermenu>
	<UL>
		<li>${currentUser.username }</li>
		<LI><A
			href="${pageContext.request.contextPath}/forum/user/registerPage">注册</A></LI>
		<LI><A
			href="${pageContext.request.contextPath}/forum/user/loginPage">登录</A></LI>
		<LI><A href="/ejforum/feeds.jsp">订阅</A></LI>
		<LI><A href="/ejforum/userlist.jsp">会员列表</A></LI>
		<LI class=dropmenu id=advsearch onmouseover='showMenu(this.id)'
			style='BACKGROUND-POSITION: 94%'><A
			href="/ejforum/advsearch.jsp">搜索</A></LI>
		<LI><A href="/ejforum/help/index.jsp">帮助</A></LI>
	</UL>
</DIV>