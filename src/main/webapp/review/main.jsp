<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>
			<a href="${pageContext.request.contextPath }/review/list">리뷰 목록</a>
			<a href="${pageContext.request.contextPath }/room/detail?room_id=1">객실 정보</a>
			<a href="${pageContext.request.contextPath }/review/write">리뷰쓰기</a>
		</li>
	</ul>
</body>
</html>