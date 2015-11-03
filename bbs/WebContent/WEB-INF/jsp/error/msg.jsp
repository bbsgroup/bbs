<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0049)http://localhost:8080/ejforum/perform.jsp?act=lgn -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
<link href="${pageContext.request.contextPath}/media/css/forum.css"
	type="text/css" rel="stylesheet">
</head>
<body onkeydown="if(event.keyCode==27) return false;">
	<script src="${pageContext.request.contextPath}/media/js/common.js"
		type="text/javascript"></script>

	<div class="wrap">
		<div id="header">
			<h2>
				<a href="${pageContext.request.contextPath}/index"><img
					alt="unnamed"
					src="${pageContext.request.contextPath}/media/images/logo.gif"
					border="0"></a>
			</h2>
		</div>
		<ul class="popmenu_popup headermenu_popup" id="advsearch_menu"
			style="width: 60px; position: absolute; z-index: 50; clip: rect(auto, auto, auto, auto); left: 1055px; top: 117px; display: none;">
			<li style="width: 60px"><a
				href="http://localhost:8080/ejforum/advsearch.jsp">网页搜索</a></li>
			<li style="width: 60px"><a
				href="javascript:searchImages('localhost/ejforum');">图片搜索</a></li>
		</ul>
		<div id="headermenu">
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/forum/user/registerPage">注册</a></li>
				<li><a
					href="${pageContext.request.contextPath}/forum/user/loginPage">登录</a></li>
				<li><a href="http://localhost:8080/ejforum/feeds.jsp">订阅</a></li>
				<li><a href="http://localhost:8080/ejforum/userlist.jsp">会员列表</a></li>
				<li class="dropmenu" id="advsearch" onmouseover="showMenu(this.id)"
					style="BACKGROUND-POSITION: 94%"><a
					href="http://localhost:8080/ejforum/advsearch.jsp">搜索</a></li>
				<li><a href="http://localhost:8080/ejforum/help/index.jsp">帮助</a></li>
			</ul>
		</div>

		<div id="nav">
			<a href="http://localhost:8080/ejforum/index.jsp">unnamed</a> » 提示信息
		</div>
		<div class="box message">
			<h1>unnamed&nbsp;-&nbsp;提示信息</h1>

			<p align="center">
				<c:out value="${ex}"></c:out>
			</p>
			<p align="center">
				<a href="javascript:history.back()">[&nbsp;点击这里返回上一页&nbsp;]</a>
			</p>
		</div>
		<p>&nbsp;</p>
	</div>


	<div id="footer">
		<div class="wrap">
			<div id="footlinks">
				<p>当前时区&nbsp;GMT+8, 现在时间是&nbsp;2015-10-25 10:22</p>
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
</body>
</html>
