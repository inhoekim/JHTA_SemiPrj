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
		<div id="searchResult">
		</div>
	</div>

	<jsp:include page="/home/footer.html"/>
</body>

<script src="${cp}/js/calendar.js"></script>
<script src="${cp}/js/dateCalc.js"></script>
<script type="text/javascript">
	printCalendar("${param.checkInForm}");
	
	function search(){
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200) {
					let data = xhr.responseText;
					let json = JSON.parse(data);
					deleteChild();
					let searchResult = document.getElementById("searchResult");
					for(let i = 0; i < json.length; i++) {
						let newSection = document.createElement("section");
						let checkIn = document.getElementById("checkInForm").value;
						let checkOut = document.getElementById("checkOutForm").value;
						let peopleNum = document.getElementById("peopleNum").value;
						newSection.innerHTML = "<p>객실번호: " + json[i].room_id + "</p>";
						newSection.innerHTML += "<p>객실이미지: " + json[i].src + "</p>";
						newSection.innerHTML += "<p>객실평점 :" + json[i].rate + "</p>";
						newSection.innerHTML += "<p>예상가격 :" + getTotalPrice(checkIn,checkOut,json[i].price) + "원</p>";
						let link = "${cp}/reserve?room=" + json[i].room_id + "&checkIn=" + checkIn + 
								"&checkOut=" + checkOut + "&people=" + peopleNum;
						newSection.innerHTML += "<a href='" + link + "'>예약하기</a>";
						searchResult.appendChild(newSection);
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
	
	window.onload = function(){
		let searchResult = document.getElementById("searchResult");
		let checkIn = document.getElementById("checkInForm").value;
		let checkOut = document.getElementById("checkOutForm").value;
		let peopleNum = document.getElementById("peopleNum").value;
		let arr = ${requestScope.result};
		for(let i = 0; i < arr.length; i++) {
			let newSection = document.createElement("section");
			newSection.innerHTML = "<p>객실번호: " + arr[i].room_id + "</p>";
			newSection.innerHTML += "<p>객실이미지: " + arr[i].src + "</p>";
			newSection.innerHTML += "<p>객실평점 :" + arr[i].rate + "</p>";
			newSection.innerHTML += "<p>예상가격 :" + getTotalPrice(checkIn,checkOut,arr[i].price) + "원</p>";
			let link = "${cp}/reserve?room=" + arr[i].room_id + "&checkIn=" + checkIn + 
			"&checkOut=" + checkOut + "&people=" + peopleNum;
			newSection.innerHTML += "<a href='" + link + "'>예약하기</a>";
			searchResult.appendChild(newSection);
		}
	}	
</script>

</html>