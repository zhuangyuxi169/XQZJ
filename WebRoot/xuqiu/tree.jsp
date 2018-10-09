<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/tree/jquery.treeview.css" />
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/tree/jquery.treeview.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/tree/tree.js"></script>
</head>

<body>
	<ul id="tree">
		<li><a target='mainAction'
			href='../xuqiu/shu?code=110'>数学</a>
		<ul>
				<li><a target='mainAction'
					href='../xuqiu/shu?code=11011'>数学史</a></li>
				<li><a target='mainAction'
					href='../xuqiu/shu?code=11017'>数论</a></li>
			</ul>
		</li>
		<li><a target='mainAction'
			href='../xuqiu/shu?code=120'>信息科学与系统科学</a>
		<ul>
				<li><a target='mainAction'
					href='../xuqiu/shu?code=12010'>信息科学与系统科学基础学科</a></li>
			</ul></li>
		<li><a target='mainAction'
			href='../xuqiu/shu?code=130'>dsa</a>
		<ul></ul></li>
	</ul>
	<script type="text/javascript">
    $("#tree").treeview();
   </script>
</body>
</html>