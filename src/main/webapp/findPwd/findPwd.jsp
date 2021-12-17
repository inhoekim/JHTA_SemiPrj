<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#changepwdform {
		width:600px; height:220px; border:solid 2px #ff6666;
	}
</style>
</head>
<body>
<div id="changepwdform" align="center">
<h1>비밀번호 변경</h1>
<p>비밀번호 재설정을 위해 아이디와 주민번호를 올바르게 입력해 주세요.</p>
<form method="get" action="/semiPrj/changepwd">
아이디 <input type="text" name="hlogin_id"><br>
주민번호 <input type="text" name="jnum"><br>
<input type="submit" value="확인" style="margin:4px">
</form>
</div>
</body>
</html>