<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>우리우리호텔</title>
	<link href="${pageContext.request.contextPath}/home/css/home.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<jsp:include page="${requestScope.header}"/>
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
</script>
</html>