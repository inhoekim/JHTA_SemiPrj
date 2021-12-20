<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="searchBar">	
	<form action="${cp}/search" method="post">
		<div class="checkbar" onclick="openCalendar()" style="width:600px; text-align: center; border-radius: 1em 0em 0em 1em; border: 1px solid black;">
			<img src="${cp}/images/calendar.png" style="width:40px;height:40px;vertical-align:middle;position:relative;left:3%;">
			<div style="width:25%; height:100%; display:inline-block; vertical-align: middle; ">
				<p style="display:inline-block;">
					<span style="font-size: 15px;color: #a5a3a3cc;">체크인</span><br>
					<span id="inDate">날짜추가</span>
				</p>
				<input id="checkInForm" name="checkInForm" type="hidden" value="">
			</div>

			<div style="width:25%; height:100%; display: inline-block; vertical-align: middle;">
				<p id="nights" style="display:inline-block; line-height: 45px; font-size: 20px;">0박</p>
			</div>
			
			<div style="width:20%; height:100%; display:inline-block; vertical-align: middle;">
				<p style="display:inline-block;">
					<span style="font-size: 15px;color: #a5a3a3cc;">체크아웃</span><br>
					<span id="outDate">날짜추가</span>
				</p>
				<input id="checkOutForm" name="checkOutForm" type="hidden" value="">
			</div>
		</div>
		
		<div class="checkbar" onclick="openPeopleBox()" 
		style="height:80px; vertical-align: middle; border: 1px solid black;
		margin-left:-6px;width:40px;height: 80px; border-left: 0;border-right: 0;">
			<p>인원</p>
			<p id="people">0명</p>
		</div>
		
		<div style="background-color : #ff6666; display: inline-block; height:82px; width:70px;
		vertical-align: middle; margin-left:-6px; border-radius: 0em 1em 1em 0em;">
			<input type="image" src="${cp}/images/search3.png" style="width:30px; height: 30px;margin-top:27px;">
		</div>
		
		<div id="calendarBox" class="calendarBox">
		</div>
		
		<div id="peopleBox" class="peopleBox">
			<p style="margin-top:10px;">인원</p>
			<input type="button" value="-" onclick="minusPN()" style="width:30px;">
			<p id="pn" style="display:inline-block;">0</p>
			<input id="peopleNum" name="peopleNum" type="hidden" value="0">
			<input type="button" value="+" onclick="plusPN()" style="width:30px;">
		</div>

	</form>
</div>

<script src="${cp}/js/calendar.js"></script>
<script type="text/javascript">
	var xhr = null;
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
	
	window.onload=function(){
		alarmList();
		printCalendar();
	}
</script>