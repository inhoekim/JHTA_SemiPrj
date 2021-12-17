<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
<a href="${cp}/home">
	<h2 style="line-height:50px; display: inline; position: absolute; left:15%; color: #ff6666;">
		Uri Uri Hotel
	</h2>
</a>
<div id="memberTab" style="float : right; position: absolute; right:15%;">
	<c:choose>
		<c:when test="${empty sessionScope.hlogin_id }">
			<a href="${cp}/home?spage=/je/AdminService/AdminLogin.jsp">관리자로그인</a>
			<a href="${cp}/home?spage=/sh/Gaipsh.jsp" style="border: 1px solid #ff6666; min-width: 82px; border-radius: 4px;
			 line-height: 40px; color: #ff6666;">회원가입</a>
			<a href="${cp}/home?spage=/hj/login_hj.jsp" style="background-color: #ff6666; min-width: 82px; 
			border-radius: 4px; line-height: 40px; color: #ffffff;">로그인</a>
		</c:when>
		
		<c:otherwise>
			<div class="header_wrap" style="display: inline-block;">
				<span>[${sessionScope.hlogin_id}님 반갑습니다]</span>
				<img id="alarm_img" src="${cp}/images/bell_off.png" width="24px" height="24px">
				<div class="alarm_count_div" onclick="divHiddin()">
					<span id="alarm_cnt">0</span>
				</div>
				<div class="alarm_hidden_div" id="alarm_hidden_div" style="display: none;">
					<div class="alarm_wrap" id="alarm_wrap"></div>
				</div>
			</div>
			<a href="${cp}/home?spage=/selecthloginid?hlogin_id=${sessionScope.hlogin_id}">내정보</a> <!-- 상훈 내정보보기 -->
			<a href="${cp}/home?spage=/service/board/list">문의게시판</a>
			<a href="${cp}/home?spage=/deleteid">회원탈퇴하기</a>
			<a href="${cp}/review/main.jsp">리뷰메인</a>
			<a href="${cp}/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
</div>
</header>