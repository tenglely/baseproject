<%@page import="com.teng.model.Agency"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="need.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>采购人员操作界面</title>
</head>
<body>
<%
		Agency agency=(Agency)session.getAttribute("agency");
	%>
<!-- 导航栏 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="#">导航栏</a>
  	<div class="collapse navbar-collapse" id="navbarNav">
    	<ul class="navbar-nav">
      		<li class="nav-item" active>
        		<a class="nav-link" href="#">登记药物</a>
      		</li>
      		<li class="nav-item" active>
        		<a class="nav-link" href="<%=request.getContextPath()%>/seetable?table=medicine&asee='true'">药物列表</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<%=request.getContextPath()%>/updatecheck.ado?updateA=<%=agency.getAno()%>&a='other'">修改个人信息</a>
      		</li>
    	</ul>
  	</div>
  	<h5>欢迎您,采购人员：<%=agency.getAname() %></h5>
  	</nav>
  	<br><br>
  	<!-- 登记药物信息 -->
  	 <form action="<%=request.getContextPath() %>/Agencyadd.mdo" method="post" >
		<table class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">录入药物信息</th></tr>
			</thead>
			<tr>
				<th align="right" scope="col">名称：</th>
				<td><input type="text" name="mname" id="mname" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mname">*名称由2-20为字符组成</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">服用方法：</th>
				<td><input type="radio" name="mmode" value="内服" checked>内服
				<input type="radio" name="mmode" value="外服">外服</td>
				<td><span id="tips_mmode">*请选择服用方法</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">功效：</th>
				<td><input type="text" name="mefficacy" id="mefficacy" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mefficacy">*请输入药物功效</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">价格：</th>
				<td><input type="text" name="mprice" id="mprice" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mprice">*请输入药物价格</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">库存：</th>
				<td><input type="text" name="mcount" id="mcount" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mcount">*请录入库存数量</span></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return ClientNull()"></td>
				<td align="left"><input type="reset" value="重置" style="background-color: #FAFAD2;"></td>
			</tr>
		</table>
	</form>
</body>
</html>