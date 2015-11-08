<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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

<body onkeydown="if(event.keyCode==27) return false;">



	<div class="wrap">
		<%@include file="head.jsp"%>

		<div id="foruminfo">
			<div id="nav">
				<p>
					<a href="${pageContext.request.contextPath}/index">论坛首页</a> »&nbsp;
					${board.name }
				</p>
				<p>
					版主: <a href="#" target="_blank"></a>
				</p>
			</div>

		</div>

		<div class="pages_btns">

			<span class="postbtn" id="newtopic"
				onmouseover="$(&#39;newtopic&#39;).id = &#39;newtopictmp&#39;;this.id = &#39;newtopic&#39;;showMenu(this.id);">
				<a href="javascript:void(0);"><img alt="发新话题"
					src="${pageContext.request.contextPath}/media/images/newtopic.gif"
					border="0"></a>
			</span>
		</div>
		<ul class="popmenu_popup newtopicmenu" id="newtopic_menu"
			style="display: none">
			<li><a
				href="${pageContext.request.contextPath}/newTopic?id=${board.id}">发新话题</a></li>
			<li class="vote"><a
				href="http://localhost:9999/post.jsp?fid=2&act=vote">发布投票</a></li>

		</ul>
		<div id="headfilter">
			<ul class="tabs">
				<li class="spec"><a href="#">全部</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=hot">热门</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=digest">精华</a></li>

				<li><a href="http://localhost:9999/forum.jsp?fid=2&spec=vote">投票</a></li>

			</ul>
		</div>
		<div class="mainbox topiclist">

			<form name="frmmanage"
				action="#" method="post">

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

					<c:forEach items="${topAll }" var="topic">
						<tbody>
							<tr>
								<td class="folder"><a title="新窗口打开" href="#"
									target="_blank"><img
										src="${pageContext.request.contextPath}/media/images/folder_common.gif"></a></td>
								<td><c:if test="${topic.sssence }">
										<label><img alt="精华"
											src="${pageContext.request.contextPath}/media/images/digest.gif"
											align="absmiddle">&nbsp;</label>

									</c:if> 
									
									<label><img alt="全局置顶"
										src="${pageContext.request.contextPath}/media/images/top_1.gif"
										align="absmiddle">&nbsp;</label> <c:if test="${isModerator }">
									<input class="checkbox"
									type="checkbox" name="chkTopicID" value="${topic.id }">	
										</c:if>
									<a href="${pageContext.request.contextPath}/topic?id=${topic.id }" class="headline">${topic.title }</a></td>
								<td class="author"><cite><a
										href="javascript:void(0);">${topic.author.username }</a>
								</cite><em>
								<fmt:formatDate value="${topic.postTime }" pattern="yyyy-MM-dd HH:mm"/>
								
								</em></td>

								<td class="nums"><span>
								
								${topic.replyTimes}</span> / <em>${topic.viewTimes}</em></td>

								<td class="lastpost"><em><a
										href="javascript:void(0);">
											<fmt:formatDate value="${topic.lastReplyTime}" pattern="yyyy-MM-dd HH:mm"/>
										
											</a></em> <cite>by <a
										href="javascript:void(0);">${topic.lastReplyName}</a>
								</cite></td>
							</tr>


						</tbody>

					</c:forEach>
					
					
					
					<c:forEach items="${topCategory }" var="topic">
						<tbody>
							<tr>
								<td class="folder"><a title="新窗口打开" href="#"
									target="_blank"><img
										src="${pageContext.request.contextPath}/media/images/folder_common.gif"></a></td>
								<td><c:if test="${topic.sssence }">
										<label><img alt="精华"
											src="${pageContext.request.contextPath}/media/images/digest.gif"
											align="absmiddle">&nbsp;</label>

									</c:if> 
									
									<label><img alt="分区置顶"
										src="${pageContext.request.contextPath}/media/images/top_2.gif"
										align="absmiddle">&nbsp;</label> <c:if test="${isModerator }">
									<input class="checkbox"
									type="checkbox" name="chkTopicID" value="${topic.id }">	
										</c:if>
									<a href="${pageContext.request.contextPath}/topic?id=${topic.id }" class="headline">${topic.title }</a></td>
								<td class="author"><cite><a
										href="javascript:void(0);">${topic.author.username }</a>
								</cite><em>
								<fmt:formatDate value="${topic.postTime }" pattern="yyyy-MM-dd HH:mm"/>
								
								</em></td>

								<td class="nums"><span>
								
								${topic.replyTimes}</span> / <em>${topic.viewTimes}</em></td>

								<td class="lastpost"><em><a
										href="javascript:void(0);">
											<fmt:formatDate value="${topic.lastReplyTime}" pattern="yyyy-MM-dd HH:mm"/>
										
											</a></em> <cite>by <a
										href="javascript:void(0);">${topic.lastReplyName}</a>
								</cite></td>
							</tr>


						</tbody>

					</c:forEach>
					
					

					<c:forEach items="${topBoard }" var="topic">
						<tbody>
							<tr>
								<td class="folder"><a title="新窗口打开" href="#"
									target="_blank"><img
										src="${pageContext.request.contextPath}/media/images/folder_common.gif"></a></td>
								<td><c:if test="${topic.sssence }">
										<label><img alt="精华"
											src="${pageContext.request.contextPath}/media/images/digest.gif"
											align="absmiddle">&nbsp;</label>

									</c:if> 
									
									<label><img alt="本版置顶"
										src="${pageContext.request.contextPath}/media/images/top_3.gif"
										align="absmiddle">&nbsp;</label> <c:if test="${isModerator }">
									<input class="checkbox"
									type="checkbox" name="chkTopicID" value="${topic.id }">	
										</c:if>
									<a href="${pageContext.request.contextPath}/topic?id=${topic.id }" class="headline">${topic.title }</a></td>
								<td class="author"><cite><a
										href="javascript:void(0);">${topic.author.username }</a>
								</cite><em>
								<fmt:formatDate value="${topic.postTime }" pattern="yyyy-MM-dd HH:mm"/>
								
								</em></td>

								<td class="nums"><span>
								
								${topic.replyTimes}</span> / <em>${topic.viewTimes}</em></td>

								<td class="lastpost"><em><a
										href="javascript:void(0);">
											<fmt:formatDate value="${topic.lastReplyTime}" pattern="yyyy-MM-dd HH:mm"/>
										
											</a></em> <cite>by <a
										href="javascript:void(0);">${topic.lastReplyName}</a>
								</cite></td>
							</tr>


						</tbody>

					</c:forEach>

				</table>
				<table cellspacing="0" cellpadding="0">
					<thead class="separation">
						<tr>
							<td>&nbsp;</td>
							<td colspan="4">版块主题</td>
						</tr>
					</thead>
						<c:forEach items="${page.content }" var="topic">
						<tbody>
							<tr>
								<td class="folder"><a title="新窗口打开" href="#"
									target="_blank"><img
										src="${pageContext.request.contextPath}/media/images/folder_common.gif"></a></td>
								<td><c:if test="${topic.sssence }">
										<label><img alt="精华"
											src="${pageContext.request.contextPath}/media/images/digest.gif"
											align="absmiddle">&nbsp;</label>

									</c:if> 
									
									 <c:if test="${idModerator }">
									<input class="checkbox"
									type="checkbox" name="chkTopicID" value="${topic.id }">	
										</c:if>
									<a href="${pageContext.request.contextPath}/topic?id=${topic.id }" class="headline">${topic.title }</a></td>
								<td class="author"><cite><a
										href="javascript:void(0);">${topic.author.username }</a>
								</cite><em>
								<fmt:formatDate value="${topic.postTime }" pattern="yyyy-MM-dd HH:mm"/>
								
								</em></td>

								<td class="nums"><span>
								
								${topic.replyTimes}</span> / <em>${topic.viewTimes}</em></td>

								<td class="lastpost"><em><a
										href="javascript:void(0);">
											<fmt:formatDate value="${topic.lastReplyTime}" pattern="yyyy-MM-dd HH:mm"/>
										
											</a></em> <cite>by <a
										href="javascript:void(0);">${topic.lastReplyName}</a>
								</cite></td>
							</tr>


						</tbody>

					</c:forEach>
				</table>
					
			

					

				<div class="management">
					<input type="hidden" name="act"> <label><input
						class="checkbox" type="checkbox" name="chkall"
						onclick="checkall(this.form, &#39;chkTopicID&#39;)"> 全选</label>

					<button onclick="doManage(&#39;delete&#39;);return false;">删除主题</button>
					&nbsp;

					<button onclick="doManage(&#39;move&#39;);return false;">移动主题</button>
					&nbsp;

					<button onclick="doManage(&#39;highlight&#39;);return false;">高亮显示</button>
					&nbsp;

					<button onclick="doManage(&#39;close&#39;);return false;">关闭/打开主题</button>
					&nbsp;

					<button onclick="doManage(&#39;top&#39;);return false;">置顶/解除置顶</button>
					&nbsp;
					<button onclick="doManage(&#39;digest&#39;);return false;">加入/解除精华</button>
					&nbsp;

					<script type="text/javascript">
	function doManage(action) 
	{
		var theform = document.frmmanage;
		if (action == "cats")
		{
			location = theform.action.replace("manage.jsp","category.jsp");
			return false;
		}
		var hasCheckedID = false;
		if (typeof(theform.chkTopicID) != "undefined")
		{
			if (typeof(theform.chkTopicID.length) != "undefined")
			{
				for (i=0; i<theform.chkTopicID.length; i++){
					if (theform.chkTopicID[i].checked){
						hasCheckedID = true;
						break;
					}
				}
			}
			else if (theform.chkTopicID.checked)
				hasCheckedID = true;
		}
		if (!hasCheckedID){
			alert("请至少选中一个主题");
			return false;
		}
		theform.act.value = action;
		theform.submit();
	}
</script>
				</div>
			</form>

		</div>



		<div class="pages_btns">

		
			<%@ include file="/WEB-INF/jsp/common/bbspage.jspf"%>


		</div>

		<div class="legend" id="footfilter">
			<div class="jump_sort">
				<form id="frmsort" name="frmsort"
					action="${pageContext.request.contextPath}/media/images/论坛公告1 - unnamed.html"
					method="post">
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
					src="${pageContext.request.contextPath}/media/images/folder_common.gif">正常主题</label>
				<label><img alt="热门主题"
					src="${pageContext.request.contextPath}/media/images/folder_hot.gif">热门主题</label>
				<label><img alt="关闭主题"
					src="${pageContext.request.contextPath}/media/images/folder_lock.gif">关闭主题</label>
			</div>
		</div>
		
	</div>



	<%@include file="foot.jsp"%>


</body>
</html>