<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<a class="navbar-brand" href="#">信息管理</a>
	</div>
	<div id="myexample">
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">信息录入<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="addA.jsp" target="show">录入经办人信息</a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">批量删除<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a id="action-1" href="<%=request.getContextPath()%>/seetable?table=deleteMoreC" target="show">删除顾客信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=deleteMoreA" target="show">删除员工信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=deleteMoreM" target="show">删除药物信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=deleteMoreB" target="show">删除订单信息</a></li>	
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">信息操作<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a id="action-1" href="<%=request.getContextPath()%>/seetable?table=client" target="show">操作顾客信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=agency" target="show">操作员工信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=medicine" target="show">操作药物信息</a></li>
					<li><a href="<%=request.getContextPath()%>/seetable?table=buy" target="show">操作订单信息</a></li>
				</ul>
			</li>
			<li class="divider">_______________________________</li>
			<li>
                <a href="outTable.jsp" target="show">数据报表</a>
            </li>
		</ul>
	</div>
	</div>	
</nav>
<script>
$(function(){
	// 默认显示
	$(".dropdown-toggle").dropdown('toggle');
}); 
</script>

</body>
</html>