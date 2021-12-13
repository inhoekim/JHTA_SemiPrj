<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<form id="gaip_chk" method="post" action="<%=request.getContextPath() %>/Gaipsh">
아이디<input placeholder="아이디" type="text" id= "hlogin_id" name="hlogin_id">
	 <input type="button" id= "hcheck_btn" value="중복확인" onclick="openIdChk()">
	 <small id= "hlogin_id_check" style="color: blue; display: inline;"></small>
	 <br>
	 <input type="hidden" value="idDup" onkeydown="idUnChk()">
비밀번호 <input placeholder="비밀번호" type="password" name="pwd" id="hlogin_pass"><br>
비밀번호확인 <input placeholder="비밀번호 확인" type="password" name="pwdChk" id="hlogin_passcheck" maxlength="12" size="15" required >
<small id= "pw_text_check" style="color: blue; display: inline;">비밀번호와 동일하게 입력해주세요.</small><br>
이름<input type="text" name="name" ><br>
주민번호<input  placeholder="0000000000000" type="text" id="jnum" name="jnum" maxlength="13">
<small id= "jnum_text_check" style="color: blue; display: inline;">주민등록번호 13자리를 입력해주세요.</small><br>
나이<input type="text" name="age" ><br>
사는곳<input type="text" name="area" ><br>
	<input type="submit" value="가입하기">
	</form>
</body>
<script type="text/javascript">
window.onload = function(){
	
	// 변수 선언 id값 넣기
	hchek_btn = document.getElementById('hcheck_btn');
	hlogin_pass = document.getElementById('hlogin_pass');
	hlogin_passcheck = document.getElementById('hlogin_passcheck');
	jnum_text_check = document.getElementById('jnum_text_check');
	jnum = document.getElementById('jnum');
	
	
		
	
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
	
	jnum.addEventListener('keyup', function(){
		jnum = document.getElementById('jnum').value;
        var juminRule=/[0-9]{13}$/

        if(jnum == '' || jnum == null){
			document.getElementById('jnum_text_check').style.color = 'blue';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 13자리를 입력해주세요.';
		}
        
        if(!juminRule.test(jnum)) { // 주민등록번호 양식이 일치 할때            
        	document.getElementById('jnum_text_check').style.color = 'red';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 양식이 일치하지 않습니다.';


        }else{// 주민등록번호 양식이 일치 할떄
			document.getElementById('jnum_text_check').style.color = 'blue';
			document.getElementById('jnum_text_check').innerText = '주민등록번호 양식이 일치합니다.';
		}
	})
	
}


function openIdChk(){//중복버튼을 누르면 실행될 함수
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
			}else{
				
				span.innerHTML="사용가능한 아이디입니다";
				span.style.color = 'blue';
			}
		}
	};
	xhr.open('post','${pageContext.request.contextPath}/idcheck?hlogin_id=' + document.getElementById("hlogin_id").value,true);
	xhr.send();
}







</script>

</html>