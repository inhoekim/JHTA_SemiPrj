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
	input:focus {
  color: #ff6666;
}
		.gaip_div {
			text-align: center;
			margin: 10px;
			margin-top:80px;
		}
		*{
		font-family: do hyeon; 
		}
	</style>
</head>

<body>
<div class="gaip_div"><br>
	<h2 style="">회원가입</h2>
	<br>
	<form onsubmit="return gaipSubmit();" id="gaip_chk" method="post" action="<%=request.getContextPath() %>/Gaipsh">
	<input placeholder="아이디 입력" type="text" id= "hlogin_id" name="hlogin_id" maxlength="12" size="20"  style="width: 200pt; height:25pt; border-radius: 5px;">
		 <input type="button" id= "hcheck_btn" value="중복확인" onclick="openIdChk()" style="width: 65pt; height:27pt; background-color: white;color: #ff6666; border: 1px solid #ff6666;
		border-radius: 9px; font-size: 14px; position: absolute;  cursor: pointer;" ><br>
		 <small id= "hlogin_id_check" style="color: blue; display: inline;"></small>
		 <br>
		 <input type="hidden" id="idChkYn" value='N'>
	 <input placeholder="비밀번호 입력 4자리이상" type="password" name="pwd" id="hlogin_pass" maxlength="12" size="20" style="width: 200pt; height:25pt; border-radius: 5px;"><br>
		<small id= "pw_text_first" style="color: blue; display: inline;"></small>
		<br>
	 <input placeholder="비밀번호 확인" type="password" name="pwdChk" id="hlogin_passcheck" maxlength="12" size="20" required  style="width: 200pt; height:25pt; border-radius: 5px;"><br>
	<small id= "pw_text_check" style="color: blue; display: inline;"></small>
	<br>
	<input placeholder="이름 입력"  type="text" name="name" id="hlogin_name" maxlength="5" size="20" style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
	<input  placeholder="주민등록번호 입력" type="text" id="jnum" name="jnum" maxlength="13" style="width: 200pt; height:25pt; border-radius: 5px;"><br>
	<small id= "jnum_text_check" style="color: blue; display: inline;"></small>
	<br>
	<input placeholder="나이 입력" type="text" name="age"  id="hlogin_age" maxlength="12" size="20" style="width: 200pt; height:25pt; border-radius: 5px;"><br><br>
	<input placeholder="주소 입력"type="text" name="area" id="hlogin_area" maxlength="12" size="20" style="width: 200pt; height:25pt; border-radius: 5px;"><br><br><br><br>
	<input type="submit" value="가입하기" id="gaip_btn" style="width: 215pt; height:35pt; background-color: #ff6666;color: white; border: 3px solid white;
	border-radius: 12px; font-size: 16px;  cursor: pointer; ">
	</form>
	</div>
</body>
<script type="text/javascript">
function checkNumber(value) {
	   if (isNaN(value)) {
	      alert("나이를 숫자로만 입력해주세요");
	      return "";
	   } else return value;
	}
function gaiphsh(){
	
	// 변수 선언 id값 넣기
	hchek_btn = document.getElementById('hcheck_btn');
	hlogin_pass = document.getElementById('hlogin_pass');
	hlogin_passcheck = document.getElementById('hlogin_passcheck');
	jnum_text_check = document.getElementById('jnum_text_check');
	jnum = document.getElementById('jnum');
	gaip_btn = document.getElementById('gaip_btn');
	hlogin_name = document.getElementById('hlogin_name');
	hlogin_age = document.getElementById('hlogin_age');
	hlogin_area = document.getElementById('hlogin_area');
	
	
	// hlogin_age.addEventListener('focusout', function(){
	// 	agechk = document.getElementById('hlogin_age').value;
	// 	var regAge = /[0-9]/g;
	// 	if(!regAge.test(agechk))
	// 		alert('나이는 숫자로 입력해주세요');
	// })
	//
	// hlogin_area.addEventListener('focusout', function(){
	// 	areachk = document.getElementById('hlogin_area').value;
	// 	var regArea = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
	// 	if(!regArea.test(areachk))
	// 		alert('주소은 한글로만 입력해주세요');
	// 	return false;
	// })
	
	
	// hlogin_name.addEventListener('keypress', function(){
	// 	namechk = document.getElementById('hlogin_name').value;
	// 	var regName = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
	// 	if(!regName.test(namechk))
	// 		alert('이름은 한글로만 입력해주세요');
	// })

	
	hlogin_passcheck.addEventListener('keyup', function(){
		pw = document.getElementById('hlogin_pass').value;
		pw2 = document.getElementById('hlogin_passcheck').value;
		var chekText = document.getElementById('pw_text_check').innerText
		
		
		
		var regPwd = /^[A-Za-z0-9+]*$/;

		if(!regPwd.test(pw) ||pw.length <= 3) {
			document.getElementById('pw_text_first').style.color = 'red';
			document.getElementById('pw_text_first').innerText = '잘못된 비밀번호 입니다.';
		}else{
			if(pw.length > 3){
				document.getElementById('pw_text_first').style.color = 'black';
				document.getElementById('pw_text_first').innerText = '올바른 비밀번호 입니다.';
			}
		}

		
		if(pw == pw2){ // 비밀번호, 확인이랑 일치할때
			console.log(pw);
			console.log(pw2);
			document.getElementById('pw_text_check').style.color = 'black';
			document.getElementById('pw_text_check').innerText = '비밀번호와 일치합니다';
			return;
		}else{// 비밀번호, 확인이랑 일치 하지 않을때
			document.getElementById('pw_text_check').style.color = 'red';
			document.getElementById('pw_text_check').innerText = '비밀번호와 일치 하지 않습니다';
		}
	})
	

	
	jnum.addEventListener('keyup', function(){
		jnum = document.getElementById('jnum').value;
        var juminRule=/[0-9]{13}$/
    			
    			
    		

        if(jnum == '' || jnum == null){
			document.getElementById('jnum_text_check').style.color = 'black';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 13자리를 입력해주세요';
		}
        
        if(!juminRule.test(jnum)) { // 주민등록번호 양식이 일치 할때            
        	document.getElementById('jnum_text_check').style.color = 'red';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 양식이 일치하지 않습니다';


        }else{// 주민등록번호 양식이 일치 할떄
			document.getElementById('jnum_text_check').style.color = 'black';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 양식이 일치합니다';
		}
	})
	
	
}

function gaipSubmit(){
	var juminRule=/[0-9]{13}$/;
	var regName = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
	var regPwd = /^[A-Za-z0-9+]*$/;
	var regAge = /^[0-9]*$/

	if(document.getElementById('hlogin_id').value == null || document.getElementById('hlogin_id').value == '') {
		alert("아이디를 입력해주세요.");
		document.getElementById("hlogin_id").focus();
		return false;
	}

	if(document.getElementById('idChkYn').value != 'Y'){
		alert("중복확인을 해주세요.");
		document.getElementById("hlogin_id").focus();
		console.log(document.getElementById('idChkYn').value);
		return false;
	}
	
	if(document.getElementById('hlogin_pass').value == null || document.getElementById('hlogin_pass').value == ''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if((!regPwd.test(document.getElementById('hlogin_pass').value)) || (document.getElementById('hlogin_pass').value.length <=3)) {
	      document.getElementById("hlogin_pass").focus();
	      return false;
		
	}else if(document.getElementById('hlogin_pass').value != document.getElementById('hlogin_passcheck').value){
		document.getElementById("hlogin_passcheck").focus();
		return false;
	}
	
	if(document.getElementById('hlogin_name').value == null || document.getElementById('hlogin_name').value == ''){
		alert("이름를 입력해주세요.");
		document.getElementById("hlogin_name").focus();
		return false;
	}else if(!regName.test(document.getElementById('hlogin_name').value)) {
		alert("이름은 한글로 입력해주세요.");
		document.getElementById("hlogin_name").focus();
		return false;
	}

	if(document.getElementById('jnum').value == null || document.getElementById('jnum').value == ''){
		alert("주민등록번호를 입력해주세요.");
		document.getElementById("jnum").focus();
		return false;
	}else if(!juminRule.test(document.getElementById('jnum').value)){
		alert("주민번호를 형식에 맞게 입력해주세요.");
		document.getElementById("jnum").focus();
		return false;
	}

	if(document.getElementById('hlogin_age').value == null || document.getElementById('hlogin_age').value == ''){
		alert("나이를 입력해주세요.");
		document.getElementById("hlogin_age").focus();
		return false;
	}else if(!regAge.test(document.getElementById('hlogin_age').value)) {
		alert("나이는 숫자로 입력해주세요.");
		document.getElementById("hlogin_age").focus();
		return false;
	}

	if(document.getElementById('hlogin_area').value == null || document.getElementById('hlogin_area').value == ''){
		alert("주소를 입력해주세요.");
		document.getElementById("hlogin_area").focus();
		return false;
	}else if(!regName.test(document.getElementById('hlogin_area').value)) {
		alert("주소는 한글로 입력해주세요.");
		document.getElementById("hlogin_area").focus();
		return false;
	}
	
	return true;
	
}
function openIdChk(){//중복버튼을 누르면 실행될 함수
	
	var inputId = document.getElementById('hlogin_id').value;
	var regId = /^[A-Za-z0-9+]*$/;

	if(!regId.test(inputId)) {
		alert('아이디 형식이 잘못됬습니다.\n영문 및 숫자로만 입력하세요.');
		document.getElementById('hlogin_id').focus;
		return false;
	}

	
	let xhr=new XMLHttpRequest();

	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			var hlogin_id = document.getElementById("hlogin_id");
			let span=document.getElementById("hlogin_id_check");
			console.log(xhr);
			if(data=="1"){
				span.innerHTML="사용중인 아이디입니다";
				span.style.color = 'red';
				document.getElementById('idChkYn').value = 'N'
			}else{
				
				span.innerHTML="사용가능한 아이디입니다";
				span.style.color = 'black';
				document.getElementById('idChkYn').value = 'Y'
				console.log(document.getElementById('idChkYn').value)
			}
		}
	};
	xhr.open('post','${pageContext.request.contextPath}/idcheck?hlogin_id=' + document.getElementById("hlogin_id").value,true);
	xhr.send();
}

gaiphsh();
</script>

</html>