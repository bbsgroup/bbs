<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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


<script
	src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>

<body onkeydown="if(event.keyCode==27) return false;">
	<script src="${pageContext.request.contextPath}/media/images/common.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/media/images/ajax.js"
		type="text/javascript"></script>

	<div class="wrap">
		<%@include file="head.jsp"%>

		<div id="foruminfo">
			<div id="nav">
				<div id="nav">
					<a href="${pageContext.request.contextPath}/index">bbs</a> »&nbsp;
					<a
						href="${pageContext.request.contextPath}/board?id=${board.id}">${board.name }</a>
					»关闭/打开主题;
				</div>
			
			</div>

		</div>
<form method="post" action="${pageContext.request.contextPath}/closeTopic?boardId=${board.id}" >
	<c:forEach items="${topicIds }" var="item">
	<input type="hidden" name="chkTopicID" value="${item }">
	</c:forEach>
	
	<div class="mainbox formbox">
	<h1>关闭/打开主题 -&nbsp; 选中的帖子数: 2</h1>
	<table summary="Operating" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th>用户名</th>
			<td>${currentUser.username }</td>
		</tr>
		
	</thead>
				
		<tbody>
		<tr>
			<th>操作</th>
			<td><label><input class="radio" type="radio" name="state" value="0" 
							  /> 打开主题</label> &nbsp;
				<label><input class="radio" type="radio" name="state" value="1"
							  checked/> 关闭主题</label>
			</td>
		</tr>
		
		<tr>
			<th valign="top">操作原因</th>
			<td>
			<select id="reasons" name="reasons" onchange="this.form.reason.value=this.value" style="width:110px;">
			<option value="">自定义</option>
			<option value="">------------</option>

			<option value="垃圾广告">
				垃圾广告</option>

			<option value="恶意灌水">
				恶意灌水</option>

			<option value="违规内容">
				违规内容</option>

			<option value="文不对题">
				文不对题</option>

			<option value="重复发帖">
				重复发帖</option>

			<option value="">
				------------</option>

			<option value="我很赞同">
				我很赞同</option>

			<option value="精品文章">
				精品文章</option>

			<option value="原创内容">
				原创内容</option>

			</select>&nbsp;
		<input type="text" id="reason" name="reason" size="50" maxlength="40">
			</td>
		</tr>

		
		<tr class="btns">
			<th>&nbsp;</th>
			<td height="35"><button type="submit" name="modsubmit" id="postsubmit" class="submit">提交</button></td>
		</tr>
	</tbody></table>
<input type="hidden" name="topicID" value="8"> <input type="hidden" name="topicID" value="7"> 

	</div>
</form>

		



	<%@include file="foot.jsp"%>


</body>
</html>