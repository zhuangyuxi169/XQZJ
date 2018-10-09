<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新建需求征集表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/CreateDemand.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xueke.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

</head>
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

<script>
$(function(){
    $("#save,#tijiao,#update,#updatetijiao").click(function(){
    	$.ajax({
            cache: true,
            type: "POST",
            url:"${pageContext.request.contextPath}/xuqiu/toadd",
            data:$('#form1').serialize(),// 你的formid
            async: false,
            success: function(data) {
            	if(data == 1){
            		alert("请填写完整信息！");
        		}
            	if(data == 0){
            			window.location.href = "${pageContext.request.contextPath}/xuqiu/CreateDemand2.jsp?modal=1";
            		}
            	
            	}
         });
      });
      
    }); 
</script>
<c:if test="${param.modal==1}">
	<script language="javascript">
		$(function(){
			$("#mymodal").modal("toggle");
		});
	</script>
</c:if>

<body style="background-color: #E0F0F8;">

	<form id="form1" method="post">
	<input type="hidden" name="username" value="${userBean.name}">
	<input type="hidden" name="id" value="${infoBean.id}">			
	<input type="hidden" name="status" value="${infoBean.status}">	
		
		<center>
			<table class="table2"  border="2" cellpadding="10">
				<center>
					<h2>技术需求申请表</h2>
				</center>
				<tr>
					<td>机构名称</td>
					<td colspan="5"><input type="text" name="name" value="${infoBean.name}" required="required"></td>
				</tr>
				<tr>
					<td>通讯地址</td>
					<td colspan="5"><input type="text" name="address" value="${infoBean.address}" required="required"></td>
				</tr>
				<tr class='tr1'>
					<td>单位网址</td>
					<td class="td5"><input type="text" name="web" value="${infoBean.web}" required="required"></td>
					<td>电子邮箱</td>
					<td colspan="5"><input type="text" id="email" name="email" value="${infoBean.email}" onblur="return checkemail();" required="required"></td>
				</tr>
				<tr>
					<td>法人代表</td>
					<td><input type="text" name="represent" value="${infoBean.represent}" required="required"></td>
					<td>邮政编码</td>
					<td colspan="5"><input type="text" value="${infoBean.zipcode}" name="zipcode" required="required"></td>
				</tr>
				<tr>
					<td rowspan="2">联系人</td>
					<td rowspan="2" ><input type="text" value="${infoBean.lianxiren}" name="lianxiren" required="required"></td>
					<td >电话</td>
					<td colspan="5">1、固定<input type='text' value="${infoBean.phone}"  name="phone" required="required"><br>
									2、手机<input type='text' id="tel" onblur="return checketel();" value="${infoBean.tel}" name="telephone" required="required"></td>
				</tr>
				<tr>
					
					<td>传真</td>
					<td colspan="5"><input type='text' value="${infoBean.chuanzhen}" name="chuanzhen" required="required"></td>
				</tr>
				<tr>
				<td> 机构属性</td>
				<td colspan="5"><label><input type="radio" id="企业"
							name="shuxing" value="企业" onClick="Close('otherServics')">企业</label>
							<label><input type="radio" id="高等院校"
							name="shuxing" value="高等院校" onClick="Close('otherServics')">高等院校</label>
							<label><input type="radio" id="研究机构"
							name="shuxing" value="研究机构" onClick="Close('otherServics')">研究机构</label>
							<label><input type="radio" id="其他"
							name="shuxing" value="其他" onClick="Close('otherServics')">其他</label></td>
				</tr>
				<tr class="tr1">
					<td colspan="4">机构简介(限200字以内)</td>
					<td class="td6" id="text1">0/200</td>
				</tr>
				<tr class="tr3">
					<td colspan="5"><textarea class="textarea" required="required" 
							onkeyup="showTextLength('text1','jianjie',200)" maxlength=200 id="jianjie" name="jianjie"
							cols=100 rows=6>${infoBean.jianjie}</textarea></td>
				</tr>
				<tr>
					<td>需求名称</td>
					<td colspan="5"><input type="text" name="xqname" value="${infoBean.xqname}"  required="required"></td>
				</tr>
				<tr class="tr1">
					<td colspan="4">*重大科技需求概述(需要解决的重大技术问题，限500字以内)
					<td class="td6" id="text2">0/500</td>
				</tr>
				<tr class="tr3">
					<td colspan="5"><textarea class="textarea" required="required"
							onkeyup="showTextLength('text2','theme',500)" maxlength=500 id="theme" name="theme"
							cols=100 rows=6>${infoBean.theme}</textarea></td>
				</tr>
				<tr>
					<td>*关键字:</td>
					<td colspan="4">
					<input class="input3" type="text" id="key1"name="key1" value="${infoBean.key1}"> 
					<input class="input3" readonly="readonly"type="text" id="key2" name="key2" onkeyup="ChangeState()" value="${infoBean.key2}">
					<input class="input3" readonly="readonly" type="text" id="key3" name="key3" onkeyup="ChangeState()" value="${infoBean.key3}"> 
					<input class="input3" readonly="readonly" type="text" id="key4" name="key4" onkeyup="ChangeState()" value="${infoBean.key4}"> 
					<input class="input3" readonly="readonly" type="text" id="key5" name="key5"onkeyup="ChangeState()" value="${infoBean.key5}">
					</td>
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
					<td colspan="4">
					
					<select id="A" name="A" onchange="changes(this);">  
    				<option value="000000" style="color:#999;" disabled="disabled" >-请选择一级学科-</option>  
					</select>  
					<select id="B" name="B" onchange="changes(this);">  
   	 				<option value="000000" style="color:#999;" disabled="disabled" >-请选择二级学科-</option>  
					</select> 
				</td>
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

		</center>
		<c:if test="${infoBean.id==''||infoBean.id==-1}">
		<center>
			<button type="button" id="save" >保存</button>
			<button type="button" id="tijiao" >提交</button>
		</center>
		</c:if>
		<c:if test="${infoBean.id!=''&&infoBean.id!=-1}">
		<center>
			<button type="button" id="update" style="width:100px ;height:30px"  >保存修改</button>
			<button type="button" id="updatetijiao" style="width:100px ;height:30px"  >提交</button>
			<button style="width:100px ;height:30px" type="button" onclick="location='${pageContext.request.contextPath }/xuqiu/list?username=${userBean.name }&type=${param.type}&juese=${userBean.juesebean.name }'" >返回</button>
		</center>
		</c:if>
	<div class="modal" id="mymodal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="close1"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">预览</h4>
			</div>
			<div class="modal-body" >
		  	<c:import url="/xuqiu/chakan.jsp"  ></c:import> 
				
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	</form>
		<c:if test="${param.status == 1}">
			<script language="javascript">
				alert("填报成功!"); 
			</script>
		</c:if>
		<c:if test="${param.status == 2}">
			<script language="javascript">
				alert("修改成功!"); 
			</script>
		</c:if>
		<c:if test="${infoBean.shuxing != ''}">
			<script language="javascript">
				document.getElementById("${infoBean.shuxing}").checked=true;
			</script>
		</c:if>

</body>
</html>