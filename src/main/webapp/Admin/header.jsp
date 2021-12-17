<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp=request.getContextPath(); %>
<header>
<h2 style= "line-height:50px; display: inline; position: absolute; left:15%; color: #ff6666;">Uri Uri Hotel</h2>
 
<div id="memberTab" style="float : right; position: absolute; right:15%;">
	<c:choose>
		<c:when test="${empty sessionScope.admin_id }">
			<a href="${cp}/admin?apage=/Admin/AdminLogin.html">관리자로그인</a>
		</c:when>
		
		<c:otherwise>
			<span>[${sessionScope.admin_id}님 반갑습니다]</span>
			<a href="${cp}/admin?apage=/service/board/list">문의게시판</a> 
			<a href="${cp}"">회원관리하기</a>
			<a href="${cp}/admin?apage=/review/main.jsp">리뷰메인</a>
			<a href="${cp}/admin?apage=/logout">로그아웃</a>
	
		</c:otherwise>
	</c:choose>
</div>
</header>