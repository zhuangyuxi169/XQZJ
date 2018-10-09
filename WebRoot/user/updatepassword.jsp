<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
<style>

	.button{
	margin-top:15px;
	background-color: #4CAF50;
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    border-radius:8px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	}
	.button1{
	margin-left:100px;
	margin-right:50px;
	width:65px;
	}
	.button2{
	margin-left:50px;
	width:40px;
	}
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/updatepassword?username=${adminBean.name }&password=${adminBean.password }" method="post">
<center> 
    <h1 style="font-size:30px;color:white;">修改密码</h1><br><br>
   <table border="0" height=10px cellspacing="20">
   <tr>
   <td>旧密码:&nbsp;</td>
   <td><input type="password" name="password1"></td>
   </tr>
   <tr>
   <td>新密码:&nbsp;</td>
   <td><input type="password" name="password2"></td>
   </tr>
   <tr>
   <td>确认密码:&nbsp;</td>
   <td><input type="password" name="password3"></td>
   </tr>
   <tr>
   <td></td>
   <td colspan="2">
   </td></tr>
   </table>
   <input class="button button1" type="submit" name="submit" value="修改" >

</center>
			<div>
			<c:if test="${param.status.equals('1')}">
			<script type="text/javascript">
    			alert("旧密码错误!");
    		</script>
			</c:if>
			<c:if test="${param.status.equals('2')}">
			<script type="text/javascript">
    			alert("修改成功!");
    		</script>
			</c:if>
			</div>
</form>
</body>
</html>