<%@page import="com.teng.model.Medicine"%>
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
		List<Medicine> list=(List<Medicine>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th>编号</th><th>名称</th><th>服用方法</th><th>功效</th>
		<th>价格</th><th>库存</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Medicine medicine:list){
%>
		<tr>
			<td align="center"><%=medicine.getMno() %></td>
			<td align="center"><%=medicine.getMname() %></td>
			<td align="center"><%=medicine.getMmode() %></td>
			<td align="center"><%=medicine.getMefficacy() %></td>
			<td align="center"><%=medicine.getMprice() %></td>
			<td align="center"><%=medicine.getMcount() %></td>
		</tr>
		<%
	}
	}
%>
</tbody>
</table>
</body>
</html>