<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String cp=request.getContextPath(); %>
</head>
<body>
<h1>내정보보기</h1>
<form id="gaip_chk" method="post" action="<%=request.getContextPath() %>/updateid">
아이디<input type="text" name="hlogin_id" value="${vo.hlogin_id }" readonly="readonly"><br>
	 
비밀번호 <input placeholder="새로운비밀번호" type="password" name="pwd" id="hlogin_pass" ><br>
비밀번호확인 <input placeholder="새로운비밀번호확인" type="password" name="pwdChk" id="hlogin_passcheck">
<small id= "pw_text_check" style="color: blue; display: inline;">비밀번호와 동일하게 입력해주세요.</small><br>
이름<input type="text" name="name" value="${vo.name }"><br>
주민번호<input type="text" id="jnum" name="jnum" value="${vo.jnum }" maxlength="13" readonly="readonly"><br>

나이<input type="text" name="age" value="${vo.age }" readonly="readonly"><br>
사는곳<input type="text" name="area" value="${vo.area }"><br>
	<input type="submit" value="변경하기">
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
	</form>
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
		document.getElementById('pw_text_check').style.color = 'blue';
		document.getElementById('pw_text_check').innerText = '비밀번호와 동일하게 입력해주세요.';
	} 
	
	if(pw == pw2){ // 비밀번호, 확인이랑 일치할때
		console.log(pw);
		console.log(pw2);
		document.getElementById('pw_text_check').style.color = 'blue';
		document.getElementById('pw_text_check').innerText = '비밀번호와 일치합니다.';
		return;
	}else{// 비밀번호, 확인이랑 일치 하지 않을때
		document.getElementById('pw_text_check').style.color = 'red';
		document.getElementById('pw_text_check').innerText = '비밀번호와 일치 하지 않습니다.';
	}
})



</script>
<a href=""></a>
</html>