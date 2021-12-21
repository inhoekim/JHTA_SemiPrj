<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 등록</title>
</head>
<body>
<!-- 첨부파일은 용량문제로 post로 등록 
	enctype="multipart/form-data" <-속성 설정
-->
<h1>숙소 등록</h1>
<form method="post" action="<%=request.getContextPath() %>/addroom" enctype="multipart/form-data">
	객실번호<br>
	<input type="text" name="room_id" readonly="readonly"><br>
	객실등급<br>
	<input type="text" name="kind"><br>
	객실인원<br>
	<input type="text" name="capacity"><br>
	객실평점<br>
	<input type="text" name="rate"><br>
	객실비용<br>
	<input type="text" name="price"><br>
	객실사진첨부 <input type="file" name="src_name"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>