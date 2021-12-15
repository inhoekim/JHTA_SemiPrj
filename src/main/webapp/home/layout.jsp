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
	<jsp:include page="${requestScope.header}"/>
	<jsp:include page="${requestScope.searchBar}"/>
	<jsp:include page="${requestScope.main}"/>
	<jsp:include page="${requestScope.footer}"/>
</body>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript">
	printCalendar();
</script>
</html>