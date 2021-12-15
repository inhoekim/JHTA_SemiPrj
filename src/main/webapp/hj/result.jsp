<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hj/result.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.result=='success' }">
		<h1>비밀번호 변경이 완료 되었습니다!</h1><br>
	</c:when>
	<c:otherwise>
		<h1>요청작업 실패!</h1>
	</c:otherwise>
</c:choose>
<a href="hj/login_hj.jsp">로그인 페이지로</a>
</body>
</html>