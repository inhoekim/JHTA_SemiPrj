<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#alarm_chk {
		border-radius: 5px;
		border: #58ACFA solid 1px; 
		color: white;
		background-color: #58ACFA;
		margin-right: 5px;
	}
	
	#alarm_del {
		border-radius: 5px;
		border: #F2F2F2 solid 1px; 
		color: black;
		background-color: #F2F2F2;
		margin-left: 5px;
	}
	
	#alarm_chk:hover {
		border: #2E9AFE solid 1px; 
		background-color: #2E9AFE;
	}
	
	#alarm_del:hover {
		border: #E6E6E6 solid 1px;
		background-color: #E6E6E6;
	}
	
	.alarm_text_div {
		margin-top: 5px;
	}
	
	.alarm_btn_div {
		margin-top: 5px;
		margin-bottom: 5px;
	}
</style>
<header>
<a href="${cp}/home">
	<h2 style="line-height:50px; display: inline; position: absolute; left:15%; color: #ff6666;">
		Uri Uri Hotel
	</h2>
</a>
<div id="memberTab" style="float : right; position: absolute; right:15%;">
	<c:choose>
		<c:when test="${empty sessionScope.hlogin_id }">
			<a href="${cp}/home?spage=/Admin/Adminlogin.jsp">관리자로그인</a>
			<a href="${cp}/home?spage=/sh/Gaipsh.jsp" style="border: 1px solid #ff6666; min-width: 82px; border-radius: 4px;
			 line-height: 40px; color: #ff6666;">회원가입</a>
			<a href="${cp}/home?spage=/home/login.jsp" style="background-color: #ff6666; min-width: 82px; 
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
			<a href="${cp}/service/board/list">문의게시판</a>
			<a href="${cp}/home?spage=/home/DeleteId.jsp">회원탈퇴하기</a>
			<a href="${cp}/review/main.jsp">리뷰메인</a>
			<a href="${cp}/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
</div>
</header>