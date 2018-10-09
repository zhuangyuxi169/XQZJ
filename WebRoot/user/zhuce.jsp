<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/address.js"></script>
<style>
body{background-color:#DCEEFC;}
    table{
	text-align:center;
	border-collapse: collapse;
	border: none;
	margin: 40px auto;
	width: 600px;
    }
	td{
	height: 20px;
	width:60px;
	margin-bottom: 10px;
	line-height: 25px;
	opacity: 2;
	}
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
	margin-left:450px;
	margin-right:50px;
	width:65px;
	}
	.button2{
	margin-left:50px;
	width:40px;
	}
</style>
<script type="text/javascript">
function check(){
	var aaa=document.getElementById("u1").value;
	if(aaa.length<6||aaa.length>20){
		alert("用户名格式错误");
	}
}
function check2(){
	var p1=document.getElementById("p1").value;
	var p2=document.getElementById("p2").value;
	
	if(p1!=p2){
		document.getElementById("p2").value="";
		aa.innerHTML="两次密码不一致!";
	}
}
</script>
<script type="text/javascript">
   function youxiang(){
	   var filter=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	   var em=document.getElementById("email").value;

	if(filter.test(em)){
	return true;
	}
	else{
	yy.innerHTML="邮箱格式错误!";
	return false;
	}
   }
   </script>
</head>
<body>
<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/user/reg" method="post">
<center>
   <a style="font-weight:normal;font-size:85%;color:blue;">填写说明:红色*为必须填写的注册信息,建议填写更多详细信息,以便获得更多资源信息服务</a>
   </center>
   <table border="0" height=10px cellspacing="10" cellpadding="10">
   <tr>
   <td><a style="color:red">*</a>用户名:&nbsp;</td>
   <td><input type="text" name="username" id="u1" onblur="check()">
   </td><td style="width:150px;opacity: 0.3;">填报员小于8位,审核员小于10位</td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>用户密码:&nbsp;</td>
   <td><input type="password" name="password" id="p1"></td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>确认密码:&nbsp;</td>
   <td><input type="password" name="mima" id="p2" onblur="check2()"></td>
   <td id="aa" style="color:red"></td>
   </tr>
   <tr>
   <td>姓名:&nbsp;</td>
   <td><input type="text" name="name"></td>
   </tr>
   <tr>
   <td>性别:&nbsp;</td>
   <td><input type="radio" name="sex" value="男">男&nbsp;<input type="radio" name="sex" value="女">女</td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>国家/省市:&nbsp;</td>
   <td>
				<select id="province" onchange="changeSelect(this);" name="area1">  
    			<option value="000000" style="color:#999;" disabled="disabled">-请选择省-</option>  
				</select>  
				<select id="city" onchange="changeSelect(this);" name="area2">  
   	 			<option value="000000" style="color:#999;" disabled="disabled" >-请选择市-</option>  
				</select>  
				<select id="district" name="area3">  
    			<option value="000000" style="color:#999;" disabled="disabled">-请选区-</option>  
				</select>   
                </td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>工作单位:&nbsp;</td>
   <td><input type="text" name="danwei"></td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>专业方向:&nbsp;</td>
   <td><input type="text" name="fangxiang"></td>
   </tr>
   <tr>
   <td><a style="color:red">*</a>所在行业:&nbsp;</td>
   <td><input type="text" name="hangye"></td>
   </tr>
   <tr>
   <td>教育程度:&nbsp;</td>
   <td><input type="text" name="teach"></td>
   </tr>
   <tr>
   <td>职称:&nbsp;</td>
   <td><input type="text" name="zhicheng"></td>
   </tr>
   <tr>
   <td>通讯地址:&nbsp;</td>
   <td><input type="text" name="telarea"></td>
   </tr>
    <tr>
   <td>邮政编码:&nbsp;</td>
   <td><input type="text" name="youbian"></td>
   </tr>
   <tr>
   <td>手机:&nbsp;</td>
   <td><input type="text" name="tel" id="tel" onblur="check1()"></td>
   <td id="tell" style="color:red"></td>
   </tr>
   <script type="text/javascript">
   function check1(){
	   var tel1=document.getElementById("tel").value;
	   if(tel1.length!=11){
		   document.getElementById("tel").value="";
		   tell.innerHTML="手机号为11位!";
	   }
   }
   </script>
   <tr>
   <td>固定电话:&nbsp;</td>
   <td><input type="text" name="phone"></td>
   </tr>
   <tr>
   <td>邮箱:&nbsp;</td>
   <td><input type="text" name="email" id="email" onblur="return youxiang()"></td>
   <td id="yy" style="color:red"></td>
   </tr>
   <tr>
   <td>QQ:&nbsp;</td>
   <td><input type="text" name="qq"></td>
   </tr>
   <tr>
   <td>MSN:&nbsp;</td>
   <td><input type="text" name="msn"></td>
   </tr>
    <script type="text/javascript">  
          addressInit('cmbProvince', 'cmbCity', 'cmbArea');  
    </script> 
</table>
   <input class="button button1" type="submit" name="submit" value="注册" >
   <a href="${pageContext.request.contextPath}/login.jsp" class="button button2">返回</a>
   </form>
   <div>
    	<c:if test="${param.status == 1}">
    		<script type="text/javascript">
    			alert("注册成功!");
    		</script>
    	</c:if>
    	<c:if test="${param.status==2}">
    		<script type="text/javascript">
    			alert("该用户已存在!");
    		</script>
    	</c:if>
    	<c:if test="${param.status==3}">
    		<script type="text/javascript">
    			alert("填写完整信息!");
    		</script>
    	</c:if>
    </div>
</body>
</html>