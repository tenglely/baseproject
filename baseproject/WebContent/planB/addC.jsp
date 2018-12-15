<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="need.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>addClient</title>
</head>
<body>
<br>
	<form action="<%=request.getContextPath() %>/add.cdo" method="post" >
		<table class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">录入顾客信息</th></tr>
			</thead>
			<tr>
			<tr>
				<th align="right" scope="col">姓名：</th>
				<td><input type="text" name="cname" id="cname" onblur="return clientcheck()"></td>
				<td><span id="tips_cname">*姓名由3-10为字符组成</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">性别：</th>
				<td><input type="radio" name="csex" value="男" checked>男
				<input type="radio" name="csex" value="女">女</td>
				<td><span id="tips_csex">*请选择顾客性别</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">年龄：</th>
				<td><input type="text" name="cage" id="cage" onblur="return clientcheck()"></td>
				<td><span id="tips_cage">*请输入正确的年龄</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">住址：</th>
				<td><input type="text" name="caddress" id="caddress" onblur="return clientcheck()"></td>
				<td><span id="tips_caddress">*请输入详细住址</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">电话：</th>
				<td><input type="text" name="cphone" id="cphone" onblur="return clientcheck()"></td>
				<td><span id="tips_cphone">*请输入电话号码</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">症状：</th>
				<td><input type="text" name="csymptom" id="csymptom" onblur="return clientcheck()"></td>
				<td><span id="tips_csymptom">*请正确描述症状</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">已购药品：</th>
				<td><input type="text" name="mno" id="mno" onblur="return clientcheck()"></td>
				<td><span id="tips_mno">*请输入药品编号</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">购买数量：</th>
				<td><input type="text" name="cnum" id="cnum" onblur="return clientcheck()" value="1"></td>
				<td><span id="tips_cnum">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">经办人：</th>
				<td><input type="text" name="ano" id="ano" onblur="return clientcheck()"></td>
				<td><span id="tips_ano">*请输入经办人编号</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">备注：</th>
				<td><input type="text" name="cremark" id="cremark" onblur="return clientcheck()"></td>
				<td><span id="tips_cremark">*限50字以内</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return ClientNull()"></td>
			</tr>
		</table>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>