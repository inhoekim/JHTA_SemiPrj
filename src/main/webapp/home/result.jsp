<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<style>
	div#resultform{
		width:600px; height:200px; border:solid 2px #ff6666; border-radius:4px; 
		text-align: center; margin: auto; margin-top:40px;
	}
</style>
</head>
<body>
<div id="resultform">
<c:choose>
	<c:when test="${requestScope.result=='success' }">
		<h1>비밀번호 변경이 완료 되었습니다!</h1><br>
	</c:when>
	<c:otherwise>
		<h1>요청작업 실패!</h1>
	</c:otherwise>
</c:choose>
<a href="${cp}/home/login.jsp">로그인 페이지로</a>
</div>
</body>
</html>