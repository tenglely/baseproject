<%@page import="com.teng.model.Agency"%>
<%@page import="java.util.List"%>
<%@page import="com.teng.model.Medicine"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>查询-Medicine</title>
<script type="text/javascript" src="planB/need.js"></script>
</head>
<body>
<%
	if(request.getAttribute("mresult")!=null&&request.getAttribute("mresult")!=""){
%>	
	<center>
	<br><br><br>
	<div class="card">
  		<div class="card-header">查询结果 </div>
  		<div class="card-body">
    	<h5 class="card-title">查询失败，无该查询选项</h5>
   		<p class="card-text">请重新查询</p>
   		<button type="button" class="btn btn-primary" onclick="window.history.back()">返回上一级</button>
  		</div>
		</div>	
	</center>	
		<% 
		}
%>
	<% String use=(String)request.getParameter("use"); %>
	<% if(use.equals("'use'")){ %>
		<%
		Agency agency=(Agency)session.getAttribute("agency");
	%>
<!-- 导航栏 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="#">导航栏</a>
  	<div class="collapse navbar-collapse" id="navbarNav">
    	<ul class="navbar-nav">
      		<li class="nav-item" active>
        		<a class="nav-link" href="<%=request.getContextPath() %>/planB/indexAgency.jsp">登记顾客</a>
      		</li>
      		<li class="nav-item" active>
        		<a class="nav-link" href="<%=request.getContextPath()%>/findBySno.bdo?ano=<%=agency.getAno()%>&use='use'">订单记录</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<%=request.getContextPath()%>/updatecheck.ado?updateA=<%=agency.getAno()%>&a='true'">修改个人信息</a>
      		</li>
    	</ul>
  	</div>
  	<h5>欢迎您,经办人：<%=agency.getAname() %></h5>
</nav>
	<% } %>
	<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>&nbsp;&nbsp;	
	<% if(!use.equals("'use'")) {%>
	<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  	 		 详细查询
  	</a>
  	<% } %>
	<br>
	<div class="collapse" id="collapseExample">
  <div class="card card-body">
    <form action="<%=request.getContextPath()%>/find.mdo?use=<%=use %>" method="post">
      		<table class="table">
      		<thead>
      			<tr><th colspan="3" scope="row" align="center" ><span id="find-mtitle">请输入以下任意一项信息，来进行查询</span></th></tr>
      		</thead>
      			<tr>
      				<td scope="col" align="right">药品编号：</td>
      				<td><input type="text" name="mno" id="find-mnno"></td>
      			</tr>
      			<tr>
      				<td scope="col" align="right" >药品名称：</td>
      				<td><input type="text" name="mname" id="find-mname"></td>
      			</tr>
      			<tr><td align="center"><input type="submit" value="查找" class="btn" onclick="return findMedicine()"></td></tr>
      		</table>
      	</form></div>
</div>	
	<%
	if(request.getAttribute("medicine")!=null&&request.getAttribute("medicine")!=""){
		Medicine medicine=(Medicine)request.getAttribute("medicine");
	%>	
		<table class="table">
		<tr>
		<td scope="col">编号</td><td scope="col">名称</td><td scope="col">服用方法</td><td scope="col">功效</td>
		<td scope="col">价格</td><td scope="col">库存</td>
		<% if(!use.equals("'use'")){ %>
		<th>操作</th>
		<% } %>
		</tr>
		<tr><td scope="row"><%=medicine.getMno() %></td>
		<td><%=medicine.getMname() %></td>
		<td><%=medicine.getMmode() %></td>
		<td><%=medicine.getMefficacy() %></td>
		<td><%=medicine.getMprice() %></td>
		<td><%=medicine.getMcount() %></td>
		<% if(!use.equals("'use'")){ %>
		<td>
			<a href="<%=request.getContextPath() %>/delete.mdo?mno=<%=medicine.getMno()%>&asee=null">删除</a>&nbsp;
			<a href="<%=request.getContextPath() %>/updatecheck.mdo?updateM=<%=medicine.getMno()%>">修改</a> 
		</td>
		<% } %>
		</tr>
	</table>
	<% } 
	if(request.getAttribute("list")!=null&&request.getAttribute("list")!=""){
		List<Medicine> list=(List<Medicine>)request.getAttribute("list");
	%>
	<table class="table">
		<tr>
		<td scope="col">编号</td><td scope="col">名称</td><td scope="col">服用方法</td><td scope="col">功效</td>
		<td scope="col">价格</td><td scope="col">库存</td><th>操作</th>
		</tr>
	<%
	 		for(Medicine medicine:list){
	 %>
	 	<tr><td scope="row"><%=medicine.getMno() %></td>
		<td><%=medicine.getMname() %></td>
		<td><%=medicine.getMmode() %></td>
		<td><%=medicine.getMefficacy() %></td>
		<td><%=medicine.getMprice() %></td>
		<td><%=medicine.getMcount() %></td>
		<td>
				<a href="<%=request.getContextPath() %>/delete.mdo?mno=<%=medicine.getMno()%>&asee=null">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.mdo?updateM=<%=medicine.getMno()%>">修改</a> 	
		</td>
		</tr>
	<% } %>
	</table>
	<% } %>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>