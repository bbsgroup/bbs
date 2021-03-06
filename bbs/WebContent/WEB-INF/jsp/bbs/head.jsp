<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
	<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
	type=text/javascript></SCRIPT>
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
		<c:if test="${not empty currentUser}">
			<li><a href="#">欢迎${currentUser.username}</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/user/quit">退出</a></li>
			<c:if test="${currentUser.group.id==6}">
				<li><a
					href="${pageContext.request.contextPath}/admin/index">进入后台</a></li>
			</c:if>
			<LI><A href="${pageContext.request.contextPath}/forum/user/my_msg">短消息</A></LI>
			<LI class=dropmenu id=myspace onmouseover='showMenu(this.id)'
				style='BACKGROUND-POSITION: 94%'><A
				href="${pageContext.request.contextPath}/forum/user/my_topics">我的空间</A></LI>


		</c:if>
		<c:if test="${ empty sessionScope.currentUser}">
			<LI><A
				href="${pageContext.request.contextPath}/forum/user/registerPage">注册</A></LI>
			<LI><A
				href="${pageContext.request.contextPath}/forum/user/loginPage">登录</A></LI>
		</c:if>
		
		<LI><A
			href="${pageContext.request.contextPath}/forum/user/user_list">会员列表</A></LI>
	

	</UL>

	<UL class="popmenu_popup headermenu_popup" id=myspace_menu
		style="DISPLAY: none;">
		<LI><A href="${pageContext.request.contextPath}/forum/user/some_userInfo?id=${currentUser.id}">个人信息页</A></LI>
			<LI><A href="${pageContext.request.contextPath}/forum/user/my_userInfo?action=edit">编辑个人信息</A></LI>
		<LI><A href="${pageContext.request.contextPath}/forum/user/my_topics">我的话题</A></LI>
		<LI><A href="${pageContext.request.contextPath}/forum/user/my_friends">我的好友</A></LI>
		<LI><A href="${pageContext.request.contextPath}/forum/user/my_rights">我的权限</A></LI>
	</UL>
</DIV>