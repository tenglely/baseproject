<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addAgency</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script type="text/javascript" src="need.js"></script>
</head>
<body>
<br>
	<form action="<%=request.getContextPath() %>/add.ado" method="post" >
		<table class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">录入经办人信息</th></tr>
			</thead>
			<tr>
				<td align="right">用户类型：</td>
				<td>
					<select name="aclass" id="aclass">
						<option value="经办人">经办人</option>
						<option value="采购人员">采购人员</option>
						<option value="管理员">管理员</option>
					</select><br>
				</td>
				<td align="left"><span>*不同用户权限不同</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">姓名：</td>
				<td><input type="text" name="aname" id="aname" onblur="return check()"></td>
				<td align="left"><span id="tips_aname">*姓名由2-10为字符组成</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">密码：</td>
				<td><input type="password" name="apassword" id="apassword" onblur="return check()"></td>
				<td align="left"><span id="tips_apsw">*密码由6-18为字符组成</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">重输密码：</td>
				<td><input type="password" name="repassword" id="repassword" onblur="return check()"></td>
				<td align="left"><span id="tips_repsw">*请重新输入密码</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">性别：</td>
				<td><input type="radio" name="asex" value="男" checked>男
				<input type="radio" name="asex" value="女">女</td>
				<td align="left"><span id="tips_asex">*请选择你的性别</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">电话：</td>
				<td><input type="text" name="aphone" id="aphone" onblur="return check()"></td>
				<td align="left"><span id="tips_aphone">*请输入电话号码</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">备注：</td>
				<td><input type="text" name="aremark" id="aremark" onblur="return check()"></td>
				<td align="left"><span id="tips_aremark">*限50字以内</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return checkNULL()"></td>
			</tr>
		</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>