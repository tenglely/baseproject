//返回上一级
function goBack()
  {
  window.history.back()
  }
//判断查找agency的格是否全为空
function findAgency() {
	if(document.getElementById("find-ano").value==""||document.getElementById("find-ano").value==null){
		if(document.getElementById("find-aname").value==""||document.getElementById("find-aname").value==null){
			if(document.getElementById("find-aphone").value==""||document.getElementById("find-aphone").value==null){
				document.getElementById("find-atitle").innerHTML="<em style='color:#FF0000'>请至少填写一项来进行查询</em>";
				document.getElementById("find-ano").focus();
				return false;
			}
		}
	}
}
//判断查找client的格是否全为空
function findClient() {
	if(document.getElementById("find-cno").value==""||document.getElementById("find-cno").value==null){
		if(document.getElementById("find-cname").value==""||document.getElementById("find-cname").value==null){
			if(document.getElementById("find-mno").value==""||document.getElementById("find-mno").value==null){
				if(document.getElementById("find-ano").value==""||document.getElementById("find-ano").value==null){
					document.getElementById("find-ctitle").innerHTML="<em style='color:#FF0000'>请至少填写一项来进行查询</em>";
					document.getElementById("find-cno").focus();
					return false;
				}
			}
		}
	}
}
//判断查找medicine的格是否全为空
function findMedicine(){
	if(document.getElementById("find-mnno").value==""||document.getElementById("find-mnno").value==null){
		if(document.getElementById("find-mname").value==""||document.getElementById("find-mname").value==null){
			document.getElementById("find-mtitle").innerHTML="<em style='color:#FF0000'>请至少填写一项来进行查询</em>";
			document.getElementById("find-mnno").focus();
			return false;
		}
	}
}
function findBuy(){
	if(document.getElementById("sno").value==""||document.getElementById("sno").value==null){
		if(document.getElementById("cno").value==""||document.getElementById("cno").value==null){
			if(document.getElementById("mno").value==""||document.getElementById("mno").value==null){
				if(document.getElementById("ano").value==""||document.getElementById("ano").value==null){
					document.getElementById("find-btitle").innerHTML="<em style='color:#FF0000'>请至少填写一项来进行查询</em>";
					document.getElementById("sno").focus();
					return false;
				}
			}
		}
	}
}
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

function ClientNull() {
		if(document.getElementById("cname").value==""||document.getElementById("cname").value==null){
			document.getElementById("cname").focus();
			return false;
		}
	}
	
function MedicineNull() {
		if(document.getElementById("mname").value==""||document.getElementById("mname").value==null){
			document.getElementById("mname").focus();
			return false;
		}
	}

function MedicineCheck() {
		if(document.getElementById("mname").value.length<2||document.getElementById("mname").value.length>20){
			document.getElementById("tips_mname").innerHTML="<em style='color:#FF0000'>药物名由2-20为字符组成</em>";
			document.getElementById("mname").focus();
			return false;
		}else{
			document.getElementById("tips_mname").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("mefficacy").value.length<1||document.getElementById("mefficacy").value.length>50){
			document.getElementById("tips_mefficacy").innerHTML="<em style='color:#FF0000'>限50字以内</em>";
			document.getElementById("tips_mefficacy").focus();
			return false;
		}else{
			document.getElementById("tips_mefficacy").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("mprice").value<0||document.getElementById("mprice").value>150||document.getElementById("mprice").value==""){
			document.getElementById("tips_mprice").innerHTML="<em style='color:#FF0000'>价格格式错误，请填入正确价格</em>";
			document.getElementById("mprice").focus();
			return false;
		}else{
			document.getElementById("tips_mprice").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
		
		if(document.getElementById("mcount").value<0||document.getElementById("mcount").value>1500||document.getElementById("mcount").value==""){
			document.getElementById("tips_mcount").innerHTML="<em style='color:#FF0000'>库存要大于0且不能为空</em>";
			document.getElementById("mcount").focus();
			return false;
		}else{
			document.getElementById("tips_mcount").innerHTML="<em style='color:#FF0000'>!OK</em>";
		}
	}
	
function clientcheck() {
	if(document.getElementById("cname").value.length<2||document.getElementById("cname").value.length>10){
		document.getElementById("tips_cname").innerHTML="<em style='color:#FF0000'>姓名由2-10为字符组成</em>";
		document.getElementById("cname").focus();
		return false;
	}else{
		document.getElementById("tips_cname").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("cage").value<0||document.getElementById("cage").value>150||document.getElementById("cage").value==""){
		document.getElementById("tips_cage").innerHTML="<em style='color:#FF0000'>年龄错误</em>";
		document.getElementById("cage").focus();
		return false;
	}else{
		document.getElementById("tips_cage").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("caddress").value.length==0||document.getElementById("caddress").value.length>150){
		document.getElementById("tips_caddress").innerHTML="<em style='color:#FF0000'>地址字符过长或为空</em>";
		document.getElementById("caddress").focus();
		return false;
	}else{
		document.getElementById("tips_caddress").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("cphone").value.length<6||document.getElementById("cphone").value.length>11){
		document.getElementById("tips_cphone").innerHTML="<em style='color:#FF0000'>请输入正确的电话号码</em>";
		document.getElementById("tips_cphone").focus();
		return false;
	}else{
		document.getElementById("tips_cphone").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("csymptom").value.length<0||document.getElementById("csymptom").value.length>150){
		document.getElementById("tips_csymptom").innerHTML="<em style='color:#FF0000'>症状描述字符过长或为空</em>";
		document.getElementById("csymptom").focus();
		return false;
	}else{
		document.getElementById("tips_csymptom").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("cremark").value.length>50){
		document.getElementById("tips_cremark").innerHTML="<em style='color:#FF0000'>限50字以内</em>";
		document.getElementById("cremark").focus();
		return false;
	}else{
		document.getElementById("tips_cremark").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
	
	if(document.getElementById("cnum").value<1||document.getElementById("cnum").value==""){
		document.getElementById("tips_cnum").innerHTML="<em style='color:#FF0000'>数量要大于1</em>";
		document.getElementById("cnum").focus();
		return false;
	}else{
		document.getElementById("tips_cnum").innerHTML="<em style='color:#FF0000'>!OK</em>";
	}
}