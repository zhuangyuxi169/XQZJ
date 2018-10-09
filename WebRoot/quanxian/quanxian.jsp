<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
</head>
<body>
<div class="row-fluid">
		<div class="col-md-1 "></div>
			<div class="col-md-10 ">
				<table class="table table-striped">
					<tr>
						<td align="center">用户名</td>
						<td align="center">填报</td>
						<td align="center">审核</td>
						<td align="center">浏览</td>
						<td align="center">查询</td>
						<td align="center">个人信息</td>
						<td align="center">权限管理</td>
						<td align="center">用户管理</td>
						<td align="center" colspan="2">操作</td>
					</tr>
					
					<c:forEach items="${quanxianBean}" var="item" varStatus="status">
						<tr>
							<td align="center">${item.name}</td>
							<td align="center">${item.tianbao}</td>
							<td align="center">${item.shenhe}</td>
							<td align="center">${item.liulan}</td>
							<td align="center">${item.chaxun}</td>
							<td align="center">${item.gerenxinxi}</td>
							<td align="center">${item.quanxianguanli}</td>
							<td align="center">${item.yonghu}</td>
							<td align="center"><a href="${pageContext.request.contextPath }/quanxian/update.jsp?&name=${item.name}" style="text-decoration:none;color:black;">修改</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		<div class=" col-md-1"></div>
	</div>
</body>
</html>