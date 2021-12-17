<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getCookie.jsp</title>
</head>
<body>
<%
	Cookie[] cookies=request.getCookies();

	if(cookies!=null){
		for(Cookie ck:cookies){
			String ckName=ck.getName();
			String ckValue=ck.getValue();
			out.print("<h2>쿠키이름: " + ckName + ", 쿠키값: " + ckValue + "</h2>");	
		}
	}else{
		out.print("<h2>쿠키가 존재하지 않습니다.</h2>");
	}
%>
</body>
</html>