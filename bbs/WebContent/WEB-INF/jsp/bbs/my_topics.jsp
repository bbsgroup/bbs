<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>我的话题 - 首页</TITLE>
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
<SCRIPT
	src="${pageContext.request.contextPath}/media/js/jquery-1.10.0.js"
	type=text/javascript></SCRIPT>
<SCRIPT
	src="${pageContext.request.contextPath}/media/js/jquery.validate-1.13.1.js"
	type=text/javascript></SCRIPT>
</HEAD>
<BODY>

	<DIV class=wrap>

		<%@include file="head.jsp"%>
		<DIV id=nav>
			<A href="${pageContext.request.contextPath}/index">首页</A>
			&raquo;&nbsp; 我的话题
		</DIV>
		<DIV class=container>
			<DIV class=content>
				<DIV class=mainbox>
					<H1>我的话题</H1>
					<UL class="tabs headertabs">
						<LI class=current><A
							href="${pageContext.request.contextPath}/forum/user/my_topics">我的主题</A>
						</LI>
						<LI><A
							href="${pageContext.request.contextPath}/forum/user/my_topics?act=replied">最新回复</A></LI>
						<LI><A
							href="${pageContext.request.contextPath}/forum/user/my_topics?act=reply">我的回复</A></LI>
					</UL>
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<THEAD>
							<TR>

								<TD WIDTH="50%">标题</TD>
								<TD WIDTH="13%">版块</TD>
								<TD WIDTH="10%">查看/回复</TD>
								<TD WIDTH="17%">发表时间</TD>
								<TD WIDTH="10%">置顶状态</TD>

							</TR>
						</THEAD>
						<TBODY>
							<c:forEach items="${page.content }" var="topic"
								varStatus="status">
								<TR>
									<TD><A
										href="${pageContext.request.contextPath}/topic?id=${topic.id }"
										target=_blank>${status.count}. ${topic.title }</A></TD>
									<TD><A
										href="${pageContext.request.contextPath}/board?id=${topic.board.id}"
										target=_blank>${topic.board.name }</A></TD>
									<TD>${topic.viewTimes }/${topic.replyTimes }</TD>
									<TD>${topic.postTime }</TD>
									<TD><c:if test="${topic.topType==0}">
											<c:out value="非置頂"></c:out>
										</c:if> <c:if test="${topic.topType==1}">
											<c:out value="本版置顶"></c:out>
										</c:if> <c:if test="${topic.topType==2}">
											<c:out value="分区置顶"></c:out>
										</c:if> <c:if test="${topic.topType==3}">
											<c:out value="全局置顶"></c:out>
										</c:if></TD>
								</TR>
							</c:forEach>

						</TBODY>
					</TABLE>
				</DIV>
				<div class="pages_btns">


					<%@ include file="/WEB-INF/jsp/common/bbspage.jspf"%>


				</div>
			</DIV>
			<%@include file="my_space.jsp"%>
		</DIV>
	</DIV>

	<%@include file="foot.jsp"%>
</BODY>
</HTML>