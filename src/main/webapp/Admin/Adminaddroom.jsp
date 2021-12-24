<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 등록</title>
<style>
	*{font-family: do hyeon; } 
	div#addroom1{
		width:400px; height:390px; border:solid 2px #ff6666; border-radius:4px; 
		text-align: center; margin: auto; margin-top:40px;
	}
</style>
</head>
<body>
<!-- 첨부파일은 용량문제로 post로 등록 
	enctype="multipart/form-data" <-속성 설정
-->
<div id="addroom1">
<h1>숙소 등록</h1>
<form method="post" action="${pageContext.request.contextPath }/addroom" enctype="multipart/form-data">

	<input placeholder="객실번호" type="hidden" name="room_id" readonly="readonly" style="width: 150pt; height:25pt; border-radius: 5px;"><br>

	<input placeholder="객실등급" type="text" name="kind" style="width: 150pt; height:25pt; border-radius: 5px;"><br>

	<input  placeholder="객실인원"type="text" name="capacity" style="width: 150pt; height:25pt; border-radius: 5px; margin:3px;"><br>
	
	<input placeholder="객실비용" type="text" name="price" style="width: 150pt; height:25pt; border-radius: 5px; margin:3px;"><br>

	<input placeholder="객실평점" type="text" name="rate" style="width: 150pt; height:25pt; border-radius: 5px; margin:3px;"><br>

	객실사진첨부 <input type="file" name="src_name"><br>
	<input type="submit" value="등록" style="margin:6px; background-color: #ff6666; width: 155pt; height: 25pt; 
			border: none; border-radius: 4px; color: #ffffff; cursor: pointer; margin:10px;">
</form>
</div>
</body>
</html>