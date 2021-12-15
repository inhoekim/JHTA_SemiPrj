<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>HTML Layouts</title>
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<jsp:include page="/search/header.html"/>
	<jsp:include page="/search/searchBar.jsp"/>
	<div style="height:100%;">
		<jsp:include page="/search/nav.jsp"/>
		<jsp:include page="${requestScope.section}"/>
		<jsp:include page="${requestScope.section}"/>
	</div>

	<jsp:include page="/search/footer.html"/>
</body>

<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript">
	printCalendar("${param.checkInForm}");
</script>

</html>