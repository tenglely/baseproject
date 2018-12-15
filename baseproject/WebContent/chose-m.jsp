<%@page import="com.teng.model.Medicine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/mchose.mdo" method="post">
		<table class="table table-striped">
<% 
		List<Medicine> list=(List<Medicine>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="4" align="center" height="35" style="font:宋体;font-size:100;">
		药品信息表<br><br>
		<button type="button" class="btn btn-primary" onclick="window.history.back()">返回上一级</button>&nbsp;
		<input type="submit" value="确定" class="btn btn-primary">&nbsp;
		
		</th>
	</tr>
	<tr>
		<th scope="col">编号</th><th scope="col">名称</th><th scope="col">服用方法</th>
		<th scope="col">功效</th><th scope="col">价格</th><th scope="col">当前库存</th>
		<th>购买数量 </th><th>选择购买</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Medicine medicine:list){
%>
		<tr>
			<th scope="row"><%=medicine.getMno() %></th>
			<td ><%=medicine.getMname() %></td>
			<td ><%=medicine.getMmode() %></td>
			<td ><%=medicine.getMefficacy() %></td>
			<td ><%=medicine.getMprice() %></td>
			<td ><%=medicine.getMcount() %></td>
			<td><input type="text" name="<%=medicine.getMno() %>" value="1"></td>
			<td><input type="checkbox" name="mchose" value="<%=medicine.getMno() %>">购买</td>
		</tr>
		<%
	}
	}
%>
	
</tbody>
</table>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>