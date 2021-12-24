<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	* {
		font-family: do hyeon;
	}
	
	div#detail {
		text-align: center;
		margin: auto;
	}
	
	table {
		width: 500px;
		height: 300px;
		margin: auto;
		border-radius: 4px;
		border: 2px solid #ff6666;
		border-collapse: collapse;
		line-height: 1.5;
		text-align:left;font-size:18px;"
	}
	td#title {
		text-align: left
	}
	
	th {
		background-color: #ff6666;
		color: white;
		font-size: 20px;
	}
	
	input {
		font-size: 15px;
	}
	
	td#a {
		background-color: pink;
		width:60px;
		text-align:center;
	}
	
	#c {
		width: 90px;
		height: 25px;
		color: #ff6666;
		background-color: white;
		border-radius: 4px;
		border-color: #ff6666;
		font-size:18px; 
		cursor: pointer;
	}
	
	#d {
		width: 90px;
		height: 25px;
		color: white;
		background-color: #ff6666;
		border-radius: 4px;
		border-color: #ff6666;
		font-size:18px; 
		cursor: pointer;
	}
</style>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function rollback() {
		location.href="${cp }/service/admin/list";
	}
	function Delete(){
		location.href= "${cp}/admin/service/delete?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}";
	}
	function Comment(){
		location.href="${cp}/admin/comment?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&title=${vo.title}&pwd=${vo.pwd}";	
	}
</script>
</head>
<body>
<div id="detail">
<h3 style="font-size:35px">문의 게시판</h3>
	<table border="1" >
		<tr>
			<td id="a">글번호</td>
			<td>${vo.service_id }</td>
			<td id="a">작성날짜</td>
			<td>${vo.created_day }</td>
		</tr>
		<tr>
			<td id="a">작성자</td>
			<td>${vo.writer }</td>
			<td id="a">수정날짜</td>
			<td>${vo.updated_day }</td>
		</tr>
		<tr>
			<td id="a">제목</td>
			<td colspan="3" id="title">${vo.title }</td>
		</tr> 
		<tr>
			<td id="a" style="height:90%;">내용</td>   
			<td colspan="3" style="white-space:pre;height:90%;" id="content">${vo.content }</td>
		</tr>
	</table><br>
	
	   <input type="button" value="답글" onclick="Comment()" id="c">
	   <input type="button" value="삭제" onclick="Delete()" id="d">
	   <input type="button" value="목록" onclick="rollback()" id="c">
</div>
</body>
</html>