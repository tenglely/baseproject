<%@page import="com.teng.model.Medicine"%>
<%@page import="com.teng.model.Client"%>
<%@page import="com.teng.model.Agency"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="planB/need.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>update</title>
</head>
<body>
	<%
	if(request.getAttribute("result")!=null&&request.getAttribute("result")!=""){
%>	
	<center>
	<br><br><br>
	<div class="card">
  		<div class="card-header">无该修改信息 </div>
  		<div class="card-body">
    	<h5 class="card-title">修改信息失败，无该修改信息存在</h5>
   		<p class="card-text">请重新查询</p>
   		<button type="button" class="btn btn-primary" onclick="window.history.back()">返回上一级</button>
  		</div>
		</div>	
	</center>	
<% 
	}
%>
<% 
	if(request.getAttribute("agency")!=""&&request.getAttribute("agency")!=null){
		Agency agency=(Agency)request.getAttribute("agency");	
		String a=request.getParameter("a");
	%>
	<center>
	<div align="left">
	<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>
	</div><br>
	<div class="card">
  		<div class="card-header"><b>确定修改信息</b> </div>
  		<div class="card-body">
  		<form action="<%=request.getContextPath()%>/update.ado?ano=<%=agency.getAno() %>&a=<%=a %>" method="post">
    	<table class="table">
    		<tr>
				<td align="right">用户类型：</td>
				<td>
					<% if(a.equals("'true'")){
						
					%>
					<select name="aclass" id="aclass">
						<option value="经办人" <%if(agency.getAclass().equals("经办人")) out.print("selected='true'"); %>>经办人</option>
					</select><br>
					<% }else if(a.equals("'other'")){ %>
					<select name="aclass" id="aclass">
						<option value="采购人员" <%if(agency.getAclass().equals("采购人员")) out.print("selected='true'"); %>>采购人员</option>
					</select><br>
					<% }else{ %>
					<select name="aclass" id="aclass">
						<option value="经办人" <%if(agency.getAclass().equals("经办人")) out.print("selected='true'"); %>>经办人</option>
						<option value="采购人员" <%if(agency.getAclass().equals("采购人员")) out.print("selected='true'"); %>>采购人员</option>
						<option value="管理员" <%if(agency.getAclass().equals("管理员")) out.print("selected='true'"); %>>管理员</option>
					</select><br>
					<% } %>
				</td>
				<td align="left"><span>*不同用户,权限不同</span></td>
			</tr>
    		<tr>
				<td align="right" scope="col">姓名：</td>
				<td><input type="text" name="aname" id="aname" onblur="return check()" value="<%=agency.getAname()%>"></td>
				<td align="left"><span id="tips_aname">*</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">密码：</td>
				<td><input type="password" name="apassword" id="apassword" onblur="return check()" value="<%=agency.getApassword()%>"></td>
				<td align="left"><span id="tips_apsw">*</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">重输密码：</td>
				<td><input type="password" name="repassword" id="repassword" onblur="return check()" value="<%=agency.getApassword()%>"></td>
				<td align="left"><span id="tips_repsw">*</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">性别：</td>
				<td><input type="radio" name="asex" value="男" <%if(agency.getAsex().equals("男")) out.print("checked") ;%>>男
				<input type="radio" name="asex" value="女" <%if(agency.getAsex().equals("女")) out.print("checked") ;%>>女</td>
				<td align="left"><span id="tips_asex">*</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">电话：</td>
				<td><input type="text" name="aphone" id="aphone" onblur="return check()" value="<%=agency.getAphone()%>"></td>
				<td align="left"><span id="tips_aphone">*</span></td>
			</tr>
			<tr>
				<td align="right" scope="col">备注：</td>
				<td><input type="text" name="aremark" id="aremark" onblur="return check()" value="<%=agency.getAremark()%>"></td>
				<td align="left"><span id="tips_aremark">*</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="修改信息" style="background-color: #FAFAD2;" onclick="return checkNULL()"></td>
			</tr>
    	</table>
    	</form>
    	</div>
		</div>	
	</center>
	<%} %>	
	
	<% 
	if(request.getAttribute("client")!=""&&request.getAttribute("client")!=null){
		Client client=(Client)request.getAttribute("client");	
	%>
	<center>
	<div align="left">
	<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>
	</div><br>
	<% String use=(String)request.getParameter("use"); %>
	<div class="card">
  		<div class="card-header"><b>确定修改信息</b> </div>
  		<div class="card-body">
  		<form action="<%=request.getContextPath()%>/update.cdo?cno=<%=client.getCno() %>&use=<%=use %>" method="post">
  			<table class="table">
			<tr>
				<th align="right" scope="col">姓名：</th>
				<td><input type="text" name="cname" id="cname" onblur="return clientcheck()" value="<%=client.getCname()%>"></td>
				<td><span id="tips_cname">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">性别：</th>
				<td><input type="radio" name="csex" value="男" <% if(client.getCsex().equals("男")) out.print("checked"); %>>男
				<input type="radio" name="csex" value="女" <% if(client.getCsex().equals("女")) out.print("checked");%>>女</td>
				<td><span id="tips_csex">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">年龄：</th>
				<td><input type="text" name="cage" id="cage" onblur="return clientcheck()" value="<%=client.getCage()%>"></td>
				<td><span id="tips_cage">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">住址：</th>
				<td><input type="text" name="caddress" id="caddress" onblur="return clientcheck()" value="<%=client.getCaddress()%>"></td>
				<td><span id="tips_caddress">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">电话：</th>
				<td><input type="text" name="cphone" id="cphone" onblur="return clientcheck()" value="<%=client.getCphone()%>"></td>
				<td><span id="tips_cphone">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">备注：</th>
				<td><input type="text" name="cremark" id="cremark" onblur="return clientcheck()" value="<%=client.getCremark()%>"></td>
				<td><span id="tips_cremark">*</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return ClientNull()"></td>
			</tr>
		</table>
		</form>
    	</div>
		</div>	
	</center>
	
	<%} %>	
	
	<% 
	if(request.getAttribute("medicine")!=""&&request.getAttribute("medicine")!=null){
			Medicine medicine=(Medicine)request.getAttribute("medicine");
		
	%>
	<center>
	<div align="left">
	<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>
	</div><br>
	<% String asee=request.getParameter("asee"); %>
	<% String use=request.getParameter("use"); %>
	<div class="card">
  		<div class="card-header"><b>确定修改信息</b> </div>
  		<div class="card-body">
  		<form action="<%=request.getContextPath()%>/update.mdo?mno=<%=medicine.getMno() %>&asee=<%=asee %>&use=<%=use %>" method="post">
  			<table class="table">
			<tr>
				<th align="right" scope="col">名称：</th>
				<td><input type="text" name="mname" id="mname" onblur="return MedicineCheck()" value="<%=medicine.getMname()%>"></td>
				<td><span id="tips_mname">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">服用方法：</th>
				<td><input type="radio" name="mmode" value="内服" <% if(medicine.getMmode().equals("内服")) out.print("checked"); %>>内服
				<input type="radio" name="mmode" value="外服" <% if(medicine.getMmode().equals("外服")) out.print("checked"); %>>外服</td>
				<td><span id="tips_mmode">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">功效：</th>
				<td><input type="text" name="mefficacy" id="mefficacy" onblur="return MedicineCheck()" value="<%=medicine.getMefficacy()%>"></td>
				<td><span id="tips_mefficacy">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">价格：</th>
				<td><input type="text" name="mprice" id="mprice" onblur="return MedicineCheck()" value="<%=medicine.getMprice()%>"></td>
				<td><span id="tips_mprice">*</span></td>
			</tr>
			<tr>
				<th align="right" scope="col">库存：</th>
				<td><input type="text" name="mcount" id="mcount" onblur="return MedicineCheck()" value="<%=medicine.getMcount()%>"></td>
				<td><span id="tips_mcount">*</span></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="修改" style="background-color: #FAFAD2;" onclick="return MedicineNull()"></td>
			</tr>
		</form>
    	</div>
		</div>	
	</center>
	
	<%} %>	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>