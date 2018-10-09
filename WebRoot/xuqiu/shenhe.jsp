<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新建需求征集表</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/CreateDemand.js">
	
</script>
<style type="text/css">
html, body, div, li, form, input, th, td {
	margin: 0;
	padding: 0;
	font-family: 楷体;
	font-size: 100%;
}

ul, ol, li {
	list-style: none;
}

a:link, a:visited {
	color: #FF00FF;
	text-decoration: none;
}

a:hover {
	color: #12b7f5;
}

table2 {
	border-collapse: collapse;
	border: none;
	margin: 60px auto;
	width: 800px;
}

th, td {
	border: Groove #000000 2px;
	height: 20px;
	margin-bottom: 12px;
	line-height: 25px;
	opacity: 1.0;
}

div, td {
	text-align: left;
}
</style>
</head>
<body style="background-color: #E0F0F8;">

	<form  id="form1" method="post">
		<center>
			<table class="table2" border="2" cellpadding="10">
				<center>
					<h2>技术需求申请表</h2>
				</center>
				<tr>
					<td>机构名称</td>
					<td colspan="5">${infoBean.name}</td>
				</tr>
				<tr>
					<td>通讯地址</td>
					<td colspan="5">${infoBean.address}</td>
				</tr>
				<tr class='tr1'>
					<td>单位网址</td>
					<td class="td5">${infoBean.web}</td>
					<td>电子邮箱</td>
					<td colspan="5">${infoBean.email}</td>
				</tr>
				<tr>
					<td>法人代表</td>
					<td>${infoBean.represent}</td>
					<td>邮政编码</td>
					<td colspan="5">${infoBean.zipcode}</td>
				</tr>
				<tr>
					<td rowspan="2">联系人</td>
					<td rowspan="2">${infoBean.lianxiren}</td>
					<td>电话</td>
					<td colspan="5">1、固定:${infoBean.phone}<br>
						2、手机:${infoBean.tel}
					</td>
				</tr>
				<tr>

					<td>传真</td>
					<td colspan="5">${infoBean.chuanzhen}</td>
				</tr>
				<tr>
					<td>机构属性</td>
					<td colspan="5"><label><input type="radio" id="qy"
							name="shuxing" value="企业" disabled="disabled"
							onClick="Close('otherServics')">企业</label> <label><input
							type="radio" id="gdyx" name="shuxing" value="高等院校"
							disabled="disabled" onClick="Close('otherServics')">高等院校</label>
						<label><input type="radio" id="yjjg" name="shuxing"
							value="研究机构" disabled="disabled" onClick="Close('otherServics')">研究机构</label>
						<label><input type="radio" id="qt" name="shuxing"
							value="其他" disabled="disabled" onClick="Close('otherServics')">其他</label></td>
				</tr>
				<tr class="tr1">
					<td colspan="4">机构简介(限200字以内)</td>
					<td class="td6" id="text1">${infoBean.jianjie.length()}/200</td>
				</tr>
				<tr class="tr3">
					<td colspan="5">${infoBean.jianjie}</td>
				</tr>
				<tr>
					<td>需求名称</td>
					<td colspan="5">${infoBean.xqname}</td>
				</tr>
				<tr class="tr1">
					<td colspan="4">*重大科技需求概述(需要解决的重大技术问题，限500字以内)
					<td class="td6" id="text2">${infoBean.theme.length()}/500</td>
				</tr>
				<tr class="tr3">
					<td colspan="5">${infoBean.theme}</td>
				</tr>
				<tr>
					<td>*关键字:</td>
					<td colspan="4">1.${infoBean.key1}&nbsp;&nbsp;&nbsp;
						2.${infoBean.key2}&nbsp;&nbsp;&nbsp;
						3.${infoBean.key3}&nbsp;&nbsp;&nbsp;
						4.${infoBean.key4}&nbsp;&nbsp;&nbsp; 5.${infoBean.key5}</td>
				</tr>

				<tr>
					<td class="td1">研究类型</td>
					<td colspan="4"><label><input type="radio" name="type"
							disabled="disabled" value="基础研究" id="form1" onclick="getUI()">基础研究</label>
						<label><input type="radio" name="type" id="form1"
							 disabled="disabled"  value="应用研究" onclick="getUI()">应用研究</label> <label><input
							 disabled="disabled"  type="radio" name="type" value="试验发展" onclick="getUI()">试验发展</label>
						<br> <label><input type="radio" name="type"
							 disabled="disabled"  value="研究发展与应用成果" id="form1" onclick="getUI()">研究发展与应用成果</label>
						<label><input type="radio" name="type" value="技术推广与科技服务"
							 disabled="disabled"  onclick="getUI()">技术推广与科技服务</label> <label><input
							type="radio" name="type" id="form1" value="生产性活动"
							 disabled="disabled"  onclick="getUI()">生产性活动</label></td>
				</tr>
				<tr id="sub" style="display: none;">
					<td class="td1">学科分类</td>
					<td colspan="4"><select name="firstSubjects"
						id="firstSubjects"
						onchange="refreshList('firstSubjects','secondSubjects','1','subject');">
							<option value="default">请选择</option>

					</select> <select name="secondSubjects" id="secondSubjects"
						onchange="refreshList('secondSubjects','thirdSubjects','2','subject');">
							<option value="default">请选择</option>
					</select> <select name="thirdSubjects" id="thirdSubjects">
							<option value="default">请选择</option>
					</select></td>
				</tr>
				<tr>
					<td class="td1">*技术需求合作模式</td>
					<td colspan="4"><label><input type="radio"
							 disabled="disabled"  name="model" value="基础研究" onClick="Close('otherModel')">独立开发</label>
						<label><input type="radio" name="model" value="应用研究"
							 disabled="disabled" onClick="Close('otherModel')">技术转让</label> <label><input
							 disabled="disabled" type="radio" name="model" value="试验发展"
							onClick="Close('otherModel')">技术入股</label> <label><input
							 disabled="disabled" type="radio" name="model" value="研究发展与应用成果"
							onClick="Close('otherModel')">合作开发</label> <label><input
							 disabled="disabled" type="radio" name="model" value="技术推广与科技服务"
							onClick="Show('otherModel')">其他<input class="input5"
							 disabled="disabled" type="text" id="otherModel" name="model" style="display: none;"></label>
					</td>
				</tr>
				<tr>
				<tr id="servics" style="display: none;">
					<td class="td1">需求技术所属领域</td>
					<td colspan="4"><label><input type="checkbox"
							name="servics" value="电子信息技术" onClick="Close('otherServics')">电子信息技术</label>
						<label><input type="checkbox" name="servics"
							value="光机电一体化" onClick="Close('otherServics')">光机电一体化 </label> <label><input
							type="checkbox" name="servics" value="软件"
							onClick="Close('otherServics')">软件</label> <label><input
							type="checkbox" name="servics" value="生物制药技术"
							onClick="Close('otherServics')">生物制药技术</label> <label><input
							type="checkbox" name="servics" value="新材料及应用技术"
							onClick="Close('otherServics')">新材料及应用技术</label> <br> <label><input
							type="checkbox" name="servics" value="先进制造技术"
							onClick="Close('otherServics')">先进制造技术</label> <label><input
							type="checkbox" name="servics" value="现代农业技术"
							onClick="Close('otherServics')">现代农业技术</label> <label><input
							type="checkbox" name="servics" value="新能源与高效节能技术"
							onClick="Close('otherServics')">新能源与高效节能技术</label> <br> <label><input
							type="checkbox" name="servics" value="资源与环境保护新技术"
							onClick="Close('otherServics')">资源与环境保护新技术</label> <label><input
							type="checkbox" name="servics" value="其他技术"
							onClick="Show('otherServics')">其他技术</label> <label><input
							class="input5" type="text" id="otherServics" name="otherServics"
							style="display: none;"></label></td>
				</tr>
				<tr id="industry" style="display: none;">
					<td id="td1">需求技术应用行业</td>
					<td colspan="4"><select name="firstIndustry"
						id="firstIndustry"
						onchange="refreshList('firstIndustry','secondIndustry','1','industry');">
							<option value="default">请选择</option>

					</select> <select name="secondIndustry" id="secondIndustry"
						onchange="refreshList('secondIndustry','thirdIndustry','2','industry');">
							<option value="default">请选择</option>
					</select> <select name="thirdIndustry" id="thirdIndustry">
							<option value="default">请选择</option>
					</select></td>
				</tr>




			</table>

		
		<button type="button" style="width:100px ;height:30px" id="pass" onclick="shenhe(this)">通过</button>
		<button type="button" style="width:100px ;height:30px" id="npass" onclick="shenhe(this)">不通过</button>
		</center>
		
	</form>
	
	<c:if test="${infoBean.shuxing == '企业'}">
		<script language="javascript">
			document.getElementById("qy").checked = true;
		</script>
	</c:if>
	<c:if test="${infoBean.shuxing == '高等院校'}">
		<script language="javascript">
			document.getElementById("gdyx").checked = true;
		</script>
	</c:if>
	<c:if test="${infoBean.shuxing == '研究机构'}">
		<script language="javascript">
			document.getElementById("yjjg").checked = true;
		</script>
	</c:if>
	<c:if test="${infoBean.shuxing == '其他'}">
		<script language="javascript">
			document.getElementById("qt").checked = true;
		</script>
	</c:if>
<script>
function shenhe(s){	
	if(s.id=="pass"){
		var result = confirm('是否通过！');  
		if(result){  
		    window.location.href = "${pageContext.request.contextPath }/xuqiu/shenhe?status=2"; 
		} 
	}else{
		var result = confirm('是否不通过！');  
		if(result){  
			window.location.href = "${pageContext.request.contextPath }/xuqiu/shenhe?status=3";
		}
	}
}

</script>
</body>
</html>