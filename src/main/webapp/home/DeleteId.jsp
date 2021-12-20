<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
	*{font-family: do hyeon;}	
    div#deletepwd { 
		font-size:20px;
		width:350px;
		height:200px;
		border: 2px solid #ff6666;	
		padding:50px;
		border-radius:4px;
	text-align:center;
		position:absolute;
		top:50%;
		left:50%; 
		transform:translate(-50%,-50%);
	}
	
</style>
</head>
<body>
<div id="deletepwd">
<form name="inform">
		비밀번호 : <input type="password" name="pwd" required="required" id="pwd"><br> 
		주민번호 : <input type="text" name="jnum" id="jnum" required="required" placeholder="1234567890000"><br>
		<p style="color:blue; font-size: 15px">*주민번호는 "-"를 제외한 13자리를 입력해 주세요.</p>	
		<div style="color:red; font-size:14px;">*탈퇴하시면 모든 정보가 사라집니다. 정말 탈퇴하시겠습니까?
		<input type="checkbox" id="check" name="check"></div><br>
		<input type="button" value="탈퇴하기" onclick="openDelete()" style="width:80px;height:35px;color:#ff6666;background-color:white;border-radius:4px;border-color:#ff6666"> 
		<input type="button" value="취소" onclick="rollback()" style="width:80px;height:35px;background-color:#ff6666;border-color:#ff6666;border-radius:4px;" ><br>
		<div id="result"></div>
	</form> 
</div>
	<script type="text/javascript">
		function rollback() {
			location.href = "../../hj/login_hj.jsp"
		}
		function openDelete(){
			let check=document.getElementById("check");
			if(check.checked==false){
				alert("체크박스를 확인해주세요");
				return;
			}else{
			
			let xhr=new XMLHttpRequest();
			let pwd=document.getElementById("pwd").value;
			let jnum=document.getElementById("jnum").value;
			xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){

				let data=xhr.responseText;
				let json=JSON.parse(data);
				let div=document.getElementById("result");
				let find=json.find;
				if(find==true){
					div.innerHTML="<br>" + "회원 탈퇴가 완료되었습니다." + "<br>" +
					               "<a href='../../hj/login_hj.jsp'>" + "메인페이지로 이동" + "</a>";
					
				}else{
					div.innerHTML="정보가 일치하지 않습니다.";  
				}
				
			}	
		};
		xhr.open('get','/semiPrj/hlogin/update/num?pwd=' + pwd + '&jnum=' + jnum,true);
		xhr.send();
		}
		}
	</script>
</body>
</html>