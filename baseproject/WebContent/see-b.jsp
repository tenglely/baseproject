<%@page import="java.util.List"%>
<%@page import="com.teng.model.Buy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
   <form action="<%=request.getContextPath()%>/findBySno.bdo?use=null" method="post">
      		<table class="table">
      		<thead>
      			<tr><th colspan="2" scope="row" align="center" ><span id="find-btitle">请输入以下任意至少一项信息，来进行查询</span></th></tr>
      		</thead>
      			<tr>
      				<td scope="col" align="right">订单编号：</td>
      				<td><input type="text" name="sno" id="sno"></td>
      				<td scope="col" align="right">顾客编号：</td>
      				<td><input type="text" name="cno" id="cno"></td>
      			</tr>
      			<tr>
      			    <td scope="col" align="right">药品编号：</td>
      				<td><input type="text" name="mno" id="mno"></td>
      				<td scope="col" align="right">经办人编号：</td>
      				<td><input type="text" name="ano" id="ano"></td>
      			</tr>
      			<tr><td align="right"><input type="submit" value="查找" class="btn" onclick="return findBuy()"></td></tr>
      		</table>
      	</form>
  </div>
</div>
	<table class="table table-striped">
<% 
		int sum=0;int num=0;
		List<Buy> list=(List<Buy>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="6" align="center" height="35" style="font:宋体;font-size:100;">订单表</th>
	</tr>
	<tr>
		<th scope="col">订单编号</th><th scope="col">经办人编号</th><th scope="col">顾客编号</th>
		<th scope="col">药品编号</th><th scope="col">症状</th><th scope="col">购买数量</th>
		<th scope="col">总价格</th><th scope="col">日期</th><th scope="col">操作</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Buy buy:list){
		sum=sum+buy.getPrice();
		num=num+buy.getNum();
%>
		<tr>
			<th scope="row"><%=buy.getSno() %></th>
			<td ><a href="<%=request.getContextPath()%>/find.ado?ano=<%=buy.getAno()%>&use=null"><%=buy.getAno() %></a></td>
			<td ><a href="<%=request.getContextPath()%>/find.cdo?cno=<%=buy.getCno()%>&use=null"><%=buy.getCno() %></a></td>
			<td ><a href="<%=request.getContextPath()%>/find.mdo?mno=<%=buy.getMno()%>&use=null"><%=buy.getMno() %></a></td>
			<td><%=buy.getCsymptom() %></td>
			<td ><%=buy.getNum()%></td>
			<td ><%=buy.getPrice() %></td>
			<td ><%=buy.getDate()%></td>
			<td>
				<a href="<%=request.getContextPath()%>/delete.bdo?sno=<%=buy.getSno()%>&use=null">删除</a>&nbsp;
			</td>
		</tr>
<%
	}
	}
%>
		<tr>
			<td scope="row">总价值：<%=sum %></td>
			<td scope="row">销售总数：<%=num %></td>
		</tr>
</tbody>
</table>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>