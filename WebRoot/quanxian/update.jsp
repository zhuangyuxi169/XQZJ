<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>权限修改</title>
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
<form method="post">
<div class="row-fluid">
		<div class="col-md-1 "></div>
			<div class="col-md-10 ">
				<table class="table table-striped">
				<tr><td align="center">权限</td><td align="center">修改</td></tr>
				<tr><td align="center">用户名:</td><td align="center">${param.name}</td></tr>
				<tr><td align="center">填报:</td><td align="center"><input type="radio" name="tianbao" value="1">是&nbsp;&nbsp;<input type="radio" name="tianbao" value="0">否</td></tr>
				<tr><td align="center">审核:</td><td align="center"><input type="radio" name="shenhe" value="1">是&nbsp;&nbsp;<input type="radio" name="shenhe" value="0">否</td></tr>
				<tr><td align="center">浏览:</td><td align="center"><input type="radio" name="liulan" value="1">是&nbsp;&nbsp;<input type="radio" name="liulan" value="0">否</td></tr>
				<tr><td align="center">查询:</td><td align="center"><input type="radio" name="chaxun" value="1">是&nbsp;&nbsp;<input type="radio" name="chaxun" value="0">否</td></tr>
				<tr><td align="center">个人信息:</td><td align="center"><input type="radio" name="gerenxinxi" value="1">是&nbsp;&nbsp;<input type="radio" name="gerenxinxi" value="0">否</td></tr>
				<tr><td align="center">权限管理:</td><td align="center"><input type="radio" name="quanxianguanli" value="1">是&nbsp;&nbsp;<input type="radio" name="quanxianguanli" value="0">否</td></tr>
				<tr><td align="center">用户管理:</td><td align="center"><input type="radio" name="yonghu" value="1">是&nbsp;&nbsp;<input type="radio" name="yonghu" value="0">否</td></tr>
				
				</table>
				<center>
				<input formaction="${pageContext.request.contextPath}/quanxian/updateqx?name=${param.name}" name="submit" type="submit" value="确定">
				</center>
				<c:if test="${param.status.equals('1')}">
				<script>
				alert("修改成功");
				</script>
				</c:if>
			</div>
		<div class=" col-md-1"></div>
	</div>
	</form>
</body>
</html>