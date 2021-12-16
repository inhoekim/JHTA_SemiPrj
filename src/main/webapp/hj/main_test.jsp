<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>hj/main_test.jsp</title>
<style>
	.alarm_count_div {
		background-color: #B40404;
		width: 25px;
		height: 20px;
		border-radius: 1em;
		text-align: center;
		cursor: pointer;
	}
	
	.alarm_hidden_div {
		width: 175px;
		height: auto;
		border: skyblue solid 1px;
	}
	
	.alarm_wrap {
		padding: 10 10 0 0;
	}
	
	#alarm_cnt {
		color: #FFFFFF;
	}
	
	#hlogin_id_span {
		font-weight: bold;
	}
	
	.content_div {
		display: block;
		text-overflow: ellipsis; /* 숨겨지는 영역 끝에 ... 생성 */
		white-sapce: nowrap; /* 글자를 한줄로 모아준다 */
		overflow: hidden; /* 해당 너비 넘어가면 숨김 */
		max-width: 125px;
		height: 25px;
		background-color: pink;
	}
	
	.alarm_hidden_div {
		background-color: white;
		position: absolute;
		z-index: 2;
	}
	
	.menu_list {
		position: absolute;
		z-index: 1;
	}
	
</style>
</head>
<body>
<div>
<% String cp=request.getContextPath(); %>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<c:choose>
	<c:when test="${empty sessionScope.hlogin_id }">
		<a href="<%=cp %>/hj/login_hj.jsp">로그인</a> |
		<a href="<%=cp %>/sh/Gaipsh.jsp">회원가입</a><!-- 상훈수정 --> |
		<a href="<%=cp %>/je/AdminService/AdminLogin.jsp">관리자로그인</a>
	</c:when>
	<c:otherwise>
		<div class="header_wrap">
			<span>[${sessionScope.hlogin_id }님 반갑습니다.] </span>
			<img id="alarm_img" src="/semiPrj/images/bell_off.png" width="20px" height="20">
			<div class="alarm_count_div" onclick="divHiddin()">
				<span id="alarm_cnt">0</span>
			</div>
			<div class="alarm_hidden_div" id="alarm_hidden_div" style="display: none;">
				<div class="alarm_wrap" id="alarm_wrap">
				</div>
			</div>
		</div>
		<div class="menu_list">
			<a href="<%=cp %>/logout">로그아웃</a>
			<a href="<%=cp %>/service/board/list">문의게시판</a>
			<a href="<%=cp %>/je/Hlogin/Deleteidje.html">회원탈퇴하기</a>
			<a href="<%=cp %>/review/main.jsp">리뷰 메인</a>
			<a href="<%=cp %>/selecthloginid?hlogin_id=${sessionScope.hlogin_id}">내정보</a> <!-- 상훈 내정보보기 -->
		</div>
	</c:otherwise>
</c:choose>
</div>
</body>
<script>
	var xhr = null;
	
	function divHiddin() {
		let div = document.getElementById("alarm_hidden_div");
		
		if (div.style.display == "none") {
			alarm_hidden_div.style.display = "block";
		} else {
			alarm_hidden_div.style.display = "none";
		}
		
	}
	
	function alarmList() {
		xhr = new XMLHttpRequest();
		let url = '${cp}/alarm/list';
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let alarm_wrap = document.getElementById("alarm_wrap");
				let alarm_cnt = document.getElementById("alarm_cnt");
				
				let child = alarm_wrap.childNodes;
				
				for (let i = child.length - 1; i >= 0; i--) {
					let item = child.item(i);
					alarm_wrap.removeChild(item);
				}
				
				let alarmCount = 0;
				
				for (let i = 0; i < json.length; i++) {
					if (typeof json[i].comment_id != "undefined") {
						let comment_div = document.createElement("div");
						let hlogin_id_span = document.createElement("span");
						let content_span = document.createElement("span");
						
						let alarm_btn_div = document.createElement("div");
						let check_btn = document.createElement("button");
						let delete_btn = document.createElement("button");
						
						alarmCount = json[0].alarmCount;
						let comment_id = json[i].comment_id;
						let review_id = json[i].review_id;
						let hlogin_id = json[i].hlogin_id;
						let content = json[i].content;
						
						comment_div.innerHTML = "<span id='hlogin_id_span'>" + hlogin_id + "</span>"
											  + "<span id='content_span'>" + content + "</span>";
						alarm_wrap.appendChild(comment_div);
						alarm_btn_div.innerHTML = "<input type='button' value='확인' onclick='alarmCheck(" + comment_id + ', ' + review_id + ")'>"
											    + "<input type='button' value='삭제' onclick='alarmDelete(" + comment_id + ")'>"
						alarm_wrap.appendChild(alarm_btn_div);
					}
				}
				
				alarm_cnt.innerText = alarmCount;
			}
		};
		xhr.open('get', url, true);
		xhr.send();
	}
	
	function alarmCheck(comment_id, review_id) {
		location.href = "${cp}/alarm/check?review_id=" + review_id + "&comment_id=" + comment_id;
	}
	
	function alarmDelete(comment_id) {
		xhr = new XMLHttpRequest();
		let url = '${cp}/alarm/delete';
		let param = 'comment_id=' + comment_id;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				alarmList();
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	
	window.onload = function() {
		alarmList();
	}
	
</script>
</html> 