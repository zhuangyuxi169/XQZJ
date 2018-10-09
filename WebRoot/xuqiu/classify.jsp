<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高级检索</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
</head>

<body style="background-color: #E0F0F8;">

<c:if test="${param.status.equals('1')}">
		<div class="row-fluid">
		<div class="col-md-1 "></div>
			<div class="col-md-10 ">
				<table class="table table-striped">
					<tr>
							<td align="center">需求名称</td>
							<td align="center">研究类型</td>
							<td align="center">需求起始日期</td>
							<td align="center">需求截止日期</td>
							<td align="center">状态</td>
						</tr>
							<c:forEach items="${demandBeans}" var="item" varStatus="status">
								<!-- var 定义变量 -->
								<tr>
									<td align="center"><a href="${pageContext.request.contextPath}/xuqiu/ck?xuqiuname=${item.mingcheng}" style="text-decoration:none;color:black">${item.mingcheng}</a></td>
    		
									<td align="center">${item.leixing}</td>
									<td align="center">${item.start}</td>
									<td align="center">${item.finish}</td>
									<td align="center">${item.status}</td>
									
								
								</tr>
							</c:forEach>
							
				</table>
				
			</div>
		</div>
		</c:if>
			<center>		
		<c:if test="${param.status.equals('2')}">
				<h3>未检索到内容</h3>
		</c:if>
	</center>
</body>
</html>