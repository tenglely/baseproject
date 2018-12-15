<%@page import="com.teng.model.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>deleteClient</title>
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
	<div style="overflow-x: auto; overflow-y: auto;">
<form action="<%=request.getContextPath()%>/delemore.cdo" method="post">
<table class="table table-striped">
<% 
		List<Client> list=(List<Client>)request.getAttribute("list");
		if(list!=null&&list.size()>0){
	%>
	<thead>
	<tr>
		<th colspan="12" align="center" height="35" style="font:宋体;font-size:100;">顾客信息表<br>请勾选需要删除的数据<br><br><input type="submit" value="删除勾选项" class="btn btn-primary"></th>
	</tr>
	<tr>
		<th scope="col">
		<input class="checkboxes" value="chkall" type="checkbox"   name="chkall" id="selectAll" >
		全选
		</th>
		<th scope="col">编号</th><th scope="col">姓名</th><th scope="col">性别</th>
		<th scope="col">年龄</th><th scope="col">住址</th><th scope="col">电话</th>
		<th scope="col">备注</th><th scope="col">操作</th>
	</tr>
	</thead>
	<tbody>
<% 
	for(Client client:list){
%>
		<tr>
			<td><input type="checkbox" name="moreC" value="<%=client.getCno() %>"></td>
			<th scope="row"><%=client.getCno() %></th>
			<td><%=client.getCname() %></td>
			<td ><%=client.getCsex() %></td>
			<td ><%=client.getCage() %></td>
			<td ><%=client.getCaddress() %></td>
			<td ><%=client.getCphone() %></td>
			<td ><%=client.getCremark() %></td>
			<td>
				<a href="<%=request.getContextPath() %>/delete.cdo?cno=<%=client.getCno()%>">删除</a>&nbsp;
				<a href="<%=request.getContextPath() %>/updatecheck.cdo?updateC=<%=client.getCno()%>">修改</a> 
			
			</td>
		</tr>
		<%
	}
	}
%>
</tbody>
</table>
</form>
</div>

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>