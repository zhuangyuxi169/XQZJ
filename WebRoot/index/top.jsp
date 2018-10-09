<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
</head>
<body>
<table>
    <tr>
      <td>
        <img src="images1/index_01.jpg" width="1215" height="110" alt=""></td>
	    <td background="images1/index_02.jpg"></td>
		<td colspan="2" >
		    <img src="images1/index_03.jpg" width="150" height="110" alt=""></td>
	  </tr>
</table>
<div style="text-align:right;background-color:#E0F0F8;width:1365px;height:32px;">
	<strong style="color:black;font-size:20px;line-height: 25px;">${adminBean.name} 您好!
	<script>
    document.write("今天是"+new Date().toLocaleDateString()+' 星期'+'日一二三四五六'.charAt (new Date().getDay()));
    setInterval(function(){
    	time.innerText=(new Date().toLocaleTimeString())
    },0)
    document.write("  当前时间<span id=time></span>")
</script></strong>
</div>
</body>

</html>
