<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/media/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/media/css/style.css" rel="stylesheet" />

</head>
<body>


	<form action="${pageContext.request.contextPath}/admin/category/setModerator"
		method="post" class="form-group definewidth m20">
		<div id="myAlert" class="alert alert-warning" style="display: none;">
			<a href="#" class="close" data-dismiss="alert">&times;</a> ${error}
		</div>
		<input type="hidden" name="id" value="${category.id}"/>
		<table class="table table-bordered table-hover definewidth m10">
			
			<tr class="form-group">
				<td width="10%" class="tableleft">分区名</td>				
				<td>${category.name}</td>
			</tr>
			
			<tr class="form-group">
				<td width="10%" class="tableleft">版主：</td>				
				<td><input type="text" name="usernames" value="${category.moderators }"  width="400"/><br/>(请输入版主用户名，多个以','分隔)</td>
			</tr>
			
			

			<tr>
				<td class="tableleft"></td>
				<td>
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
<script src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/media/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/media/js/jquery.validate.min.js"></script>
<script>
	$(function() {
		var error = "${error}";
		if(null != error && ""!=error){
			$("#myAlert").css('display','block');
		}
		
		$("#userInfo").validate({
			errorClass : "invalid",
			rules : {
				username : {
					required : true
				},
				password : {
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
				username : "请输入姓名",
				password : "密码不能为空",
				re_password : " 与第一次输入密码不符",
				email : {
					required : "邮箱不能为空",
					email : "邮箱格式不对"
				}

			}

		});

	});
</script>