<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求征集</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/CreateDemand.js">
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/xueke.js">
</script>
<style type="text/css">
html, body, div, li, form, input, th, td {
	margin: 0;
	padding: 0;
	font-family:黑体;
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

table {
	border-collapse: collapse;
	border: none;
	margin: 60px auto;
	width: 300px;
}

th, td {
	border: 0.5px solid white;
	height: 20px;
	width:220px;
	margin-bottom: 12px;
	line-height: 25px;
	opacity: 1.0;
}

div, td {
	text-align: left;
}
.button{
	margin-top:15px;
	background-color: #555555;
    border: none;
    color: white;
    border: 2px solid #4CAF50;
    padding: 6px 13px;
    text-decoration: none;
    font-size: 13px;
    cursor: pointer;
    border-radius:10px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}
.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body style="background-color: #E0F0F8;">

	<form class="form-horizontal" action="${pageContext.request.contextPath}/xuqiu/zhuce?username=${adminBean.name}"
					 id="form1" method="post">
		<center>
			<table class="table" border="0" cellpadding="10">
				<caption>
					<h1>技术需求申请表</h1>
				</caption>
				<tr class='tr1'>
					<td style="color:red;"><a style="color:black">*</a>机构全称</td>
					<td class="td5"><input type="text" name="name" value="${xuqiuBean.jigou}"></td>
					<td style="text-align:center">归口管理部门</td>
					<td colspan="1"><input type="text" name="bumen"></td>
				</tr>
				<tr>
					<td style="color:black;">*通讯地址</td>
					<td class="td5"><input type="text" name="address" value="${xuqiuBean.txadd}"></td>
					<td style="text-align:center;color:black">*所在地域</td>
					<td colspan="1">
					<select name="diyu" style="width:174px">  
    			    <option style="color:#999;"></option> 
    			    <option value="石家庄" style="color:#999;">石家庄</option>
				    </select>  
				    </td>
				</tr>
				<tr class='tr1'>
					<td style="color:red;">&nbsp;网址</td>
					<td class="td5"><input type="text" name="dwweb"></td>
					<td style="text-align:center;color:black">*电子信箱</td>
					<td colspan="1"><input type="text" name="email"></td>
				</tr>
				<tr>
					<td style="color:black;">*法人代表</td>
					<td><input type="text" name="represent"></td>
					<td style="text-align:center">邮政编码</td>
					<td colspan="1"><input type="text" name="zipcode"></td>
				</tr>
				<tr>
					<td rowspan="2" style="color:black;">*联系人</td>
					<td rowspan="2" ><input type="text" name="lianxiren"></td>
					<td style="text-align:center;color:black">*电话</td>
					<td colspan="1"><input type='text' name="phone" placeholder='固定'><input type='text' name="telphone" placeholder='手机'></td>
				</tr>
				<tr>
					
					<td style="text-align:center">传真</td>
					<td colspan="1"><input type='text' name="chuanzhen"></td>
				</tr>
				<tr>
				<td style="color:black;">*机构属性</td>
				<td colspan="3"><label><input type="radio"
							name="shuxing" value="企业" onClick="Close('otherServics')">企业</label>
							<label><input type="radio"
							name="shuxing" value="高等院校" onClick="Close('otherServics')">高等院校</label>
							<label><input type="radio"
							name="shuxing" value="研究机构" onClick="Close('otherServics')">研究机构</label>
							<label><input type="radio"
							name="shuxing" value="其他" onClick="Close('otherServics')">其他</label></td>
				</tr>
				<tr class="tr1">
					<td colspan="3" style="color:black">*机构简介(限200字以内)</td>
					<td class="td6" id="text1">0/200</td>
				</tr>
				<tr class="tr3">
					<td colspan="4"><textarea class="textarea" onkeypress='this.value=this.value.substring(0,199)'
							onkeyup="showTextLength('text1','jianjie',200)" id="jianjie" name="jianjie" 
							 cols=100 rows=6"></textarea></td>
				</tr>
				<tr>
				<td style="color:black">*技术需求名称</td>
				<td><input type="text" name="xuqiuname" placeholder="必填"></td>
				<td style="text-align:center;color:black">*需求时限</td>
				<td style="text-align:center"><input type="text" name="start" style="width:50px">年至<input type="text" name="finish" style="width:50px">年</td>				
				</tr>
				<tr class="tr1">
					<td colspan="5" style="color:black">*技术需求概述(需要解决的重大技术问题，限500字以内)</td>
				</tr>
				<tr class="tr2">
					<td class="td5" colspan="3">主要问题</td>
					<td class="td6" id="text2">0/500</td>
				</tr>
				<tr class="tr3">
					<td colspan="5"><textarea class="textarea" onkeypress='this.value=this.value.substring(0,499)'
							onkeyup="showTextLength('text2','theme',500)" id="theme" name="theme"
							cols=100 rows=6></textarea></td>
				</tr>
				<tr>
					<td>*关键字:</td>
					<td colspan="4">
					<input class="input3" type="text" id="key1"name="key1" style="width:98px"> 
					<input class="input3" type="text" id="key2" name="key2" onkeyup="ChangeState()" style="width:98px">
					<input class="input3"  type="text" id="key3" name="key3" onkeyup="ChangeState()" style="width:98px"> 
					<input class="input3" type="text" id="key4" name="key4" onkeyup="ChangeState()" style="width:98px"> 
					<input class="input3" type="text" id="key5" name="key5"onkeyup="ChangeState()" style="width:98px">
					</td>
				</tr>
				<tr>
				<td style="color:red">拟投入资金总额</td>
				<td colspan="3"><input type="text" name="zijin">万元</td>
				</tr>
				<tr>
					<td class="td1">研究类型</td>
					<td colspan="4"><label><input type="radio" name="type"
							value="基础研究" id="form1" onclick="getUI()">基础研究</label> <label><input
							type="radio" name="type" id="form1" value="应用研究" onclick="getUI()">应用研究</label>
						<label><input type="radio" name="type" value="试验发展"
							onclick="getUI()">试验发展</label> <br> <label><input
							type="radio" name="type" value="研究发展与应用成果" id="form1"  onclick="getUI()">研究发展与应用成果</label>
						<label><input type="radio" name="type" value="技术推广与科技服务"
							onclick="getUI()">技术推广与科技服务</label> <label><input
							type="radio" name="type"  id="form1" value="生产性活动" onclick="getUI()">生产性活动</label>
					</td>
				</tr>
				<tr id="sub" style="display: none;">
					<td class="td1">学科分类</td>
					<td colspan="4"><select name="firstSubjects"
						id="firstSubjects"
						onchange="changeSelect(this);">
							<option value="000000" disabled="disabled">请选择</option>
					</select> <select name="secondSubjects" id="secondSubjects"
						onchange="changeSelect(this);">
							<option value="000000" disabled="disabled">请选择</option>
					</select> <select name="thirdSubjects" id="thirdSubjects">
							<option value="000000" disabled="disabled">请选择</option>
					</select></td>
				</tr>
				<tr>
					<td class="td1">*技术需求合作模式</td>
					<td colspan="4"><label><input type="radio"
							name="model" value="基础研究" onClick="Close('otherModel')">独立开发</label>
						<label><input type="radio" name="model" value="应用研究"
							onClick="Close('otherModel')">技术转让</label> <label><input
							type="radio" name="model" value="试验发展"
							onClick="Close('otherModel')">技术入股</label> <label><input
							type="radio" name="model" value="研究发展与应用成果"
							onClick="Close('otherModel')">合作开发</label> <label><input
							type="radio" name="model" value="技术推广与科技服务"
							onClick="Show('otherModel')">其他<input class="input5"
							type="text" id="otherModel" name="model" style="display: none;"></label>
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
			<button class="button" type="submit"  name="submit" style="font-size:20px" formaction="${pageContext.request.contextPath}/xuqiu/baocun?username=${adminBean.name}">保存</button>
<button class="button" type="submit"  name="submit" style="font-size:20px">提交
	</button>
	<div>
	<c:if test="${param.statusz == 1}">
    		<script type="text/javascript">
    			alert("保存成功!");
    		</script>
    	</c:if>	</div>		
	<div>
	<c:if test="${param.status == 1}">
    		<script type="text/javascript">
    			alert("填报成功!");
    		</script>
    	</c:if>	</div>
			</center>
	</form>
</body>
</html>