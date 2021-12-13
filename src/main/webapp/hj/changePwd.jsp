<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePwd.jsp</title>
</head>
<body>
<p>변경할 비밀번호를 입력해 주세요.</p>
<form method="get" action="/semiPrj/changepwd">
비밀번호 <input type="password" name="pwd" value="${vo.pwd }"><br>
<input type="submit" value="확인">
</form>
</body>
</html>