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
<form method="post" action="/semiPrj/changepwd">
<input type="hidden" name="hlogin_id" value="${vo.hlogin_id }"><br>
비밀번호 <input type="password" name="pwd"><br>
<input type="submit" value="확인">
</form>
</body>
</html>