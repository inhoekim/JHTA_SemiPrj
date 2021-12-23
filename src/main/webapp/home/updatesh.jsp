<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<style type="text/css">
		.idup_div {
			text-align: center;
			margin: 10px;
			margin-top:115px;
		}
		*{
		font-family: do hyeon; 
		}
	</style>
<head>
<meta charset="UTF-8">
<link href="../css/home.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Insert title here</title>
<% String cp=request.getContextPath(); %>
</head>
<body>
<div class="idup_div">
<h3>내정보보기</h3>
<form onsubmit="return gaipSubmit1();" id="gaip_chk" method="post" action="<%=request.getContextPath() %>/updateid">
<input type="text" name="hlogin_id" value="${vo.hlogin_id }" readonly="readonly" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px; background-color: #D2D2D2;"><br><br>
	 
<input placeholder="새로운비밀번호" type="password" name="pwd" id="hlogin_pass" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
<input placeholder="새로운비밀번호확인" type="password" name="pwdChk" id="hlogin_passcheck" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br>
<small id= "pw_text_check" style="color: blue; display: inline;"></small><br>
<input type="text" name="name" value="${vo.name }"maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px; background-color:#D2D2D2;"><br><br>
<input type="text" id="jnum" name="jnum" value="${vo.jnum }" maxlength="13" readonly="readonly" size="20"  style="width: 200pt; height:25pt; border-radius: 5px; background-color: #D2D2D2;"><br><br>

<input type="text" name="age" value="${vo.age }"  id="hlogin_age"  maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px; "><br><br>
<input type="text" name="area" value="${vo.area } "  id="hlogin_age" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px; "><br><br>
	<input type="submit" value="변경하기" style="width: 70pt; height:35pt; background-color: #ff6666;color: white; border: 3px solid white;
	border-radius: 12px; font-size: 16px">
		<button type="button" onclick="location.href='${cp}/home' "  style="width: 70pt; height:30pt; background-color: white;color: #ff6666; border: 1px solid #ff6666;
		border-radius: 12px; font-size: 16px;">돌아가기</button>
	</form>
	</div>
</body>
<script type="text/javascript">
hlogin_pass = document.getElementById('hlogin_pass');
hlogin_passcheck = document.getElementById('hlogin_passcheck');


hlogin_pass.addEventListener


hlogin_passcheck.addEventListener('keyup', function(){
	pw = document.getElementById('hlogin_pass').value;
	pw2 = document.getElementById('hlogin_passcheck').value;
	var chekText = document.getElementById('pw_text_check').innerText
	

	if(pw2 == '' || pw2 == null){
		document.getElementById('pw_text_check').style.color = 'black';
		document.getElementById('pw_text_check').innerText = '비밀번호와 동일하게 입력해주세요.';
	} 
	
	if(pw == pw2){ // 비밀번호, 확인이랑 일치할때
		console.log(pw);
		console.log(pw2);
		document.getElementById('pw_text_check').style.color = 'black';
		document.getElementById('pw_text_check').innerText = '비밀번호와 일치합니다.';
		return;
	}else{// 비밀번호, 확인이랑 일치 하지 않을때
		document.getElementById('pw_text_check').style.color = 'red';
		document.getElementById('pw_text_check').innerText = '비밀번호와 일치 하지 않습니다.';
	}
})

function gaipSubmit1(){
	
	
	
	if(document.getElementById('hlogin_pass').value == null || document.getElementById('hlogin_pass').value == ''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if(document.getElementById('hlogin_passcheck').value == null || document.getElementById('hlogin_passcheck').value == ''){
		alert("비밀번호확인을 해주세요");
		return false;
	}
	
	if(document.getElementById('hlogin_age').value == null || document.getElementById('hlogin_age').value == ''){
		alert("나이를 입력해주세요.");
		return false;
	}
	if(document.getElementById('hlogin_area').value == null || document.getElementById('hlogin_area').value == ''){
		alert("주소를 입력해주세요.");
		return false;
	}
	
	return true;
	
}


</script>
<a href=""></a>
</html>