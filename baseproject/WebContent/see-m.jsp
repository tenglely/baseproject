<%@page import="com.teng.model.Medicine"%>
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
<title>SeeTable-Medicine</title>
<script type="text/javascript" src="planB/need.js"></script>
</head>
<body>
<%
	String asee=request.getParameter("asee");
	if(!asee.equals("'true'")){
%>
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
<% }else{ %>
	<button type="button" class="btn btn-primary" onclick="window.history.back()">返回上一级</button>
 <% } %> 	
<div class="collapse" id="collapseExample">
  <div class="card card-body">
    <form action="<%=request.getContextPath()%>/find.mdo?use=null" method="post">
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
<br>
<div style="overflow-x: auto; overflow-y: auto;">
<table class="table table-striped">
<% 
		List<Medicine> list=(List<Medicine>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="4" align="center" height="35" style="font:宋体;font-size:100;">药品信息表         <% if(request.getAttribute("message")!=null) out.print(request.getAttribute("message")); %></th>
	</tr>
	<tr>
		<th scope="col">编号</th><th scope="col">名称</th><th scope="col">服用方法</th>
		<th scope="col">功效</th><th scope="col">价格</th><th scope="col">当前库存</th>
		<th>操作</th>
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
			<td>
				<a href="<%=request.getContextPath() %>/delete.mdo?mno=<%=medicine.getMno()%>&asee=<%=asee%>">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.mdo?updateM=<%=medicine.getMno()%>&asee=<%=asee%>">修改</a> 	
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