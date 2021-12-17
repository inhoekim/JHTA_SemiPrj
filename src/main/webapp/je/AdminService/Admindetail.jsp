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
			text-align: center;
			margin: 5px;
			font-family: do hyeon; 
			
		}
		
		table {
			margin: auto;
			border-radius: 4px;
			border:1px solid #ff6666;
			border-collapse: collapse;
			width:300px;
			height:200px;
		}
		
		td#content {
			text-align: left
		}
			   
		th{
			background-color: #ff6666;
			color:white; 
			font-size:20px;
		}
		td#a{
		 background-color: pink;
		 color :navy;
		
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
		location.href="${cp}/je/AdminService/BoardComment.jsp?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&title=${vo.title}&pwd=${vo.pwd}";	
	}
</script>
</head>
<body>
<h3>문의 게시판</h3>
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
			<td id="a">내용</td>
			<td colspan="3" style="white-space:pre;" id="content">${vo.content }</td>
		</tr>
	</table><br>
	
	   <input type="button" value="답글" onclick="Comment()">
	   <input type="button" value="삭제" onclick="Delete()">
	   <input type="button" value="목록" onclick="rollback()">

</body>
</html>