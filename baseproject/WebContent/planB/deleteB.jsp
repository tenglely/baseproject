<%@page import="com.teng.model.Buy"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#selectAll").bind("click",function(){
            if($(this).prop("checked")){
                $("input[type='checkbox']").not(this).prop("checked",true);
            }else{
                $("input[type='checkbox']").not(this).prop("checked",false);
            }
        });
    });
</script>
</head>
<body>
		<form action="<%=request.getContextPath()%>/delemore.bdo" method="post">
		<table class="table table-striped">
<% 
		int sum=0;int num=0;
		List<Buy> list=(List<Buy>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="6" align="center" height="35" style="font:宋体;font-size:100;">订单表<br>请勾选需要删除的数据<br><br><input type="submit" value="删除勾选项" class="btn btn-primary"></th>
	</tr>
	<tr><th scope="col">
		<input class="checkboxes" value="chkall" type="checkbox"   name="chkall" id="selectAll" >
		全选
		</th>
		<th scope="col">订单编号</th><th scope="col">经办人编号</th><th scope="col">顾客编号</th>
		<th scope="col">药品编号</th><th scope="col">症状</th><th scope="col">购买数量</th>
		<th scope="col">总价格</th><th scope="col">日期</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Buy buy:list){
		sum=sum+buy.getPrice();
		num=num+buy.getNum();
%>
		<tr>
			<td><input type="checkbox" name="moreB" value="<%=buy.getSno() %>"></td>
			<th scope="row"><%=buy.getSno() %></th>
			<td ><%=buy.getAno() %></td>
			<td ><%=buy.getCno() %></td>
			<td ><%=buy.getMno() %></td>
			<td><%=buy.getCsymptom() %></td>
			<td ><%=buy.getNum()%></td>
			<td ><%=buy.getPrice() %></td>
			<td ><%=buy.getDate()%></td>
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
</form>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>