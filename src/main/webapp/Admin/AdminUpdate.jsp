<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/home.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>회원가입</title>
<style type="text/css">
		.adidup_div {
			text-align: center;
			margin: 10px;
			
		}
		*{
		font-family: do hyeon; 
		}
	</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="adidup_div">
<h3>관리자 회원정보수정</h3>
<form id="gaip_chk" method="post" action="<%=request.getContextPath() %>/Admin/update">
<input type="text" name="hlogin_id" value="${vo.hlogin_id }" readonly="readonly" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
	 
<input placeholder="새로운비밀번호" type="password"    name="pwd" id="hlogin_pass"  size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
<input placeholder="새로운비밀번호확인" type="password"   name="pwdChk" id="hlogin_passcheck"  size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br>
<small id= "pw_text_check" style="color: blue; display: inline;"></small><br>
<input type="text" name="name" value="${vo.name }" maxlength="12"   size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
<input type="text" id="jnum" name="jnum" value="${vo.jnum }" maxlength="13"  size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>

<input type="text" name="age" value="${vo.age }"  maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
<input type="text" name="area" value="${vo.area } " maxlength="12"   size="20"  style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>


	<input type="submit" value="변경하기" id="gaip_btn" style="width: 70pt; height:35pt; background-color: #ff6666;color: white; border: 3px solid white;
	border-radius: 12px; font-size: 16px">
	<input type="button" value="뒤로가기" onclick="history.back(-1);" style="width: 70pt; height:30pt; background-color: white;color: #ff6666; border: 1px solid #ff6666;
		border-radius: 12px; font-size: 16px;">
	</form>
	</div>
</body>

<script type="text/javascript">
hlogin_pass = document.getElementById('hlogin_pass');
hlogin_passcheck = document.getElementById('hlogin_passcheck');



	

hlogin_passcheck.addEventListener('keyup', function(){
	pw = document.getElementById('hlogin_pass').value;
	pw2 = document.getElementById('hlogin_passcheck').value;
	var chekText = document.getElementById('pw_text_check').innerText
	//비밀번호 비교
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
</script>
</html>