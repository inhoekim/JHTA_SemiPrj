<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>우리우리호텔</title>
<link href="${cp}/css/home.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>


<body>
	<jsp:include page="/home/header.jsp"/>
	<jsp:include page="/search/searchBar.jsp"/>
	<div style="height:100%;">
		<jsp:include page="/search/nav.jsp"/>
		<ul id="searchResult" style="list-style: none; float: left; margin-top:40px; width:50%; position: relative; left:11%;">
		</ul>

	</div>

	<jsp:include page="/home/footer.html"/>
</body>

<script src="${cp}/js/calendar.js"></script>
<script src="${cp}/js/dateCalc.js"></script>
<script type="text/javascript">
	var xhr = null;
	function search(){
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200) {
					let data = xhr.responseText;
					let json = JSON.parse(data);
					deleteChild();
					let searchResult = document.getElementById("searchResult");
					for(let i = 0; i < json.length; i++) {
						let li = document.createElement("li");
						let checkIn = document.getElementById("checkInForm").value;
						let checkOut = document.getElementById("checkOutForm").value;
						let peopleNum = document.getElementById("peopleNum").value;
						let link = "${cp}/reserve?room=" + json[i].room_id + "&checkIn=" + checkIn + 
						"&checkOut=" + checkOut + "&people=" + peopleNum;
						let htmlStr =  "<a href='" + link + "'><div style='width:100%;height:200px;'>";
						htmlStr += "<div style='width:25%; height:100%; overflow: hidden; float:left;'>";
						htmlStr += "<img src='${cp}/images/room/" + json[i].src + "'></div>";
						htmlStr += "<div style='display: flex; flex-direction: column; margin-left:20px;'>";
						htmlStr += "<p style='border:1px solid #474747; color: #474747; width:40px;'>객실 " + json[i].room_id + "</p>";
						htmlStr += "<p style='font-size:15px; color: #474747'>객실종류: 최대" + json[i].capacity + "인/" + json[i].kind + "</p>";
						htmlStr += "<p style='font-size:15px; color: #474747'>객실평점: " + json[i].rate + "</p>";
						htmlStr += "<p style='font-size:22px; text-align:right; margin-right:20px; margin-bottom:0px;'>" + getTotalPrice(checkIn,checkOut,json[i].price).toLocaleString('en') + " 원</p>";
						htmlStr += "<p style='font-size:13px; text-align:right; margin:0px; margin-right:20px; color: #D7D7D7'>세금 및 수수료 포함</p></div>";
						htmlStr += "</div></a>";
						li.innerHTML = htmlStr;
						searchResult.appendChild(li);
					}
				}
			};
		let calendarBox = document.getElementById("calendarBox");
		calendarBox.style.visibility="hidden";
		let peopleBox = document.getElementById("peopleBox");
		peopleBox.style.visibility="hidden";
		xhr.open("post","${cp}/search",true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		let checkIn = document.getElementById("checkInForm").value;
		let checkOut = document.getElementById("checkOutForm").value;
		let peopleNum = document.getElementById("peopleNum").value;
		let costMin = document.getElementById("costMin").value;
		let costMax = document.getElementById("costMax").value;
		let review = document.getElementById("review").value;
		let param = "checkInForm=" + checkIn + "&checkOutForm=" + checkOut + "&peopleNum=" + peopleNum 
		+ "&costMin=" + costMin + "&costMax=" + costMax + "&review=" + review;
		xhr.send(param);
	}
	
	function deleteChild(){
		let searchResult = document.getElementById("searchResult");
		let length = searchResult.childNodes.length;
		for(let i = length - 1; i >= 0; i--) searchResult.removeChild(searchResult.childNodes[i]);
		
	}
	
	function rangeBar(event,EID){
		let element = document.getElementById(EID);
		if(EID =="cmin") element.innerText = event.value + "원이상";
		if(EID == "cmax") element.innerText = event.value + "원이하";	
	}
	
	function reviewBar(event){
		let element = document.getElementById("reviewBar");
		element.innerText = event.value + "점이상";

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
	
	window.onload = function(){
		if(typeof(alarmList) == 'function') {
			alarmList();
		}
		printCalendar("${param.checkInForm}");
		let searchResult = document.getElementById("searchResult");
		let checkIn = document.getElementById("checkInForm").value;
		let checkOut = document.getElementById("checkOutForm").value;
		let peopleNum = document.getElementById("peopleNum").value;
		let arr = ${requestScope.result};
		for(let i = 0; i < arr.length; i++) {
			let li = document.createElement("li");
			let link = "${cp}/reserve?room=" + arr[i].room_id + "&checkIn=" + checkIn + 
			"&checkOut=" + checkOut + "&people=" + peopleNum;
			let htmlStr =  "<a href='" + link + "'><div style='width:100%;height:200px;'>";
			htmlStr += "<div style='width:25%; height:100%; overflow: hidden; float:left;'>";
			htmlStr += "<img src='${cp}/images/room/" + arr[i].src + "'></div>";
			htmlStr += "<div style='display: flex; flex-direction: column; margin-left:20px;'>";
			htmlStr += "<p style='border:1px solid #474747; color: #474747; width:40px;'>객실 " + arr[i].room_id + "</p>";
			htmlStr += "<p style='font-size:15px; color: #474747'>객실종류: 최대" + arr[i].capacity + "인/" + arr[i].kind + "</p>";
			htmlStr += "<p style='font-size:15px; color: #474747'>객실평점: " + arr[i].rate + "</p>";
			htmlStr += "<p style='font-size:22px; text-align:right; margin-right:20px; margin-bottom:0px;'>" + getTotalPrice(checkIn,checkOut,arr[i].price).toLocaleString('en') + " 원</p>";
			htmlStr += "<p style='font-size:13px; text-align:right; margin:0px; margin-right:20px; color: #D7D7D7'>세금 및 수수료 포함</p></div>";
			htmlStr += "</div></a>";
			li.innerHTML = htmlStr;
			searchResult.appendChild(li);
		}
	}	
</script>

</html>