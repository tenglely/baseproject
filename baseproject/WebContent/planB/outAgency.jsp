<%@page import="com.teng.model.Agency"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>outAgency</title>
</head>
<body>
    <% 
		List<Agency> list=(List<Agency>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
    <table align="left" border="2">
	<thead>
	<tr>
		<th>编号</th><th>用户类型</th><th>姓名</th><th>密码</th><th>性别</th><th>号码</th><th>备注</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Agency agency:list){
%>
		<tr>
			<td align="center"><%=agency.getAno() %></td>
			<td align="center"><%=agency.getAclass() %></td>
			<td align="center"><%=agency.getAname() %></td>
			<td align="center"><%=agency.getApassword() %></td>
			<td align="center"><%=agency.getAsex() %></td>
			<td align="center"><%=agency.getAphone() %></td>
			<td align="center"><%=agency.getAremark() %></td>
		</tr>
<%
	}
	}
%>
</tbody>
</table>
</body>
</html>