<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hj/main_test.jsp</title>
</head>
<body>
<% String cp=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.hlogin_id }">
		<a href="<%=cp %>/hj/login_hj.jsp">로그인</a>
	</c:when>
	<c:otherwise>
		[${sessionScope.hlogin_id }님 반갑습니다.]<br>
		<a href="<%=cp %>/logout">로그아웃</a>
		<a href="<%=cp %>/service/board/list">문의게시판</a>
		<a href="<%=cp %>/je/Hlogin/Deleteidje.html">회원탈퇴하기</a>
		<a href="<%=cp %>/review/main.jsp">리뷰 메인</a>
	</c:otherwise>
</c:choose>
</body>
</html> 