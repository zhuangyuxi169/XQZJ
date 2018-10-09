<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath}/static/js/Chart.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
		.bar{width: 50%;margin: 0 auto;}
		.pie{width: 50%;margin: 0 auto;}
</style>
<script type="text/javascript">
function  randomColor(){
    //颜色字符串
    var colorStr="";
    //字符串的每一字符的范围
    var randomArr=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
    //产生一个六位的字符串
    for(var i=0;i<6;i++){
        //15是范围上限，0是范围下限，两个函数保证产生出来的随机数是整数
        colorStr+=randomArr[Math.ceil(Math.random()*(15-0)+0)];
    }
    return colorStr;
};
window.onload=function(){
	
	var s = document.getElementById("s").value;
	//alert(s);
	var s1= new Array(); //定义一数组 
	s1=s.split("|");
	var name= new Array(); //定义一数组 
	var num= new Array(); //定义一数组 
	name=s1[0].split(",");
	num=s1[1].split(",");
	var arr=[]; 
    for(var i = 0;i<name.length;i++){ 
    	 var json = {};
         json.value = num[i];
         json.color = "#"+randomColor();
         json.highlight ="#"+randomColor();
         json.label=name[i];
         arr.push(json);
    }
    var pieData = arr;
	var ctx1 = document.getElementById("chart-area").getContext("2d");
	window.myPie = new Chart(ctx1).Pie(pieData);
};
</script>
</head>
 <body>
<form action="${pageContext.request.contextPath}/xuqiu/tongji" method="post" >
 	<select id="tiaojian" name="tiaojian" class='form-control' onchange="tongji();">
			<option value="represent">法人代表</option>
			<option value="lianxiren">联系人</option>
			<option value="xqname">需求名称</option>
			<option value="status">审核状态</option>
	</select>
	<button type="submit">确定</button>
</form>

 <input id="s" type="hidden" value="${param.s}">
 <div class="pie" >
	<canvas id="chart-area" width="400" height="400"/>
 </div>

 </body>
</html>