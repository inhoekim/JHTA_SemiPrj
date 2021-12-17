<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	#loginform{
		width:400px; height:300px; border:solid 2px #ff6666; 
	}
/*	#loginbtn{
		width:50px; height:20px; border:solid 2px #ff6666; background-color: #ff6666; text-align:center;
		color:white; margin:4px
	} */
	
</style>
</head>
<body>
<div id="loginform" align="center">
	<h1>로그인</h1>
	<form method="post" action="<%=request.getContextPath() %>/login">
		아이디 <input type="text" name="hlogin_id"><br>
		비밀번호 <input type="password" name="pwd"><br>
		<div style="color:red">${requestScope.errMsg }</div>
		<input type="submit" value="로그인" id="loginbtn"><br>
		로그인 유지 <input type="checkbox" name="chk" checked="checked"><br>
		
		<p><a href="${pageContext.request.contextPath }/je/Hlogin/findidje.jsp">아이디 찾기</a> | <a href="${pageContext.request.contextPath }/findPwd/findPwd.jsp">비밀번호 찾기</a></p>
		<p>아직 회원이 아니신가요? <a href="${pageContext.request.contextPath }/sh/Gaipsh.jsp">회원가입</a></p>

	</form>
</div>
</body>
</html>