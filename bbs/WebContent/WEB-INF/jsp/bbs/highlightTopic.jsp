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
<form method="post" action="${pageContext.request.contextPath}/highlightTopic?boardId=${board.id}" >
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
			<th>字体颜色</th>
			<td>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="red" checked/><em style="background: red;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="orange" /><em style="background: orange;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="yellow" /><em style="background: yellow;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="green" /><em style="background: green;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="cyan" /><em style="background: cyan;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="blue" /><em style="background: blue;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="purple" /><em style="background: purple;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="black" /><em style="background: black;"></em></label><br/>
			<label class="highlight" style="clear:left"><input class="radio" type="radio" name="lightcolor" 
				value="#C33" /><em style="background: #C33;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#C96" /><em style="background: #C96;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#CC6" /><em style="background: #CC6;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#399" /><em style="background: #399;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#6C9" /><em style="background: #6C9;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#669" /><em style="background: #669;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#C6C" /><em style="background: #C6C;"></em></label>
			<label class="highlight"><input class="radio" type="radio" name="lightcolor" 
				value="#666" /> <em style="background: #666;"></em></label>				
			<label class="highlight" style="width:65px"><input class="radio" type="radio" name="lightcolor" 
				value=""/><em style="width:40px"> 不高亮</em></label>
			</td>
		</tr>


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