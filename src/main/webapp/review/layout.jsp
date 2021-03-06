<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리우리호텔</title>
<link href="${cp}/css/home.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
</head>

<body>
	<jsp:include page="${requestScope.header}"/>
	<div style="min-height: 600px; width: 100%;">
		<jsp:include page="${requestScope.main }"/>
	</div>
	<jsp:include page="${requestScope.footer}"/>
</body>
<script src="${cp}/js/calendar2.js"></script>
<script type="text/javascript">
	var xhr = null;
	var idChk = '<c:out value="${sessionScope.hlogin_id}"/>';
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
						
						comment_div.innerHTML = "<div class='alarm_text_div'><span id='hlogin_id_span'>" + hlogin_id + "</span><br>"
											  + "<span id='content_span'>" + content + "</span></div>";
						alarm_wrap.appendChild(comment_div);
						alarm_btn_div.innerHTML = "<div class='alarm_btn_div'><input type='button' id='alarm_chk' class='alarm_btn' value='확인' onclick='alarmCheck(" + comment_id + ', ' + review_id + ")'>"
											    + "<input type='button' id='alarm_del' class='alarm_btn' value='삭제' onclick='alarmDelete(" + comment_id + ")'></div>";
						alarm_wrap.appendChild(alarm_btn_div);
					}
				}
				
				alarm_cnt.innerText = alarmCount;
			}
		};
		xhr.open('get', url, false);
		xhr.send();
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
	
	function alarmCheck(comment_id, review_id) {
		location.href = "${cp}/alarm/check?review_id=" + review_id + "&comment_id=" + comment_id;
	}
	
	function divHiddin() {
		let div = document.getElementById("alarm_hidden_div");
		
		if (div.style.display == "none") {
			alarm_hidden_div.style.display = "block";
		} else {
			alarm_hidden_div.style.display = "none";
		}
		
	}
	
	function prev(year,month,flag){
		if(new Date(year,month-1,1) >= new Date()){
		reset();
		setCalendar(3,year,month-1);
		highlighting();
		offDate(JSON.parse('${reserve}'));
		}
	}
	
	function next(year,month,flag){
		let dt = new Date();
		dt.setDate(dt.getDate()+300);
		if(new Date(year,month-1,1) <= dt) {
			reset();
			setCalendar(3,year,month+1);
			highlighting();
			offDate(JSON.parse('${reserve}'));
		}
	}
	
	function canSearch(){
		let checkInForm = document.getElementById("checkInForm").value;
		let checkOutForm = document.getElementById("checkOutForm").value;
		if(checkInForm == "" || checkOutForm == "" || peopleNum == "") {
			window.alert("체크인-체크아웃 날짜를 올바르게 입력해주세요");
			return false;
		}
		return true;
	}
	
	window.onload=function(){
		// 로그인 안 하면 알람 기능x
		if (idChk != 'guest' && idChk != '') {
			alarmList();
		}
		let calendarBox = document.getElementById("calendarBox")
		if(calendarBox != null) {
			printCalendar();
			offDate(JSON.parse('${reserve}'));
		}
		if (typeof commentsList != 'undefined') {
			commentsList();
		}
		
		if (typeof reviewList != 'undefined') {
			reviewList();
		}
		
	}
</script>
