<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePwd.jsp</title>
<style>
	#changepwd1{
		width:500px; height:220px; border:solid 2px #ff6666; border-radius:4px; 
		text-align: center; margin: auto; margin-top:40px;
	}
</style>
</head>
<body>
<div id="changepwd1" align="center">
	<h1>비밀번호 변경</h1>
	변경할 비밀번호를 입력해 주세요.
	<form method="post" action="/semiPrj/changepwd">
		<input type="hidden" name="hlogin_id" value="${vo.hlogin_id }" style="width: 150pt; height:20pt; border-radius: 5px;"><br>
		<input placeholder="비밀번호" type="password" name="pwd" style="width: 150pt; height:20pt; border-radius: 5px;"><br>
		<input type="submit" value="확인" style="margin:8px; background-color: #ff6666; min-width: 70px; 
			border: none; border-radius: 4px; line-height: 30px; color: #ffffff;">
	</form>
</div>
</body>
</html>