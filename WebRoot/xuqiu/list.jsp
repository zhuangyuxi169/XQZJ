<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看需求</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
</head>
 <style>
    .icoFontlist:hover  
    {  
        width: 100px; 
        border: 0px solid #ddd;  
        overflow: hidden;  
        text-align: left;  
        text-overflow: ellipsis;  
        white-space: nowrap;  
        cursor:pointer;   
    }  
    .icoFontlist{  
        width: 100px;   
        border: 0px solid #ddd;  
        color:#5f5f5f;  
        overflow: hidden;  
        text-align: left;  
        text-overflow: ellipsis;  
        white-space: nowrap;  
    }  
</style>

<body>
<form action="${pageContext.request.contextPath }/xuqiu/list?username=${userBean.name }&juese=${userBean.juesebean.name }" method="post">
	<div class="container-fluid">
			
			<div class='col-sm-3' ></div>
			<div class='col-sm-3' >
				<select name='type' class='form-control'>
				<c:if test="${not empty param.type}">
					<option style="color: #b6b6b6" selected value="${param.type}">
								<c:if test="${param.type==-1}">全部</c:if>
								<c:if test="${param.type==0}">已保存</c:if>
								<c:if test="${param.type==1}">已提交</c:if>
								<c:if test="${param.type==2}">已通过审核</c:if>
								<c:if test="${param.type==3}">被退回</c:if>
					</option>
				</c:if>
					<option value="-1">全部</option>
					<c:if test="${userBean.juesebean.name =='user'}"><option value="0">已保存</option></c:if>
					<option value="1">已提交</option>
					<option value="2">已通过审核</option>
					<option value="3">被退回</option>
				</select>
			</div>
			<button style="width:100px ;height:30px" type="submit">查询</button>
			
		
	</div>
</form>	
		<div class="row-fluid">
			<div class="col-md-1 "></div>
			<div class="col-md-10 ">
				<table class="table table-striped">
					<tr>
						<td>用户</td>
						<td>需求名称</td>
						<td>主题</td>
						<td>状态</td>
						<td>法人</td>
						<td>联系人</td>
						<td>时间</td>
						<td align="center" colspan="2">操作</td>
					</tr>
					<!-- forEach遍历出xuqiuBeans -->
					<c:forEach items="${xuqiuBeans}" var="item" varStatus="status">
						<tr>
							<td>${item.username }</td>
							<td>${item.xqname }</td>
							<td><div class="icoFontlist" title="${item.theme }">${item.theme }</div></td>
							<td><c:if test="${item.status==0}">已保存</c:if>
								<c:if test="${item.status==1}">已提交</c:if>
								<c:if test="${item.status==2}">已通过审核</c:if>
								<c:if test="${item.status==3}">被退回</c:if>
							</td>
							<td>${item.represent }</td>
							<td>${item.lianxiren }</td>
							<!-- 截取字符串 -->
							<td> ${fn:substring(item.createdate, 0, 16)}</td>
							<c:if test="${item.status==0}">
							<td><a href="${pageContext.request.contextPath}/xuqiu/toUpdate?id=${item.id }&type=${param.type}">修改</a></td>
							<td><a href="${pageContext.request.contextPath}/xuqiu/delete?username=${item.username }&id=${item.id }&type=${param.type}">删除</a></td>
							</c:if>
							
							<c:if test="${item.status!=0}">
							<td><a href="${pageContext.request.contextPath}/xuqiu/toUpdate?id=${item.id }&type=${param.type}">查看</a></td>
							<td></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class=" col-md-1"></div>
		</div>
</body>
</html>