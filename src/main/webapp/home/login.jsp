<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	*{font-family: do hyeon; } 
	div#loginform{
		width:400px; height:350px; border:solid 2px #ff6666; border-radius:4px; 
		text-align: center; margin: auto; margin-top:40px;
	}
</style>
</head>
<body>
<div id="loginform">
	<h1>로그인</h1>
	<form method="post" action="<%=request.getContextPath() %>/login">
		<input placeholder="아이디" type="text" name="hlogin_id" style="width: 150pt; height:20pt; border-radius: 5px;"><br>
		<input placeholder="비밀번호" type="password" name="pwd" style="width: 150pt; height:20pt; border-radius: 5px; margin:3px;"><br>
		<div style="color:red">${requestScope.errMsg }</div>
		<input type="submit" value="로그인" style="margin:6px; background-color: #ff6666; min-width: 70px; 
			border: none; border-radius: 4px; line-height: 30px; color: #ffffff; cursor: pointer;"><br>
		
		로그인 유지 <input type="checkbox" name="chk" checked="checked" style="margin:8px;"><br>

	<p><a href="${cp}/home?spage=/home/FindId.jsp">아이디 찾기</a> | <a href="${cp }/home?spage=/home/findPwd.jsp">비밀번호 찾기</a></p>
	<p>아직 회원이 아니신가요? <a href="${cp}/home?spage=/home/Gaipsh.jsp">회원가입</a></p> <!-- 상훈수정 -->
	</form>
</div>
</body>
</html>