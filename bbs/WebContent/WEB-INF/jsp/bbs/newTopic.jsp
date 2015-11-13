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

<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : true,
			uploadJson : '${pageContext.request.contextPath}/file/upload',
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
	});
	
</script>
<body onkeydown="if(event.keyCode==27) return false;">
	<div class="wrap">
		<%@include file="head.jsp"%>


		<div id="nav">
			<a href="${pageContext.request.contextPath}/index">bbs</a> »&nbsp; <a
				href="${pageContext.request.contextPath}/board?id=${board.id}">${board.name }</a>
			»&nbsp; 发新话题
		</div>


		<form id="formInfo" name="postform"
			action="${pageContext.request.contextPath }/newTopic" method="post"
			enctype="multipart/form-data" onsubmit="submitForm();">
			<input type="hidden" value="${board.id }" name="id" />
			<div class="mainbox formbox">


				<table id="post_tb" cellspacing="0" cellpadding="0">
					<tr>
						<h1>发新话题</h1>

					</tr>
					<tbody>
						<tr>
							<th style="width: 100px">用户名</th>
							<td>${currentUser.username }</td>
						</tr>
						<tr>
							<th>标题</th>
							<td><input id="subject" tabindex="2" size="55" id="title" name="title"
								value="${title }"></td>
						</tr>
						<tr>
							<th>内容</th>
							<td>

								<table class="editor_button_tb" cellspacing="0" cellpadding="0"
									style="table-layout: fixed">

									<textarea name="content"
										style="width: 850px; height: 200px; visibility: hidden;">${content }</textarea>
								</table>

								<table class="box" cellspacing="0" cellpadding="0"
									style="margin-top: 10px">
									<thead>
										<tr>
											<th>上传附件或图片 ( 文件应小于 <strong>2048 KB</strong>,最多只能上传10个附件
												)
											</th>
											<td>&nbsp;描述</td>
											<td>&nbsp;操作</td>
										</tr>
									</thead>

									<tbody id="attachbody">
										<tr id="attach1">
											<th><input type="file" name="1" size="40"></th>

											<td>&nbsp;<input size="40" name="description1"
												maxlength="50">

											</td>
											<td><a href="javascript:void(0);"
												onclick="removeAttach('1')">删除</a></td>
										</tr>

									</tbody>
									<tr>
										<td colspan="3"><a href="javascript:void(0);"
											onclick="appendAttach()">继续添加</a></td>
									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td>验证码</td>
							<td colspan="2"><input name="captcha" style="display:inline-block;vertical-align:middle;"/><img
								id="verifycodeimage" alt="点击更换验证码"
								src="${pageContext.request.contextPath}/forum/code"
								onclick="changecode()"  style="margin-left:10px; vertical-align:middle;"></td>
						</tr>

						<tr class="btns">
							<th>&nbsp;</th>
							<td height="50">
								<table cellspacing="0" cellpadding="0" border="0">
									<tbody>
										<tr>
											<td style="padding-left: 0px;">
												<button id="postbtn" tabindex="9" id="postTopic"
													type="submit" class="submit" style="width: 110px">发新话题</button>
												<span id="postmsg"
												style="color: #009900; vertical-align: bottom"></span>
											</td>

										</tr>
									</tbody>
								</table>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<br>
		</form>


	</div>

	<%@include file="foot.jsp"%>
</body>
</html>

<script
	src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/media/js/jquery.validate.min.js"></script>

<script>

$(function() {
	var message = "${message}";
	if (null != message && "" != message) {
		alert(message);
	}
	$("#formInfo").validate({
		rules : {
			title : {
				required : true
			}
		},
		messages : {
			title : "请输入标题"		
		}
	});
	
});
	
</script>
<script>
	msgs['submit'] = "提交";
	msgs['cancel'] = "取消";
	msgs['posting'] = "正在提交数据，请稍候...";
	var num = 1;
	function appendAttach() {
		if (num == 10) {
			alert("不能继续添加附件！");
			return;
		}
		num++;
		var node = "<tr id='attach"+num+"'>";
		node += "<th style='width: 310px;'><input type='file' name='"+num+"' size='40' ></th>";
		node += "<td>&nbsp;<input size='40' name='description"+num+"'maxlength='50'></td>";
		node += "<td><a href='javascript:void(0);' onclick='removeAttach("
				+ num + ")'>删除</a></td>"
		node += "</tr>";
		$('#attachbody').append(node);
	}

	function removeAttach(id) {
		$('#attach' + id).remove();
		num--;
	}

	function submitForm() {
		$('#postTopic').attr("disabled", true);

	}

	function changecode() {
		var img1 = document.getElementById("verifycodeimage");
		img1.src = "${pageContext.request.contextPath}/forum/code?"
				+ new Date().getTime();
	}
</script>
