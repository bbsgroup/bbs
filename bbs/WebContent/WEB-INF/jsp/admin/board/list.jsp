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

<style type="text/css">
body {
	padding: 30px;
}
</style>

</head>
<body>
	<h3 class="page-title">
		版块管理 <small>版块列表</small>
	</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a href="javascript:;">后台管理</a> <i
			class="icon-angle-right"></i></li>
		<li><a href="${pageContext.request.contextPath}/admin/category/list">版块管理</a></li>
	</ul>
	<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
	</div>
	<form class="form-inline definewidth m20" action="list" method="get">
		 <a type="button" class="btn btn-success"
			href="${pageContext.request.contextPath}/admin/board/add">新增版块</a>
				
	</form>
	
	
	<c:forEach items="${categorys}" var="category">  
	<table class="table table-bordered table-hover definewidth m10"
		id="sample_1" >
		
		<thead style="text-align:center;">
			<tr>
				<th colspan="3">分区：${category.name}</th>
				
			</tr>
		</thead>

		
		<tbody>
		<c:forEach items="${category.boards}" var="board">
		<tr class="odd gradeX" >
				<td class="hidden-480" width="20%">${board.name}</td>
				<td class="hidden-480"><c:if  test="${board.status == true}">启用</c:if > <c:if 
					test="${board.status== false}">禁用</c:if ></td>
				<td>
				<a href="moveUp?id=${board.id }&categoryId=${category.id}" class="btn mini purple"><i
						class="icon-edit"></i> 上移</a> 
					<a href="moveDown?id=${board.id }&categoryId=${category.id}" class="btn mini purple"><i
						class="icon-edit"></i> 下移</a> 
				
				<a href="update?id=${board.id }&categoryId=${category.id}" class="btn mini purple"><i
						class="icon-edit"></i> 编辑</a> 
						
						<a href="setModerator?id=${board.id }&categoryId=${category.id}" class="btn mini purple"><i
						class="icon-edit"></i>设置版主</a> 
						
						<a href="delete?id=${board.id }"
					class="btn mini black"
					onclick="return confirm('确定要删除吗？一旦删除将不能恢复！')"><i
						class="icon-trash"></i> 删除</a> </td>
			</tr>
		</c:forEach>
	
		</tbody>
	</table>
	</c:forEach> 
</body>
<script src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/media/js/bootstrap.min.js"></script>
</html>
