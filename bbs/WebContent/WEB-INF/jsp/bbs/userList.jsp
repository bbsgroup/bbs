<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>会员列表 - unnamed</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
	type=text/javascript></SCRIPT>

<SCRIPT src="${pageContext.request.contextPath}/media/js/ajax.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/md5.js"
	type=text/javascript></SCRIPT>
</HEAD>
<BODY>

	<DIV class=wrap>

		<%@include file="head.jsp"%>

		<DIV id=nav><!-- 这里要显示上一页的路径 -->
			<A href="./index.jsp">返回上一页</A> &raquo;&nbsp; 会员列表　
		</DIV>
		<DIV class=container style="padding-bottom: 0px">
			<DIV class=mainbox>
				<H1>会员列表</H1>
				<TABLE cellSpacing=0 cellPadding=0>
					<THEAD>
						<TR>
							<TD width="12%">用户名</TD>
							<TD width="12%">昵称</TD>
							<TD width="10%">性别</TD>
							<TD width="12%">用户组</TD>
							<TD width="20%">上次访问</TD>
							<TD width="10%">帖子数</TD>
							<TD width="14%">注册日期</TD>
						</TR>
					</THEAD>
					<TBODY>
				<c:forEach items="${page.content}" var = "userInfo">
							<TR>
							<TD><A href="uspace.jsp?uid=administrator" target="_blank"><c:out value="${userInfo.user.username }"/></A></TD>
							<TD><c:out value="${userInfo.user.nickname}"/></TD>
							<TD><c:out value="${userInfo.sex }"/></TD>
							<TD><c:out value="${userInfo.user.group.name }"/></TD>
							<TD><c:out value="${userInfo.lastLoginTime }"/></TD>
							<TD><c:out value="${userInfo.totalPost }"/></TD>
							<TD><c:out value="${userInfo.user.createDate }"/></TD>
						</TR>
				</c:forEach>
			
					</TBODY>
				</TABLE>
			</DIV>

		</DIV>
		<DIV id="footfilter" class=legend style="margin-top: 0px">
			<form id="frmsearch" name="frmsearch" action="${pageContext.request.contextPath}/forum/user/listUser"
				method="post" style="float: right; padding: 1px">
				用户名: <input type="text" size="15" name="username" />&nbsp;
				<button type="submit">搜索</button>
			</form>
			<DIV style="padding-left: 2px"> <!-- 分页要怎么做？ -->
				排序方式: <a href="${pageContext.request.contextPath}/forum/user/listUser?sort=userid">用户名</a> - <a
					href="${pageContext.request.contextPath}/forum/user/listUser?sort=groupid">用户组</a> - <a
					href="${pageContext.request.contextPath}/forum/user/listUser?sort=credits">积分</a> - <a
					href="${pageContext.request.contextPath}/forum/user/listUser?sort=posts">帖子数</a> - <a
					href="${pageContext.request.contextPath}/forum/user/listUser?sort=lastvisited">上次访问</a> - <a
					href="${pageContext.request.contextPath}/forum/user/listUser?sort=createtime">注册日期</a>
			</DIV>
		</DIV>
	</DIV>
	<UL class="popmenu_popup headermenu_popup" id=myspace_menu
		style="DISPLAY: none;">
		<LI><A href="/ejforum/uspace.jsp?uid=aaa">个人信息页</A></LI>
		<LI><A href="/ejforum/member/my_profile.jsp">编辑个人资料</A></LI>
		<LI><A href="/ejforum/member/sms_list.jsp">短消息</A></LI>
		<LI><A href="/ejforum/member/my_topics.jsp">我的话题</A></LI>
		<LI><A href="/ejforum/member/my_favors.jsp">我的收藏</A></LI>
		<LI><A href="/ejforum/member/my_friends.jsp">我的好友</A></LI>
		<LI><A href="/ejforum/member/my_rights.jsp">我的权限</A></LI>
		<LI><A href="/ejforum/member/my_credits.jsp">积分交易记录</A></LI>
	</UL>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>
