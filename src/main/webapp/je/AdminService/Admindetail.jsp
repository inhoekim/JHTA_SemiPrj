<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function rollback() {
		location.href="${cp }/service/admin/list";
	}
	function Delete(){
		location.href= "${cp}/service/board/delete?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}";
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
			<td>글번호</td>
			<td>${vo.service_id }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${vo.created_day }</td>
		</tr>
		<tr>
			<td>수정날짜</td>
			<td>${vo.updated_day }</td>
			
		</tr>
	</table><p></p>
	
	   <input type="button" value="답글" onclick="Comment()">
	   <input type="button" value="삭제" onclick="Delete()">
	   <input type="button" value="목록" onclick="rollback()">

</body>
</html>