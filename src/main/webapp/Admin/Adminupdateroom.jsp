<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>객실 수정</h1>
<form method="post" action="<%=request.getContextPath() %>/updateroom" enctype="multipart/form-data">
	객실번호<br>
	<input type="text" name="room_id" value="${vo.room_id }" readonly="readonly"><br>
	객실등급<br>
	<input type="text" name="kind" value="${vo.kind }"><br>
	객실인원<br>
	<input type="text" name="capacity" value="${vo.capacity }"><br>
	객실평점<br>
	<input type="text" name="rate" value="${vo.rate }"><br>
	객실비용<br>
	<input type="text" name="price" value="${vo.price }"><br>
	객실사진첨부 <input type="file" name="src_name"><br>
	기존파일 ${vo.getsrc_name }<br>
	<input type="submit" value="등록">
</form>
</body>
</html>