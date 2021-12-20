<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	*{font-family: do hyeon; } 
	div#adminlogin {
		width:300px;
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
<script type="text/javascript">
	function rollback(){
		location.href="${cp }/home";//홈페이지 메인 화면으로 이동
	}
</script> 
</head>
<body>
<div id="adminlogin">
	<form action="${cp }/admin" method="post">
		<p style="align-content:center; font-size:30px; ">관리자 로그인</p>
		아이디 <input type="text" name="id" id="id"><br>
		비밀번호 <input type="password" name="pwd" id="pwd"><br><br> 
		<input type="submit" value="로그인" style="width:80px;height:25px;color:#ff6666;background-color:white;border-radius:4px;border-color:#ff6666">
		<input type="button" value="취소" onclick="rollback()" style="width:80px;height:25px;color:white;background-color:#ff6666;border-radius:4px;border-color:#ff6666"> 
	</form> 
 </div>
</body>
</html>