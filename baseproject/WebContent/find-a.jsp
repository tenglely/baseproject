<%@page import="java.util.List"%>
<%@page import="com.teng.model.Agency"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>查询-Agency</title>
<script type="text/javascript" src="planB/need.js"></script>
</head>
<body>
<%
	if(request.getAttribute("aresult")!=null&&request.getAttribute("aresult")!=""){
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
	<div align="left">
		<% String use=(String)request.getAttribute("use"); %>
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
		<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>&nbsp;
		<% if(!use.equals("'use'")) {%>
		<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  	 		 详细查询
  		</a>
  		<% } %>
	</div><br>
	<div class="collapse" id="collapseExample">
  <div class="card card-body">
   <form action="<%=request.getContextPath()%>/find.ado?use=<%=use %>" method="post">
      		<table class="table">
      		<thead>
      			<tr><th colspan="2" scope="row" align="center" ><span id="find-atitle">请输入以下任意至少一项信息，来进行查询</span></th></tr>
      		</thead>
      			<tr>
      				<td scope="col" align="right">经办人编号：</td>
      				<td><input type="text" name="ano" id="find-ano"></td>
      				<td scope="col" align="right" >经办人姓名：</td>
      				<td><input type="text" name="aname" id="find-aname"></td>
      			</tr>
      			<tr>
      				<td scope="col" align="right">经办人电话：</td>
      				<td><input type="text" name="aphone" id="find-aphone"></td>
      			</tr>
      			<tr><td align="right"><input type="submit" value="查找" class="btn" onclick="return findAgency()"></td></tr>
      		</table>
      	</form>
  </div>
</div>
<%
	if(request.getAttribute("agency")!=null&&request.getAttribute("agency")!=""){
		Agency agency=(Agency)request.getAttribute("agency");
%>
	<table class="table">
		<tr>
		<td scope="col">编号</td><td scope="col">用户类型</td><td scope="col">姓名</td><td scope="col">密码</td><td scope="col">性别</td>
		<td scope="col">电话</td><td scope="col">备注</td>
		<% if(!use.equals("'use'")) {%>
		<td scope="col">操作</td>
		<% } %>
		</tr>
		<tr><td scope="row"><%=agency.getAno() %></td>
		<td><%=agency.getAclass() %></td>
		<td><%=agency.getAname() %></td>
		<td><%=agency.getApassword() %></td>
		<td><%=agency.getAsex() %></td>
		<td><%=agency.getAphone() %></td>
		<td><%=agency.getAremark() %></td>
		<% if(!use.equals("'use'")) {%>
		<td>
				<a href="<%=request.getContextPath() %>/delete.ado?ano=<%=agency.getAno()%>">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.ado?updateA=<%=agency.getAno()%>">修改</a> 
		</td>
		<% } %>
		</tr>
	</table>
<% 
	}
%>
<%
	if(request.getAttribute("userlist")!=null&&request.getAttribute("userlist")!=""){
		List<Agency> list=(List<Agency>)request.getAttribute("userlist");
%>
	<table class="table">
		<tr>
		<td scope="col">编号</td><td scope="col">用户类型</td><td scope="col">姓名</td>
		<td scope="col">密码</td><td scope="col">性别</td><td scope="col">电话</td>
		<td scope="col">备注</td><td scope="col">操作</td>
		</tr>
		<%
			for(Agency agency:list){
		%>
			<tr>
				<td scope="row"><%=agency.getAno() %></td>
				<td><%=agency.getAclass() %></td>
				<td><%=agency.getAname() %></td>
				<td><%=agency.getApassword() %></td>
				<td><%=agency.getAsex() %></td>
				<td><%=agency.getAphone() %></td>
				<td><%=agency.getAremark() %></td>
				<td>
				<a href="<%=request.getContextPath() %>/delete.ado?ano=<%=agency.getAno()%>">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.ado?updateA=<%=agency.getAno()%>">修改</a> 
				</td>
			</tr>
		<% 
		}
		%>
	</table>
<% 
	}
%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>