<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<SCRIPT src="${pageContext.request.contextPath}/media/js/member.js"
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
			<div id="headsearch">
				<p style="margin-bottom: 5px; margin-right: 2px">
					主题: <em>0</em>&nbsp; 帖子: <em>0</em>&nbsp; <a
						href="#spec_topics.jsp?spec=pic" title="图片主题">图片</a><em>: 0</em>&nbsp;

					<a href="#spec_topics.jsp?spec=digest" title="精华主题">精华</a><em>:
						0</em>&nbsp; <a title="RSS 频道列表" href="#feeds.jsp"><img
						alt="RSS 频道列表"
						src="${pageContext.request.contextPath}/media/images/rss_sub.gif"
						align="absmiddle">订阅</a>&nbsp;
				</p>
				<form id="frmsearch" name="frmsearch"
					action="http://www.google.com.hk/search"
					onsubmit="doSearch(); return false;" method="get"
					target="google_window">
					<input type="hidden" value="localhost/ejforum" name="sitesearch">
					<div style="float: left; width: 100px">&nbsp;</div>
					<div
						onclick="javascript:window.open(&#39;http://www.google.com.hk/&#39;)"
						style="cursor: pointer; float: left; width: 70px; height: 23px; background: none; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=&amp;#39;images/google.png&amp;#39;,sizingMethod=&amp;#39;scale&amp;#39;)"></div>
					&nbsp; <input maxlength="255" size="12" name="q" class="search"><input
						type="hidden" value="UTF-8" name="ie"><input type="hidden"
						value="UTF-8" name="oe"><input type="hidden" value="zh-CN"
						name="hl">&nbsp; <a href="#index.jsp#"
						onclick="doSearch();return false;" style="vertical-align: middle"><img
						src="${pageContext.request.contextPath}/media/images/search.gif"
						border="0" alt="站内搜索" align="absbottom"></a>
				</form>
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
								<td class="nums">0</td>
								<td class="nums">0</td>
								<td class="lastpost">无</td>
							</tr>

						</c:forEach>

					</tbody>

				</table>
			</div>



		</c:forEach>






		<div class="box">
			<span class="headactions"><img id="forumlinks_img"
				onclick="toggle_collapse(&#39;forumlinks&#39;);"
				src="${pageContext.request.contextPath}/media/images/collapsed_no.gif"></span>
			<h4>论坛联盟</h4>
			<table id="forumlinks" cellspacing="0" cellpadding="0"
				class="forumlinks">
				<tbody>
					<tr>
						<td><a href="http://www.21works.cn/wisbook/index.html"
							target="_blank" style="FLOAT: right"></a>
							<h5>
								<a href="http://www.21works.cn/" target="_blank">21works
									经典阅读</a>
							</h5>
							<p>文学、历史、哲学、艺术经典作品在线阅读乐园 -&nbsp; 改变生活，从阅读开始</p></td>
					</tr>
					<tr>
						<td>
							<h5>
								<a href="http://www.easyjforum.cn/" target="_blank">EasyJForum
									免费论坛</a>
							</h5>
							<p>为中小网站提供最好的免费论坛、留言板以及免费调查服务</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="box" id="online">
			<h4>
				<strong>在线会员</strong>&nbsp;&nbsp;-&nbsp;&nbsp;共&nbsp;<em>2</em>
				人在线，其中会员&nbsp;<em>1</em> 人&nbsp;-&nbsp;&nbsp;最高记录是&nbsp;<em>2</em>&nbsp;
				于&nbsp;<em>2015-10-12 15:29</em>
			</h4>
		</div>

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