<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>${userInfo.user.username }的个人信息页-unnamed</TITLE>
<META http-equiv=Content-Type content="text/html;charset=UTF-8">

<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/member.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/ajax.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/md5.js"
	type=text/javascript></SCRIPT>

</HEAD>
<BODY>

	<DIV class=wrap>

		<%@include file="head.jsp"%>

		<DIV id=nav>
			<A href="${pageContext.request.contextPath}/index">首页</A> &raquo;
			个人信息页
		</DIV>
		<DIV class=container>
			<DIV class=spacectx>
				<DIV class=mainbox>
					<H2>
						<label><a title="RSS Feed" href="./rss?uid=aaa&page=1"
							target=_blank> <IMG alt="RSS Feed"
								src="${pageContext.request.contextPath}/media/images/rss.gif"
								border="0" style="margin-top: 8px; margin-right: 7px;"></a></label> <a
							href="${pageContext.request.contextPath}/forum/user/some_userInfo?id=${currentUser.id}"
							class="caton">主题</a>&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath}/forum/user/some_userInfo?id=${currentUser.id}&act=reply"
							class="catoff">回复</a>
					</H2>
					<TABLE cellSpacing=0 cellPadding=0>
						<TBODY>
							<c:if test="${flag=='topic' }">

								<c:forEach items="${topicPage.content }" var="topic"
									varStatus="status">
									<TR>
										<TD><LABEL><A
												href="${pageContext.request.contextPath}/board?id=${topic.board.id}"
												target=_blank>${topic.board.name }</A>&nbsp;&nbsp;|&nbsp;&nbsp;${topic.postTime }</LABEL>
											<A
											href="${pageContext.request.contextPath}/topic?id=${topic.id }"
											target=_blank>${status.count}. ${topic.title }</A>

											<p>
												最后发表 <A
													href="${pageContext.request.contextPath}/board?id=${topic.board.id}"
													target="_blank">${topic.lastReplyTime }</A>&nbsp;&nbsp;|&nbsp;&nbsp;回复(${topic.replyTimes })
												&nbsp;|&nbsp;&nbsp;查看(${topic.viewTimes })
											</p></TD>
									</TR>
								</c:forEach>
							</c:if>
							<c:if test="${flag=='reply' }">
								<c:forEach items="${replyPage.content }" var="reply" varStatus="status">
									<TR>
										<TD><LABEL><A href="${pageContext.request.contextPath}/board?id=${reply.topic.board.id}"
												target="_blank">${reply.topic.board.name }</A> &nbsp;|&nbsp;&nbsp;${reply.time}
										</LABEL> <A href="${pageContext.request.contextPath}/topic?id=${reply.topic.id }&rid=2" target=_blank
											class="subject">${status.count}. 主题: ${reply.topic.title} (RID:${reply.id})</A></TD>
									</TR>


								</c:forEach>

							</c:if>

						</TBODY>
					</TABLE>
				</DIV>
				<DIV class=pages_btns></DIV>
			</DIV>

			<DIV class=side style="width: 24%">
				<DIV>
					<H2>个人信息</H2>
					<UL style="padding-bottom: 12px">
						<LI class="side_info" style="padding-top: 2px">
							<H3>
								<c:if test="${userInfo.showHead}">
									<IMG src="${userInfo.heanImage }" border=0
										onload="resizeImage(this, 150);">
								</c:if>
								<c:if test="!${userInfo.showHead}">
									<IMG
										src="${pageContext.request.contextPath}/media/images/avatar/unknown.gif"
										border=0 onload="resizeImage(this, 150);">
								</c:if>
							</H3>
						</LI>
						<LI class="side_info"><H3>${userInfo.user.username }</H3></LI>
						<LI class="side_info">
							<H3>
								<IMG
									src="${pageContext.request.contextPath}/media/images/user_add.gif"
									align="absmiddle" border="0">&nbsp; <A
									href="./member/my_addfriend.jsp?uid=aaa" target=_blank>加为好友</A>&nbsp;&nbsp;
								<IMG
									src="${pageContext.request.contextPath}/media/images/sendsms.gif"
									align="absmiddle" border="0">&nbsp; <A
									href="./member/sms_compose.jsp?uid=aaa" target=_blank>发短消息</A>
							</H3>
						</LI>
					</UL>

				</DIV>
				<DIV style="padding-bottom: 5px;">
					<H2>详细信息</H2>
					<table class="info" border="0" cellspacing="0" cellpadding="0"
						width="100%">
						<tr>
							<th>用户名</th>
							<td>${userInfo.user.username }</td>
						</tr>
						<tr>
							<th>昵称</th>
							<td>${userInfo.user.nickname}</td>
						</tr>
						<tr>
							<th>用户组</th>
							<td>${userInfo.user.group.name }</td>
						</tr>
						<tr>
							<th>帖子</th>
							<td>${userInfo.totalPost }</td>
						</tr>
						<tr>
							<th>注册日期</th>
							<td>${userInfo.user.createDate }</td>
						</tr>
						<tr>
							<th>上次访问</th>
							<td>${userInfo.lastLoginTime }</td>
						</tr>
						<tr>
							<th>性别</th>
							<td>${userInfo.sex }</td>
						</tr>
						<tr>
							<th>生日</th>
							<td>${userInfo.birthday}</td>
						</tr>
						<tr>
							<th>来自</th>
							<td>${userInfo.nativePlace}</td>
						</tr>
						<tr>
							<th>个人主页</th>
							<td><a href="http://" target="_blank"></a></td>
						</tr>
						<tr>
							<th>QQ/MSN</th>
							<td></td>
						</tr>
						<tr>
							<th>Email</th>
							<td>${userInfo.user.email}</td>
						</tr>
					</table>
				</DIV>
			</DIV>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>

</BODY>
</HTML>