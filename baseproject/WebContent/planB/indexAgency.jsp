<%@page import="com.teng.model.Medicine"%>
<%@page import="java.util.List"%>
<%@page import="com.teng.model.Agency"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>经办人操作界面</title>
</head>
<body>
	<%
		Agency agency=(Agency)session.getAttribute("agency");
	%>
<!-- 导航栏 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="#">导航栏</a>
  	<div class="collapse navbar-collapse" id="navbarNav">
    	<ul class="navbar-nav">
      		<li class="nav-item" active>
        		<a class="nav-link" href="<%=request.getContextPath() %>/planB/indexAgency.jsp">登记顾客</a>
      		</li>
      		<li class="nav-item" active>
        		<a class="nav-link" href="<%=request.getContextPath()%>/findBySno.bdo?ano=<%=agency.getAno()%>&use='use'">订单记录</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<%=request.getContextPath()%>/updatecheck.ado?updateA=<%=agency.getAno()%>&a='true'">修改个人信息</a>
      		</li>
    	</ul>
  	</div>
  	<h5>欢迎您,经办人：<%=agency.getAname() %></h5>
</nav>
	<!-- 登记顾客 -->
	<br>
	<form action="<%=request.getContextPath() %>/AgencyAdd.cdo" method="post" >
		<table class="table">
			<thead>
			<tr><th class="alert alert-primary" role="alert" colspan="3">登记顾客信息</th></tr>
			</thead>
			
			<tr>
				<td>
				<a class="btn btn-primary"  href="<%=request.getContextPath()%>/seetable?table=mchose">选择药物
  				</a>
  				</td>
  				<td>*请选择药品</td>
			</tr>
			<tr>
				<th align="right" scope="col">已购药品：</th>
				<td>
				<%
				if(request.getAttribute("mList")!=null&&request.getAttribute("mList")!=""){
					List<Medicine> mlist=(List<Medicine>)request.getAttribute("mList");
					String num[]=(String[])request.getAttribute("mnum");
					int i=0;int sum=0;
					for(Medicine medicine:mlist){
						out.println("药物名："+medicine.getMname());
						out.println("   购买数量:"+num[i]+"<br>");
						sum+=medicine.getMprice()*Integer.parseInt(num[i]);
						i++;
					}
					out.print("总价格为："+sum);
					session.setAttribute("mlist", mlist);
					session.setAttribute("num", num);
				}
				
			%>
			<script type="text/javascript" src="planB/need.js"></script>
				</td>
			</tr>
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
				<td><input type="hidden" name="ano" value="<%=agency.getAno() %>"></td>
			</tr>
			<tr>
				<th align="right" scope="col">备注：</th>
				<td><input type="text" name="cremark" id="cremark" onblur="return clientcheck()"></td>
				<td><span id="tips_cremark">*限50字以内</span></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="录入" style="background-color: #FAFAD2;" onclick="return ClientNull()"></td>
				<td align="left"><input type="reset" value="重置" style="background-color: #FAFAD2;"></td>
			</tr>
		</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>