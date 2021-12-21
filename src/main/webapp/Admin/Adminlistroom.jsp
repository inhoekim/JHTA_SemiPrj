<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실리스트</title>
</head>
<body>
<table border="1" width="800">
	<tr>
		<th>객실번호</th><th>객실등급</th><th>객실인원</th><th>객실비용</th><th>객실평점</th>
		<th>파일</th><th>삭제</th>
	</tr>
	<c:forEach var="vo" items="${requestScope.list }">
		<tr>
			<td>${vo.room_id }</td>
			<td>${vo.kind }</td>
			<td>${vo.capacity }</td>
			<td>${vo.price }</td>
			<td>${vo.rate }</td>
			<td>${vo.src_name }</td>
			<td><a href="<%=request.getContextPath() %>/deleteroom?room_id=${vo.room_id }">삭제</a></td>
		</tr>
	</c:forEach>
</table>
<a href="<%=request.getContextPath() %>/Admin/Adminaddroom.jsp">객실 추가하기</a>
</body>
</html>