<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">

<link
	href="${pageContext.request.contextPath}/media/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/media/css/style.css"
	rel="stylesheet" />

</head>
<body>


	<form id="formInfo"
		action="${pageContext.request.contextPath}/admin/board/update"
		method="post" class="form-group definewidth m20">
		<div id="myAlert" class="alert alert-warning" style="display: none;">
			<a href="#" class="close" data-dismiss="alert">&times;</a> ${error}
		</div>
		
		<input type="hidden" name="id" value="${board.id }"/>
		<table class="table table-bordered table-hover definewidth m10">

			<tr class="form-group">
				<td width="10%" class="tableleft">版块名</td>
				<td>${board.name}</td>
			</tr>

			<tr>
				<td width="10%" class="tableleft">分区</td>
				<td><select name="categoryId">
						<c:forEach items="${categorys }" var="category">
							<option value="${category.id }"
								<c:if test="${category.id == board.category.id}">selected="selected"</c:if>>${category.name}</option>
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td class="tableleft">状态</td>
				<td><input type="radio" name="status" value="true"
					<c:if  test="${board.status == true}">checked</c:if > /> 启用 <input
					type="radio" name="status" value="false"
					<c:if  test="${board.status == false}">checked</c:if > /> 禁用</td>
			</tr>


			<tr>
				<td width="10%" class="tableleft">描述</td>
				<td><textarea name="description" rows="5" cols="50">${board.description }</textarea>
				</td>
			</tr>

		</table>


		<table class="table table-bordered table-hover definewidth m10">


			<thead style="text-align: center;">
				<tr>
					<th width="20%">用户组</th>
					<th>允许浏览</th>
					<th>允许发帖</th>
					<th>允许回复</th>
					<th>下载附件</th>
					<th>上传附件</th>
				</tr>
			</thead>

			<c:forEach items="${groups}" var="group">
				<tr>
					<td><input value="${group.id }" type=checkbox
						id="allowGroups${group.id }" onclick="changeGroups('${group.id}')">
						&nbsp;${group.name }</td>

					<td><input type="checkbox" name="visitGroups"
						id="visitGroups${group.id }" value="${group.id }"
						<c:if test="${fn:contains(board.visitGroups,group.id) }">checked</c:if> /></td>

					<td><input type="checkbox" name="topicGroups"
						id="topicGroups${group.id }" value="${group.id }"
						<c:if test="${fn:contains(board.topicGroups,group.id) }">checked</c:if> /></td>

					<td><input type="checkbox" name="replyGroups"
						id="replyGroups${group.id }" value="${group.id }" 
						<c:if test="${fn:contains(board.replyGroups,group.id) }">checked</c:if>
						/></td>
					<td><input type="checkbox" name="downloadGroups"
						id="downloadGroups${group.id }" value="${group.id }" 
						<c:if test="${fn:contains(board.downloadGroups,group.id) }">checked</c:if>
						/></td>
					<td><input type="checkbox" name="uploadGroups"
						id="uploadGroups${group.id }" value="${group.id }" 
						<c:if test="${fn:contains(board.uploadGroups,group.id) }">checked</c:if>
						/></td>

				</tr>

			</c:forEach>


			<tr>
				<td class="tableleft"></td>
				<td colspan="5">
					<button type="submit" class="btn btn-primary" type="button">保存</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid" onclick="javascript:history.back()">返回列表</button>
				</td>
			</tr>
		</table>



	</form>
</body>
</html>
<script
	src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/media/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/media/js/jquery.validate.min.js"></script>
<script>
	$(function() {
		var error = "${error}";
		if (null != error && "" != error) {
			$("#myAlert").css('display', 'block');
		}

		$("#formInfo").validate({
			errorClass : "invalid",
			rules : {
				name : {
					required : true
				},
				categoryId : {
					required : true

				},
				rpassword : {
					equalTo : "#password"
				},
				email : {
					required : true,
					email : true
				}

			},
			messages : {
				name : "请输入版块名",
				categoryId : "请选择分区",
				re_password : " 与第一次输入密码不符",
				email : {
					required : "邮箱不能为空",
					email : "邮箱格式不对"
				}

			}

		});

	});
	function changeGroups(id) {
		if ($('#allowGroups' + id).prop('checked')) {
			$('#visitGroups' + id).prop('checked', true);
			$('#topicGroups' + id).prop('checked', true);
			$('#replyGroups' + id).prop('checked', true);
			$('#downloadGroups' + id).prop('checked', true);
			$('#uploadGroups' + id).prop('checked', true);
		} else {
			$('#visitGroups' + id).prop('checked', false);
			$('#topicGroups' + id).prop('checked', false);
			$('#replyGroups' + id).prop('checked', false);
			$('#downloadGroups' + id).prop('checked', false);
			$('#uploadGroups' + id).prop('checked', false);
		}

	}
</script>