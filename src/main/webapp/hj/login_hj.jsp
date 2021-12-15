<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

</head>
<body>
<h1>로그인</h1>
<form method="post" action="<%=request.getContextPath() %>/login">
	아이디<input type="text" name="hlogin_id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div>${requestScope.errMsg }</div>
	
	로그인 유지 <input type="checkbox" name="chk" checked="checked"><br>
	
	<input type="submit" value="로그인">
<p><a href="${pageContext.request.contextPath }/je/Hlogin/findidje.jsp">아이디 찾기</a> | <a href="${pageContext.request.contextPath }/hj/findPwd.jsp">비밀번호 찾기</a></p>
<p>아직 회원이 아니신가요? <a href="${pageContext.request.contextPath }/sh/Gaipsh.jsp">회원가입</a></p>
<p><a href="${pageContext.request.contextPath }/je/AdminService/AdminLogin.jsp" style="color:gray">관리자 로그인</a></p>
</form>
</body>
</html>