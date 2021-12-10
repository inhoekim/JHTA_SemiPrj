<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%
	Cookie[] cooks=request.getCookies();
	String id="";
	String pwd="";
	boolean checked=false;
	if(cooks!=null){
		for(Cookie c:cooks){
			String name=c.getName();
			if(name.equals("id")){
				id=c.getValue();
				checked=true;
			}else if(name.equals("pwd")){
				pwd=c.getValue();
			}
		}
	}
%>
</head>
<body>
<h1>로그인</h1>
<form method="post" action="/login">
	아이디<input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div>${requestScope.errMsg }</div>
	<% if(checked==true){ %>
	로그인 유지 <input type="checkbox" name="chk" checked="checked"><br>
	<%}else{ %>
	로그인 유지 <input type="checkbox" name="chk">
	<%} %>
	<input type="submit" value="로그인">
<p><a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a></p>
<p>아직 회원이 아니신가요? <a href="">회원가입</a></p>
</form>
</body>
</html>