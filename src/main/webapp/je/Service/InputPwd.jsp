<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
			* { text-align: center; margin:5px}
	</style>
<script type="text/javascript">
	function rollback() {
		location.href = "${pageContext.request.contextPath }/service/board/list";
	}
</script>
</head>
<body>
	<%
	String service_id = request.getParameter("service_id");
	%>
	<div>
		비밀번호를 입력해 주세요.
		<form action="${pageContext.request.contextPath }/service/je/inputpwd" method="post">
			<input type="hidden" name="service_id" value="<%=service_id%>">
			<input type="password" id="pwd" name="pwd"><br> 
			<input type="submit" value="확인"> <input type="button" value="닫기" onclick="rollback()">
		</form>
	</div>
</body>
</html>




