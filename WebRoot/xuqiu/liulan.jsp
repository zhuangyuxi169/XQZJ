<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求浏览</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
<style>
	a{
	color:#000000;
	opacity: 1.0;
	}
	a:visited{
	color:#000000;
	}
    table{
	border-collapse: collapse;
	border: none;
	margin: 45px auto;
	width: 900px;
    }
	td{
	text-align:center;
	height: 20px;
	width:120px;
	margin-bottom: 10px;
	line-height: 25px;
	opacity: 0.7;
	}
.time{
	width:100px;
}</style>
</head>
<body>
<form method="post">
<center>

<input type="hidden" name="i" id="i" value=1>
<!-- 查询条件:&nbsp;<select name="mc" style="width:120px;height:25px;border-style:outset">
<option value="">技术需求名称</option>
<c:forEach var="item" items="${jsxqmc}" varStatus="status">
    <option value="${item.mingcheng}">${item.mingcheng}</option>
</c:forEach>
</select>-->
<div class="13213">
用户名:
<select name="yh" id="yh" style="width:120px;height:25px;border-style:outset" onblur="check()" placeholder="用户名">
<option value="" style="disabled:true">用户名</option>
<c:forEach var="item" items="${quanxianBean11}" varStatus="status">
    <option value="${item.name}">${item.name}</option>
</c:forEach>
</select>
<script>
function check(){
	var aaa=document.getElementById("yh").value;
	if(aaa==""){
		alert("选择用户名!");
	}
}
</script>
	<div class="13213" id="1">查询条件:
		<select name="tiaojian0" style="width:120px;height:25px;border-style:outset">
			<option value="mingcheng">技术需求名称</option>
			<option value="contact">联系人</option>
			<option value="problem">主要问题</option>
			<option value="daibiao">法人代表</option>
		</select>&nbsp;
		<input type="text" name="chx0">
		<select name="fs0" style="width:80px;height:25px;border-style:outset">
			<option value="=">精确</option>
			<option value="like">模糊</option>
		</select>&nbsp;
		<button type="button" onclick="tianjia();">+</button>
		<button type="button" disabled=true>-</button>
		</div>
	<div>
</div>
</div>
<div class="13213" id="2" style="display:none">
<select name="xx1" style="width:63px;height:25px;border-style:outset">
			<option value="and">且</option>
			<option value="or">或</option>
		</select>&nbsp;
<select name="tiaojian1" style="width:120px;height:25px;border-style:outset;">
<option value="mingcheng">技术需求名称</option>
<option value="contact">联系人</option>
<option value="problem">主要问题</option>
<option value="daibiao">法人代表</option>
</select>&nbsp;
<input type="text" name="chx1">
<select name="fs1" style="width:80px;height:25px;border-style:outset">
<option value="=">精确</option>
<option value="like">模糊</option>
</select>&nbsp;
<button type="button" onclick="tianjia();">+</button>
<button type="button" onclick="shanchu();">-</button>
</div>
<div class="13213" id="3" style="display:none">
<select name="xx2" style="width:63px;height:25px;border-style:outset">
			<option value="and">且</option>
			<option value="or">或</option>
		</select>&nbsp;
<select name="tiaojian1" style="width:120px;height:25px;border-style:outset;">
<option value="mingcheng">技术需求名称</option>
<option value="contact">联系人</option>
<option value="problem">主要问题</option>
<option value="daibiao">法人代表</option>
</select>&nbsp;
<input type="text" name="chx1">
<select name="fs2" style="width:80px;height:25px;border-style:outset">
<option value="=">精确</option>
<option value="like">模糊</option>
</select>&nbsp;
<button type="button" onclick="tianjia();">+</button>
<button type="button" onclick="shanchu();">-</button>
</div>
<div class="13213" id="4" style="display:none">
<select name="xx3" style="width:63px;height:25px;border-style:outset">
			<option value="and">且</option>
			<option value="or">或</option>
		</select>&nbsp;
<select name="tiaojian1" style="width:120px;height:25px;border-style:outset;">
<option value="mingcheng">技术需求名称</option>
<option value="contact">联系人</option>
<option value="problem">主要问题</option>
<option value="daibiao">法人代表</option>
</select>&nbsp;
<select name="fs3" style="width:80px;height:25px;border-style:outset">
<option value="=">精确</option>
<option value="like">模糊</option>
</select>
<input type="text" name="chx1">&nbsp;
<button type="button" disabled=true>+</button>
<button type="button" onclick="shanchu();">-</button>
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:&nbsp;&nbsp;&nbsp;
<select name="cx" style="width:100px;height:25px;border-style:outset">
	<option value="-1">全部</option>
	<option value="0">已保存</option>
	<option value="1">已提交</option>
	<option value="2">已通过审核</option>
	<option value="3">未通过审核</option>
</select>&nbsp;&nbsp;
时间:&nbsp;<input class="time" type="date" name="sj1">&nbsp;到&nbsp;<input class="time" type="date" name="sj2">
<input formaction="${pageContext.request.contextPath}/xuqiu/select" name="submit" value="查询" type="submit" style="width:60px;height:25px"><br><br>
<script>
function tianjia(){
	for(id=1;id<5;id++){
		if(document.getElementById(id).style.display=="none"){
			document.getElementById(id).style.display="";
			document.getElementById("i").value=id;
			break;
		}
	}
}
function shanchu(){
	for(id=4;id>0;id--){
		if(document.getElementById(id).style.display==""){
			document.getElementById(id).style.display="none";
			document.getElementById("i").value=id-1;
			break;
		}
	}
}
</script>
<br><br>
</center>
</form>
<center>
<c:if test="${param.status == 1}">
<div class="row-fluid">
		<div class="col-md-1 "></div>
			<div class="col-md-10 ">
				<table class="table table-striped">
<tr style="width:90px;text-align:center"><td>填报人</td><td>技术需求名称</td><td>联系人</td><td>主要问题</td>
		<td>法人代表</td><td>状态</td><td>填报时间</td><td>操作</td></tr>
<c:forEach var="item" items="${xuqiuBean1}" varStatus="status">
    		<tr style="text-align:center">
    		<td>${item.name}</td>
    		<td><a href="${pageContext.request.contextPath}/xuqiu/ck?xuqiuname=${item.mingcheng}" style="text-decoration:none">${item.mingcheng}</a></td>
    		
    		<td>${item.contact}</td>
    		<td>${item.problem}</td>
    		<td>${item.daibiao}</td>
    		<td>${item.status}</td>
    		<td>${item.shijian}</td>
    		<td>
    		<c:if test="${item.status=='已保存'}">
    		<a href="#" style="text-decoration:none">修改</a>
    		</c:if>
    		<c:if test="${item.status=='已提交'||item.status=='1'}">
    		<a href="${pageContext.request.contextPath}/xuqiu/delete?xuqiuname=${item.mingcheng}" style="color:blue;text-decoration:none">删除</a></td>
    		</c:if>
    		<c:if test="${item.status=='已通过审核'}">
    		<a href="${pageContext.request.contextPath}/xuqiu/ck?xuqiuname=${item.mingcheng}" style="color:blue;text-decoration:none">查看</a>
    		</c:if>
    		<c:if test="${item.status.contains('未通过')}">
    		<a>查看</a>
    		</c:if>
    		</tr>
</c:forEach>
</table>
</div>
</div>
</c:if>
<div>
<c:if test="${param.status1==1}">
<script>
alert("删除成功!");
</script>
</c:if>
</div>
</center>
</body>
</html>