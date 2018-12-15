<%@page import="com.teng.model.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>seeTable-Client</title>
<script type="text/javascript" src="planB/need.js"></script>
</head>
<body>
<form action="<%=request.getContextPath()%>/seetable" method="post">
			<table style="border: 1px #ccc solid;">
			<tr>
			<td align="right">选择要浏览的表格：</td>
			<td align="left">
			<select name="table">
				<option value="agency">Agency(员工)</option>
				<option value="client">Client(顾客)</option>
				<option value="medicine">Medicine(药物)</option>
				<option value="buy">订单</option>
			</select>
		</td>
	<td><input type="submit" value="查询" class="btn btn-outline-primary"></td>
	<td>
  		<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  	 		 详细查询
  		</a>
	</td>
</tr>
</table>
</form>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
   <form action="<%=request.getContextPath()%>/find.cdo?use=null" method="post">
       		<table class="table">
       		<thead>
       			<tr><th colspan="3" align="center"><span id="find-ctitle">请输入以下任意至少一项信息，来进行查询</span></th></tr>
       		</thead>
       			<tr>
       				<td scope="col" align="right">顾客编号：</td>
       				<td><input type="text" name="cno" id="find-cno"></td>
       				<td scope="col" align="right">顾客姓名：</td>
       				<td><input type="text" name="cname" id="find-cname"></td>
       			</tr>
       			<tr>
       				<td scope="col" align="right">性别：</td>
       				<td><input type="text" name="csex" id="find-mno"></td>
       				<td scope="col" align="right">年龄：</td>
       				<td><input type="text" name="cage" id="find-ano"></td>
       			</tr>
       			<tr><td align="right"><input type="submit" value="查询" class="btn" onclick="return findClient()"></td></tr>
       		</table>
       	</form></div>
</div>
<br>
<div style="overflow-x: auto; overflow-y: auto;">
<table class="table table-striped">
<% 
		List<Client> list=(List<Client>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="12" align="center" height="35" style="font:宋体;font-size:100;">顾客信息表</th>
	</tr>
	<tr>
		<th scope="col">编号</th><th scope="col">姓名</th><th scope="col">性别</th><th scope="col">年龄</th><th scope="col">住址</th>
		<th scope="col">电话</th><th scope="col">备注</th><th scope="col">操作</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Client client:list){
%>
		<tr>
			<th scope="row"><a href="<%=request.getContextPath()%>/findBySno.bdo?cno=<%=client.getCno() %>&use=null"><%=client.getCno() %></a></th>
			<td><%=client.getCname() %></td>
			<td ><%=client.getCsex() %></td>
			<td ><%=client.getCage() %></td>
			<td ><%=client.getCaddress() %></td>
			<td ><%=client.getCphone() %></td>
			<td ><%=client.getCremark() %></td>
			<td>
				<a href="<%=request.getContextPath() %>/delete.cdo?cno=<%=client.getCno()%>&a=null">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.cdo?updateC=<%=client.getCno()%>">修改</a> 
			
			</td>
		</tr>
		<%
	}
	}
%>
</tbody>
</table>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>