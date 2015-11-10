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
<link href="${pageContext.request.contextPath}/media/css/forum.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/media/kindeditor/default/default.css"
	type="text/css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/media/js/common.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/media/kindeditor/kindeditor-min.js"></script>
<script
	src="${pageContext.request.contextPath}/media/kindeditor/zh_CN.js"></script>
<script
	src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>

<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
	});
</script>
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
						href="${pageContext.request.contextPath}/board?id=${topic.board.id}">${topic.board.name }</a>
					»&nbsp; ${topic.title }
				</div>
				<p>版主: ${topic.board.moderators}</p>
			</div>

		</div>

		<div class="mainbox viewtopic">

			<c:if test="${page.currentPage<2 }">
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td class="postauthor" rowspan="3"><cite><a
									href="javascript:void(0);" target="_blank">${topic.author.username }</a></cite>

								<div class="avatar">
									<a href="javascript:void(0);" target="_blank" title="系统管理员"><img
										src="${pageContext.request.contextPath}/media/images/avatar/12.jpg"
										border="0" onload="resizeImage(this, 150);"></a>
								</div>


								<dl class="profile">
									<dt>帖子&nbsp;</dt>
									<dd>36&nbsp;</dd>
								</dl>
								<ul>
									<li class="friend"><a href="javascript:void(0);"
										target="_blank">加为好友</a></li>
									<li class="sms"><a href="javascript:void(0);"
										target="_blank">发短消息</a></li>
								</ul></td>
							<td class="postdetail">
								<div class="postinfo">
									<strong>0<sup>#</sup></strong> 发表于
									<fmt:formatDate value="${topic.postTime }"
										pattern="yyyy-MM-dd HH:mm" />
								</div>
								<div class="postcontent">
									<h2>${topic.title }</h2>
									<div id="content_0" class="contentmsg">${topic.content }</div>

								</div>
								<c:if test="${fn:length(topic.attachments)>0}">
								<div class="box attachlist">
									<br>
									<p class="attach">附件</p>
								
									<c:forEach items="${topic.attachments }" var="attach">
									<dl class="p_attachlist">
										<dt>
											<img src="${pageContext.request.contextPath}/media/images/i_attach.gif"
												border="0" class="absmiddle">&nbsp;&nbsp; <a
												href="${pageContext.request.contextPath}/downloadAttachment?id=${attach.id}" class="bold">${attach.filename }</a>&nbsp;&nbsp;<em
												class="num">(<fmt:formatNumber value=" ${attach.size/1024}" pattern="#,#00.0#"/> KB)</em>
										</dt>
										<dd>
											<p>
												下载次数: <em class="num">${attach.downloadTimes}</em>
											</p>
										</dd>
									</dl>
									</c:forEach>
									
								</div>
								</c:if>

							</td>
						</tr>
						<tr>
							<td class="postsign"></td>
						</tr>
						<tr>
							<td class="postfooter">
								<div class="postactions">
									<p>

										<c:if test="${isModerator }">
											<a href="javascript:doManage('delete', '0');">删除</a>&nbsp;&nbsp;</c:if>

										<a href="javascript:doReply('0','系统管理员');">回复</a> &nbsp;&nbsp;<a
											href="javascript:doReport('0');">举报</a>&nbsp;&nbsp; <span
											title="顶部" class="scrolltop" onclick="scroll(0,0)">TOP</span>
									</p>
									<div></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>


			<c:forEach items="${page.content }" var="reply">

				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td class="postauthor" rowspan="3"><cite><a
									href="javascript:void(0);" target="_blank">${reply.author.username }</a></cite>

								<div class="avatar">
									<a href="javascript:void(0);" target="_blank"><img
										src="${pageContext.request.contextPath}/media/images/avatar/12.jpg"
										border="0" onload="resizeImage(this, 150);"></a>
								</div>


								<dl class="profile">
									<dt>帖子&nbsp;</dt>
									<dd>36&nbsp;</dd>
								</dl>
								<ul>
									<li class="friend"><a href="javascript:void(0);"
										target="_blank">加为好友</a></li>
									<li class="sms"><a href="javascript:void(0);"
										target="_blank">发短消息</a></li>
								</ul></td>
							<td class="postdetail">
								<div class="postinfo">
									<strong>${reply.floor }<sup>#</sup></strong> 发表于
									<fmt:formatDate value="${reply.time }"
										pattern="yyyy-MM-dd HH:mm" />
								</div>
								<div class="postcontent">

									<div id="content_0" class="contentmsg">${reply.content }</div>

								</div>
							</td>
						</tr>
						<tr>
							<td class="postsign"></td>
						</tr>
						<tr>
							<td class="postfooter">
								<div class="postactions">
									<p>

										<c:if test="${isModerator }">
											<a href="javascript:doManage('delete', '0');">删除</a>&nbsp;&nbsp;</c:if>

										<a href="javascript:doReport('0');">举报</a>&nbsp;&nbsp; <span
											title="顶部" class="scrolltop" onclick="scroll(0,0)">TOP</span>
									</p>
									<div></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>


			</c:forEach>


		</div>



		<div class="pages_btns">



			<%@ include file="/WEB-INF/jsp/common/bbspage.jspf"%>


		</div>

		<form id="postform" name="postform"
			action="${pageContext.request.contextPath}/reply" method="post">
			<input type="hidden" value="${topic.id }" name="id">
			<div id="quickreply" class="box">
				<h4>快速回复主题</h4>
				<table cellspacing="0" cellpadding="0">
					<tbody>

						<tr>
							<td valign="top" style="width: 168px">内容 <br> <br>

							</td>
							<td><textarea name="content"
									style="height: 200px; visibility: hidden;"></textarea></td>
						</tr>
						<tr>
							<th></th>
							<th>
								<button id="postbtn" tabindex="9" name="post_reply"
									type="submit" class="submit" style="width: 110px">发表回复</button>
							</th>
						</tr>

					</tbody>
				</table>
			</div>
		</form>

	</div>



	<%@include file="foot.jsp"%>


</body>
</html>