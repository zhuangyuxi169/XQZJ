<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<style>
body{background-color:#DCEEFC;}
    table{
	border-collapse: collapse;
	border: none;
	margin: 40px auto;
	width: 500px;
    }
	td{
	text-align:center;
	height: 20px;
	width:40px;
	margin-bottom: 10px;
	line-height: 25px;
	opacity: 0.5;
	}
</style>
</head>
<body>
<form role="form" class="form-horizontal" method="post">
  <table border="0" cellpadding="10">
  <c:if test="${param.status == 1}">
   <tr>
   <td>姓名:</td>
   <td>${adminBeans.name}</td>
   <td>性别:</td>
   <td>${adminBeans.sex}</td>
   </tr>
   <tr>
   <td>国家/省市:</td>
   <td>${adminBeans.area}</td>
   <td>教育程度:</td>
   <td>${adminBeans.teach}</td>
   </tr>
    <tr>
   <td>邮政编码:</td>
   <td>${adminBeans.youbian}</td>
   <td>邮箱:</td>
   <td>${adminBeans.email}</td>
   </tr>
   <tr>
   <td>手机:</td>
   <td>${adminBeans.tel}</td>
   <td>固定电话:</td>
   <td>${adminBeans.phone}</td>
   </tr>
   <tr>
   <td>QQ:</td>
   <td>${adminBeans.qq}</td>
   <td>MSN:</td>
   <td>${adminBeans.msn}</td>
   </tr>
   </c:if>
   </table>
   </form>
</body>
</html>