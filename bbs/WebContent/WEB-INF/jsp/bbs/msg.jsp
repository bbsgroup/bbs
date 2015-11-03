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
		<%@include file="head.jsp"%>

		<div id="nav">
			<a href="${pageContext.request.contextPath}/index">论坛首页</a> » 提示信息
		</div>
		<div class="box message">
			<h1>提示信息</h1>

			<p align="center">
				${message }
			</p>
			<p align="center">
				<a href="javascript:history.back()">[&nbsp;点击这里返回上一页&nbsp;]</a>
			</p>
		</div>
		<p>&nbsp;</p>
	</div>


	<%@include file="foot.jsp"%>
</body>
</html>
