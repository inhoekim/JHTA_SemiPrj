<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리우리호텔</title>
	<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		*{margin:0; padding: 0;}
	</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="${requestScope.header}"/>
		</div>
		<div id="searchBar">
			<jsp:include page="${requestScope.searchBar}"/>
		</div>
		<div id="content">
			<jsp:include page="${requestScope.main}"/>
		</div>
		<div id="footer">
			<jsp:include page="${requestScope.footer}"/>
		</div>
	</div>
</body>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript">
	printCalendar();
	function openCalendar(){
		let calendarBox = document.getElementById("calendarBox");
		let peopleBox = document.getElementById("peopleBox");
		if(calendarBox.style.visibility == "" || calendarBox.style.visibility == "hidden") {
			calendarBox.style.visibility = "visible";
			peopleBox.style.visibility = "hidden";
		}
		else calendarBox.style.visibility = "hidden";
	}
	
	function openPeopleBox(){
		let calendarBox = document.getElementById("calendarBox");
		let peopleBox = document.getElementById("peopleBox");
		if(peopleBox.style.visibility == "" || peopleBox.style.visibility == "hidden") {
			calendarBox.style.visibility = "hidden";
			peopleBox.style.visibility = "visible";
		}
		else peopleBox.style.visibility = "hidden";
	}
	
	function plusPN(){
		let num = Number(document.getElementById("pn").innerText);
		document.getElementById("pn").innerText = num + 1;
		document.getElementById("peopleNum").value = num + 1;
		document.getElementById("people").innerText = (num + 1) + "명";
	}
	
	function minusPN(){
		if(document.getElementById("pn").innerText > 0) {
			document.getElementById("pn").innerText -= 1;
			document.getElementById("peopleNum").value -= 1;
			document.getElementById("people").innerText = document.getElementById("peopleNum").value + "명";
		}
	}
</script>
</html>