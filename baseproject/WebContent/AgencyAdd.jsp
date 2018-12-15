<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加Agency</title>
<script type="text/javascript">
	function check() {
		if(document.getElementById("aname").value.length<3||document.getElementById("aname").value.length>10){
			document.getElementById("tips_aname").innerHTML="<em style='color:#FF0000'>姓名由3-10为字符组成</em>";
			document.getElementById("aname").focus();
			return false;
		}else{
			document.getElementById("tips_aname").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("apassword").value.length<6||document.getElementById("apassword").value.length>18){
			document.getElementById("tips_apsw").innerHTML="<em style='color:#FF0000'>密码由6-18为字符组成</em>";
			document.getElementById("apassword").focus();
			return false;
		}else{
			document.getElementById("tips_apsw").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("repassword").value!=document.getElementById("apassword").value){
			document.getElementById("tips_repsw").innerHTML="<em style='color:#FF0000'>两次输入的密码不一致</em>";
			document.getElementById("repassword").focus();
		}else{
			document.getElementById("tips_repsw").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("aphone").value.length<6||document.getElementById("aphone").value.length>11){
			document.getElementById("tips_aphone").innerHTML="<em style='color:#FF0000'>请输入正确的电话号码</em>";
			document.getElementById("tips_aphone").focus();
			return false;
		}else{
			document.getElementById("tips_aphone").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("aremark").value.length>50){
			document.getElementById("tips_aremark").innerHTML="<em style='color:#FF0000'>限50字以内</em>";
			document.getElementById("tips_aremark").focus();
			return false;
		}else{
			document.getElementById("tips_aremark").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}	
	}
	function checkNULL() {
		if(document.getElementById("aname").value==""||document.getElementById("aname").value==null){
			document.getElementById("aname").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/add.ado" method="post" >
		<table style="margin-left: 200px;padding: 50px;border: 1px #ccc solid; width: 530px">
			<tr>
				<td align="right">姓名：</td>
				<td><input type="text" name="aname" id="aname" onblur="return check()"></td>
				<td><span id="tips_aname">*姓名由3-10为字符组成</span></td>
			</tr>
			<tr>
				<td align="right">密码：</td>
				<td><input type="password" name="apassword" id="apassword" onblur="return check()"></td>
				<td><span id="tips_apsw">*密码由6-18为字符组成</span></td>
			</tr>
			<tr>
				<td align="right">重输密码：</td>
				<td><input type="password" name="repassword" id="repassword" onblur="return check()"></td>
				<td><span id="tips_repsw">*请重新输入密码</span></td>
			</tr>
			<tr>
				<td align="right">性别：</td>
				<td><input type="radio" name="asex" value="男" checked>男
				<input type="radio" name="asex" value="女">女</td>
				<td><span id="tips_asex">*请选择你的性别</span></td>
			</tr>
			<tr>
				<td align="right">电话：</td>
				<td><input type="text" name="aphone" id="aphone" onblur="return check()"></td>
				<td><span id="tips_aphone">*请输入电话号码</span></td>
			</tr>
			<tr>
				<td align="right">备注：</td>
				<td><input type="text" name="aremark" id="aremark" onblur="return check()"></td>
				<td><span id="tips_aremark">*限50字以内</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="注册" style="background-color: #FAFAD2;" onclick="return checkNULL()"></td>
			</tr>
		</table>
	</form>
</body>
</html>