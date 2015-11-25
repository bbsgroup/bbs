<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<DIV class=side>
	<DIV>
		<H2>我的空间</H2>
		<UL>
			<LI><H3>
					<A href="${pageContext.request.contextPath}/forum/user/some_userInfo?id=${currentUser.id}" target="_blank">个人信息页</A>
				</H3></LI>
			<LI ><H3>
					<A href="${pageContext.request.contextPath}/forum/user/my_userInfo">编辑个人资料</A>
				</H3></LI>
			<LI><H3>
					<A href="${pageContext.request.contextPath}/forum/user/my_msg">短消息</A>
				</H3></LI>
			<LI><H3>
					<A href="${pageContext.request.contextPath}/forum/user/my_topics">我的话题</A>
				</H3></LI>
			<LI><H3>
					<A href="${pageContext.request.contextPath}/forum/user/my_friends">我的好友</A>
				</H3></LI>
			<LI><H3>
					<A href="${pageContext.request.contextPath}/forum/user/my_rights">我的权限</A>
				</H3></LI>
		</UL>
	</DIV>
	
</DIV>