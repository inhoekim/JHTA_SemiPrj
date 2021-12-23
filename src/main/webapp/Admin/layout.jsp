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
</head>
<body>
	<jsp:include page="${requestScope.header}"/>
	<div style="min-height: 800px; width: 100%;"> 
	<jsp:include page="${requestScope.main }"/>
	</div>
	<jsp:include page="${requestScope.footer}"/>  
</body>

</html>