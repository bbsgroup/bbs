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
		分区管理 <small>分区列表</small>
	</h3>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a href="javascript:;">后台管理</a> <i
			class="icon-angle-right"></i></li>
		<li><a href="${pageContext.request.contextPath}/admin/category/list">分区管理</a></li>
	</ul>
	<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
	</div>
	<form class="form-inline definewidth m20" action="list" method="get">
		分区名称： <input type="text" name="keyword" id="categoryname"
			class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
		&nbsp;&nbsp; <a type="button" class="btn btn-success"
			href="${pageContext.request.contextPath}/admin/category/add">新增分区</a>
				
	</form>
	<table class="table table-bordered table-hover definewidth m10"
		id="sample_1" >
		<thead style="text-align:center;">
			<tr>
				<th>分区名</th>
				<th class="hidden-480">分区状态</th>
				<th class="hidden-480">操作</th>
			</tr>
		</thead>
		<tbody>
		

         <c:forEach items="${page.content}" var="category">  
	
			<tr class="odd gradeX" >
				<td class="hidden-480">${category.name}</td>
				<td class="hidden-480"><c:if  test="${category.status == true}">启用</c:if > <c:if 
					test="${category.status== false}">禁用</c:if ></td>
				<td><a href="update?id=${category.id }" class="btn mini purple"><i
						class="icon-edit"></i> 编辑</a> 
						
						<a href="setModerator?id=${category.id }" class="btn mini purple"><i
						class="icon-edit"></i>设置分区版主</a> 
						
						<a href="delete?id=${category.id }"
					class="btn mini black"
					onclick="return confirm('确定要删除吗？一旦删除将不能恢复！')"><i
						class="icon-trash"></i> 删除</a> </td>
			</tr>
			</c:forEach> 
			<tr>
				<td colspan="5">
				<%@ include file="/WEB-INF/jsp/common/pageView.jspf"%>
				</td>
			</tr>
		</tbody>
	</table>
</body>
<script src="${pageContext.request.contextPath}/media/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/media/js/bootstrap.min.js"></script>
</html>
