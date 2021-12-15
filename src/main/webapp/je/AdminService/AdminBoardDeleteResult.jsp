<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath }" />
	<script type="text/javascript">
		function rollback() {
			location.href = "${cp}/je/AdminService/Adminmain.jsp";
		}
		function BoarMain() {
			location.href = "${cp}/service/admin/list";
		}
	</script>
	<c:choose>
		<c:when test="${requestScope.result== 'success' }">
			<p>게시물이 삭제 되었습니다.</p>
			<input type="button" value="메인페이지" onclick="rollback()">
			<input type="button" vlaue="게시판" onclick="BoardMain()">
		</c:when>
		<c:otherwise>
			<p>게시물이 삭제되지 못했습니다. 시스템을 점검해 주세요.</p>
			<input type="button" value="메인페이지" onclick="rollback()">
			<input type="button" value="게시판" onclick="BoardMain()">
		</c:otherwise>
	</c:choose>
</body>
</html>