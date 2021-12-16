<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리우리호텔</title>
	<link href="${cp}/css/home.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<jsp:include page="${requestScope.header}"/>
	<jsp:include page="${requestScope.main}"/>
	<jsp:include page="${requestScope.footer}"/>
</body>

<script src="${cp}/js/dateCalc.js"></script>

<script type="text/javascript">
window.onload = function() {

	document.getElementById("days").innerText = getday("${param.checkIn}", "${param.checkOut}") + "박";
	document.getElementById("pay").innerText = "결제금액: " + getTotalPrice("${param.checkIn}", "${param.checkOut}", ${room.price}) + "원";
}

</script>
</html>