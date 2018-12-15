<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆页面</title>
<style type="text/css">
	.bg{
		width:400px; height:320px;
		background-color: #F0F8FF;
		margin: auto;
	}
</style>
</head>

<body> 
	<br><br><br><br>
	<div class="bg">
	<center>
		<br><img alt="hello" src="<%=request.getContextPath() %>/1.jpg" width="100" height="50"><br>
		<h1>医药信息管理系统</h1>
<%
	if(session.getAttribute("note")!=""&&session.getAttribute("note")!=null){
%>
		<span style="color: red;font: bolder;"><%=session.getAttribute("note") %></span>
<% 	}
%>	
	<div style="margin-top: 15px;">
	<form action="<%=request.getContextPath()%>/login.ado" method="post">
		用户名：<input type="text" name="username"><br><br>
		密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br><br>
		<input type="submit" value="登陆">
	</form>
	</div>
	</center>
	</div>

</body>
</html>