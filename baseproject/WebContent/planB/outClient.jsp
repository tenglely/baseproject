<%@page import="com.teng.model.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@ page contentType="application/msexcel" %>
<%
   //response.setHeader("Content-disposition","inline; filename=videos.xls");
   response.setHeader("Content-disposition","attachment; filename=test.xls");
   //以上这行设定传送到前端浏览器时的档名为test.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table align="left" border="2">
<% 
		List<Client> list=(List<Client>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th>编号</th><th>姓名</th><th>性别</th><th>年龄</th><th>住址</th>
		<th>电话</th><th scope="col">备注</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Client client:list){
%>
		<tr>
			<td align="center"><%=client.getCno() %></td>
			<td align="center"><%=client.getCname() %></td>
			<td align="center"><%=client.getCsex() %></td>
			<td align="center"><%=client.getCage() %></td>
			<td align="center"><%=client.getCaddress() %></td>
			<td align="center"><%=client.getCphone() %></td>
			<td align="center"><%=client.getCremark() %></td>
		</tr>
		<%
	}
	}
%>
</tbody>
</table>
</body>
</html>