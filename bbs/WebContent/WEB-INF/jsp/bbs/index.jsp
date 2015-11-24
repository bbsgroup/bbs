<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbs</title>
<meta name="keywords" content="">
<meta name="description" content="bbs">
<LINK href="${pageContext.request.contextPath}/media/css/forum.css"
	type=text/css rel=stylesheet>
<SCRIPT src="${pageContext.request.contextPath}/media/js/common.js"
	type=text/javascript></SCRIPT>

<SCRIPT src="${pageContext.request.contextPath}/media/js/ajax.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="${pageContext.request.contextPath}/media/js/md5.js"
	type=text/javascript></SCRIPT>


</head>


<body onkeydown="if(event.keyCode==27) return false;"
	style="backgroud-color: red">

	<div class="wrap">

		<%@include file="head.jsp"%>

		<div id="foruminfo">
			<div id="nav">
				<p></p>
				<c:if test="${ empty sessionScope.currentUser}">
				
				
				<form id="loginform" method="post" name="login"
					action="${pageContext.request.contextPath}/forum/user/login"
					style="vertical-align: middle"
					>
					<!-- onsubmit="checkfield(this); return false;" -->
					<input type="hidden" name="cookietime" value="0/"> <input
						type="text" id="userID" name="username" size="13" maxlength="30"
						tabindex="1/"> <input type="password" id="pwd1"
						name="password" size="8" tabindex="2/"><input
						type="hidden" id="pwd" name="pwd">&nbsp;
					<button type="submit" name="loginsubmit" tabindex="3"
						style="width: 46px">登录</button>
				</form>
				</c:if>
				<p></p>
				<script src="${pageContext.request.contextPath}/media/css/md5.js"
					type="text/javascript"></script>
				<!-- 				<script type="text/javascript">
function checkfield(theform) {
	if(trim($('userID').value) == '') {
		$('userID').focus();	return false;
	} else if(trim($('pwd1').value) == '') {
		$('pwd1').focus(); return false;
	} else {
		$('pwd').value = hex_md5(trim($('pwd1').value)); 
		$('pwd1').value = '';
		theform.submit();return false;
	}
}
</script> -->

			</div>
	
		</div>
		<div id="ad_text"></div>

		<c:forEach items="${categorys }" var="category">

			<div class="mainbox forumlist">
				<span class="headactions"><img id="section_0_img"
					title="收起/展开"
					onclick="toggle_collapse(&#39;section_${category.id }&#39;);"
					alt="收起/展开"
					src="${pageContext.request.contextPath}/media/images/collapsed_no.gif"></span>
				<h3>
					<a href="#">${category.name}</a>
				</h3>
				
				<table id="section_${category.id }" cellspacing="0" cellpadding="0">

					<thead class="category">
						<tr>
							<th>版块</th>
							<td class="nums">主题</td>
							<td class="nums">帖数</td>
							<td class="lastpost">最后发表</td>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${category.boards}" var="board">
							<tr>
								<th>
									<h2>
										<a
											href="${pageContext.request.contextPath}/board?id=${board.id}">${board.name }</a>
									</h2>
									<p></p>
									<p class="moderators">
										版主:
										<c:if test="${empty board.moderators}">空缺中</c:if>
										${board.moderators }
									</p>
								</th>
								<td class="nums">${board.topicTimes }</td>
								<td class="nums">${board.replyTimes }</td>
								<td class="lastpost"><em><a href="${pageContext.request.contextPath}/topic?id=${board.lastReplyId}&pageNum=<%= Integer.MAX_VALUE%>">
											<fmt:formatDate value="${board.lastPostTime}"
												pattern="yyyy-MM-dd HH:mm" />

									</a></em></td>
							</tr>

						</c:forEach>

					</tbody>

				</table>
			</div>



		</c:forEach>




		<div class="legend">
			<label><img alt="有新帖的版块" align="absmiddle"
				src="${pageContext.request.contextPath}/media/images/forum_new.gif">有新帖的版块</label>
			<label><img alt="无新帖的版块" align="absmiddle"
				src="${pageContext.request.contextPath}/media/images/forum.gif">无新帖的版块</label>
		</div>
	</div>

	<%@include file="foot.jsp"%>
</body>
</html>
