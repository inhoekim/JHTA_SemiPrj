<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	div#changepwdform {
		width:600px; height:250px; border:solid 2px #ff6666; border-radius:4px; 
		text-align: center; margin: auto; margin-top:40px;
	}
</style>
</head>
<body>
<div id="changepwdform" align="center">
<h1>비밀번호 변경</h1>
<p>비밀번호 재설정을 위해 아이디와 주민번호를 올바르게 입력해 주세요.</p>
<form method="get" action="/semiPrj/changepwd">
	<input placeholder="아이디" type="text" name="hlogin_id" style="width: 150pt; height:20pt; border-radius: 5px;"><br>
	<input placeholder="주민번호" type="text" name="jnum" style="width: 150pt; height:20pt; border-radius: 5px; margin:3px;"><br>
<input type="submit" value="확인" style=" margin:6px; background-color: #ff6666; min-width: 70px; 
			border: none; border-radius: 4px; line-height: 30px; color: #ffffff;">
</form>
</div>
</body>
</html>