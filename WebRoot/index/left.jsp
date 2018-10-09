<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/my.js"></script>

</head>
<body>
<div class="leftMenu">
	<div class="menu">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle" style="height: 34px; background-color: #44A2EF">
					<strong style="color: #FFFFFF;font-size: 20px;line-height: 34px;">系统菜单</strong>
					<div class="leftbgbt"> </div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>

		<c:if test="${adminBean.quanxianBean.tianbao==1}">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="xuqiu/tianbao.jsp" target="mainAction" style="text-decoration:none;color:black">需求征集</a>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		</c:if>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="xuqiu/yhm" target="mainAction" style="text-decoration:none;color:black">浏览需求</a>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
				<img src="lefticon.png">
				<a href="supersearch.jsp" target="mainAction" style="text-decoration:none;color:black">需求查询</a>
				<div class="leftbgbt2"></div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		<c:if test="${adminBean.quanxianBean.shenhe==1}">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="xuqiu/jiansuo1" target="mainAction" style="text-decoration:none;color:black">需求审核</a>
					<div class="leftbgbt2">
					</div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		</c:if>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a>个人信息</a>
					<div class="leftbgbt2"> </div>
				</div>
				<div class="menuList">
				<div> <a href="user/updatepassword.jsp" target="mainAction">修改密码</a> </div>
				
				<div> <a href="user/info?username=${adminBean.name}" target="mainAction">用户信息</a> </div>
			</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		<c:if test="${adminBean.quanxianBean.quanxianguanli==1}">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="${pageContext.request.contextPath}/quanxian/list" target="mainAction" style="text-decoration:none;color:black">权限管理</a>
					<div class="leftbgbt2">
					</div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		</c:if>
		<c:if test="${adminBean.quanxianBean.yonghu==1}">
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="${pageContext.request.contextPath}/quanxian/list" target="mainAction" style="text-decoration:none;color:black">用户管理</a>
					<div class="leftbgbt2">
					</div>
				</div>
			</div>
			<div class="menuList">
			</div>
		</div>
		</c:if>
		<div class="menuParent">
			<div class="ListTitlePanel">
				<div class="ListTitle">
					<img src="lefticon.png">
					<a href="login.jsp" style="text-decoration:none;color:black">安全退出</a>
					<div class="leftbgbt2"> </div>
				</div>
			</div>
			<div class="menuList">
				
			</div>
		</div>
		
	</div>
</div>
</body>
</html>