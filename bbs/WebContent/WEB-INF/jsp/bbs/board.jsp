<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbs</title>
<meta name="keywords" content="">
<meta name="description" content="bbs">
<link href="${pageContext.request.contextPath}/media/css/forum.css"
	type="text/css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/media/js/common.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/media/js/ajax.js"
	type="text/javascript"></script>
	
	
<body onkeydown="if(event.keyCode==27) return false;">
	<script src="${pageContext.request.contextPath}/media/images/common.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/media/images/ajax.js" type="text/javascript"></script>

	<div class="wrap">
		<div id="header">
			<h2>
				<a href="http://localhost:9999/"><img alt="unnamed"
					src="${pageContext.request.contextPath}/media/images/logo.gif" border="0"></a>
			</h2>

		</div>
		<ul class="popmenu_popup headermenu_popup" id="advsearch_menu"
			style="DISPLAY: none; width: 60px">
			<li style="width: 60px"><a
				href="http://localhost:9999/advsearch.jsp">网页搜索</a></li>
			<li style="width: 60px"><a
				href="javascript:searchImages('localhost');">图片搜索</a></li>
		</ul>
		<div id="headermenu">
			<ul>
				<li><a href="http://localhost:9999/register.jsp">注册</a></li>
				<li><a href="http://localhost:9999/login.jsp">登录</a></li>
				<li><a href="http://localhost:9999/feeds.jsp">订阅</a></li>
				<li><a href="http://localhost:9999/userlist.jsp">会员列表</a></li>
				<li class="dropmenu" id="advsearch" onmouseover="showMenu(this.id)"
					style="BACKGROUND-POSITION: 94%"><a
					href="http://localhost:9999/advsearch.jsp">搜索</a></li>
				<li><a href="http://localhost:9999/help/index.jsp">帮助</a></li>
			</ul>
		</div>

		<div id="foruminfo">
			<div id="nav">
				<p>
					<a href="http://localhost:9999/index.jsp">unnamed</a> »&nbsp; 论坛公告
				</p>
				<p>
					版主: <a href="http://localhost:9999/uspace.jsp?uid=user1"
						target="_blank">user1</a>
				</p>
			</div>
			<div id="headsearch">
				<form id="frmsearch" name="frmsearch"
					action="http://www.google.com.hk/search"
					onsubmit="doSearch(); return false;" method="get"
					target="google_window">
					<input type="hidden" value="localhost" name="sitesearch">
					<div
						onclick="javascript:window.open(&#39;http://www.google.com.hk/&#39;)"
						style="cursor: pointer; float: left; width: 70px; height: 23px; background: url(images/google.png) ! important; background: none; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src=&amp;#39;images/google.png&amp;#39;,sizingMethod=&amp;#39;scale&amp;#39;)"></div>
					&nbsp; <input maxlength="255" size="12" name="q" class="search"><input
						type="hidden" value="UTF-8" name="ie"><input type="hidden"
						value="UTF-8" name="oe"><input type="hidden" value="zh-CN"
						name="hl">&nbsp; <a
						href="http://localhost:9999/forum-2.html#"
						onclick="doSearch(); return false;" style="vertical-align: middle">
						<img src="${pageContext.request.contextPath}/media/images/search.gif" border="0"
						alt="站内搜索" align="absbottom">
					</a>
				</form>
			</div>
		</div>
		<div id="ad_text"></div>

		<div class="pages_btns">

			<span class="postbtn" id="newtopic"
				onmouseover="$(&#39;newtopic&#39;).id = &#39;newtopictmp&#39;;this.id = &#39;newtopic&#39;;showMenu(this.id);">
				<a href="http://localhost:9999/post.jsp?fid=2"><img alt="发新话题"
					src="${pageContext.request.contextPath}/media/images/newtopic.gif" border="0"></a>
			</span>
		</div>
		<ul class="popmenu_popup newtopicmenu" id="newtopic_menu"
			style="display: none">
			<li><a href="${pageContext.request.contextPath}/newTopic?id=${board.id}">发新话题</a></li>
			<li class="vote"><a
				href="http://localhost:9999/post.jsp?fid=2&act=vote">发布投票</a></li>
			
		</ul>
		<div id="headfilter">
			<ul class="tabs">
				<li class="spec"><a
					href="${pageContext.request.contextPath}/media/images/论坛公告1 - unnamed.html">全部</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=hot">热门</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=digest">精华</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=pic">图片</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=vote">投票</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=reward">悬赏</a></li>

			</ul>
		</div>
		<div class="mainbox topiclist">

			<h1>
				<a href="${pageContext.request.contextPath}/media/images/论坛公告1 - unnamed.html">论坛公告</a>&nbsp;
			</h1>

			<table cellspacing="0" cellpadding="0">
				<thead class="category">
					<tr>
						<td>&nbsp;</td>
						<td>主题</td>
						<td class="author">作者</td>

						<td class="nums">回复&nbsp;/&nbsp;查看</td>

						<td class="lastpost">最后发表</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td class="folder"><a title="新窗口打开"
							href="http://localhost:9999/topic-1.html" target="_blank"><img
								src="${pageContext.request.contextPath}/media/images/folder_common.gif"></a></td>
						<td><label><img alt="精华"
								src="${pageContext.request.contextPath}/media/images/digest.gif" align="absmiddle">&nbsp;</label>

							<label><img alt="全局置顶"
								src="${pageContext.request.contextPath}/media/images/top_1.gif" align="absmiddle">&nbsp;</label>

							<a href="http://localhost:9999/topic-1.html" style="color: red"
							class="headline">haha</a></td>
						<td class="author"><cite><a
								href="http://localhost:9999/uspace.jsp?uid=administrator">系统管理员</a>
						</cite><em>2015-10-12 16:27</em></td>

						<td class="nums"><span>2</span> / <em>4</em></td>

						<td class="lastpost"><em><a
								href="http://localhost:9999/topic-1.html?page=999">2015-10-12
									16:28</a></em> <cite>by <a
								href="http://localhost:9999/uspace.jsp?uid=administrator">系统管理员</a>
						</cite></td>
					</tr>
				</tbody>

			</table>

		</div>
		<div class="pages_btns">

			<span class="postbtn" id="newtopictmp"
				onmouseover="$(&#39;newtopic&#39;).id = &#39;newtopictmp&#39;;this.id = &#39;newtopic&#39;;showMenu(this.id);">
				<a href="http://localhost:9999/post.jsp?fid=2"><img alt="发新话题"
					src="${pageContext.request.contextPath}/media/images/newtopic.gif"></a>
			</span>
		</div>

		<div class="legend" id="footfilter">
			<div class="jump_sort">
				<form id="frmsort" name="frmsort"
					action="${pageContext.request.contextPath}/media/images/论坛公告1 - unnamed.html" method="post">
					<select
						onchange="if(this.options[this.selectedIndex].value != &#39;&#39;){window.location = this.options[this.selectedIndex].value;}">
						<option value="" selected="">版块跳转 ...</option>
						<optgroup label="站务管理">
							<option value="./forum-2.html">&nbsp; &gt; 论坛公告</option>
							<option value="./forum-3.html">&nbsp; &gt; 站务管理</option>
						</optgroup>
					</select>&nbsp; <select name="sort" id="sortfield"
						onchange="$(&#39;frmsort&#39;).submit();">
						<option value="lastPostTime" selected="">按回复时间排序</option>
						<option value="createTime">按发布时间排序</option>
						<option value="replies">按回复数量排序</option>
						<option value="visits">按浏览次数排序</option>

						<option value="A_lastPostTime">按回复时间排序(升序)</option>
						<option value="A_createTime">按发布时间排序(升序)</option>
					</select> <input type="hidden" value="all" name="spec">
				</form>
			</div>
			<div>
				<label><img alt="正常主题"
					src="${pageContext.request.contextPath}/media/images/folder_common.gif">正常主题</label> <label><img
					alt="热门主题" src="${pageContext.request.contextPath}/media/images/folder_hot.gif">热门主题</label>
				<label><img alt="关闭主题"
					src="${pageContext.request.contextPath}/media/images/folder_lock.gif">关闭主题</label>
			</div>
		</div>
		<script type="text/javascript">
$('sortfield').value = "lastPostTime";
</script>
	</div>



	<div id="footer">
		<div class="wrap">
			<div id="footlinks">
				<p>当前时区&nbsp;GMT+8, 现在时间是&nbsp;2015-10-22 15:32</p>
				<p>
					<span class="scrolltop" title="顶部" onclick="window.scrollTo(0,0);">TOP</span>
				</p>
			</div>
			<p class="copyright">
				Powered by <strong><a href="http://www.easyjforum.cn/"
					target="_blank">EasyJForum</a></strong> <em>3.0</em> © 2005-2015 <a
					href="http://www.hongshee.com/" target="_blank">Hongshee
					software</a>
			</p>
		</div>
	</div>

	<div>
		<object id="ClCache" click="sendMsg" host="" width="0" height="0"></object>
	</div>
</body>
</html>