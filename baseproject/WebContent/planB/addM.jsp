<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addMedicine</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script type="text/javascript" src="need.js"></script>
</head>
<body>
<br>
	 <form action="<%=request.getContextPath() %>/add.mdo" method="post" >
		<table class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">录入药物信息</th></tr>
			</thead>
			<tr>
				<th align="right" scope="col">名称：</th>
				<td><input type="text" name="mname" id="mname" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mname">*名称由2-20为字符组成</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">服用方法：</th>
				<td><input type="radio" name="mmode" value="内服" checked>内服
				<input type="radio" name="mmode" value="外服">外服</td>
				<td><span id="tips_mmode">*请选择服用方法</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">功效：</th>
				<td><input type="text" name="mefficacy" id="mefficacy" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mefficacy">*请输入药物功效</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">价格：</th>
				<td><input type="text" name="mprice" id="mprice" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mprice">*请输入药物价格</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">库存：</th>
				<td><input type="text" name="mcount" id="mcount" onblur="return MedicineCheck()"></td>
				<td><span id="tips_mcount">*请输入药物价格</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return MedicineNull()"></td>
			</tr>
		</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>