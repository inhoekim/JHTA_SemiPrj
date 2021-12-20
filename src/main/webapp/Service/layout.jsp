<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리우리호텔</title>
<link href="${cp}/css/home.css" rel="stylesheet" type="text/css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>

    <jsp:include page="${requestScope.header}"/>
	<div style="height: 800px;">
	<jsp:include page="${requestScope.main}"/>
	</div>
	<jsp:include page="${requestScope.footer}"/>
</body>
</html> 