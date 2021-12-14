<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("replaceChar", "\\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cp" value="${pageContext.request.contextPath }" />
<title>Insert title here</title>

   <style type="text/css">
			* { text-align: center; margin:5px}
			table{margin: auto}
			td#content{text-align:left}
			td#title{text-align:left}
	</style>
<script type="text/javascript">
	function rollback() {
		location.href="${cp }/service/board/list";
	}
	function Re() {
		location.href = "${cp}/service/board/insert?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}";
	}
	function ReturnMain() {
		location.href = "${cp}/je/Service/Boardmain.jsp";
	}
	function Update(){
		location.href= "${cp}/service/board/select?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&writer=${vo.writer}&title=${vo.title}&content=${vo.content}&pwd=${vo.pwd}&created_day=${vo.created_day}";
	}
	function Delete1(){
		location.href= "${cp}/service/board/delete?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}";
	}
	function Comment(){
		location.href="${cp}/je/Service/BoardComment.jsp?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&title=${vo.title}&pwd=${vo.pwd}";
	}

</script>
</head>
<body>

<c:choose>
<c:when test="${!empty vo.title}">
<h3>문의 게시판</h3>
	<table border="1" >
		<tr>
			<td>글번호</td>
			<td>${vo.service_id }</td>
			<td>작성날짜</td>
			<td>${vo.created_day }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.writer }</td>
			<td>수정날짜</td>
			<td>${vo.updated_day }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3" id="title">${vo.title }</td>
		</tr>
		<tr> 
			<td>내용</td>
			<td colspan="3" style="white-space:pre;" id="content">${vo.content}</td>
		</tr>
	</table>
	   <input type="button" value="답글" onclick="Comment()">
	   <input type="button" value="수정" onclick="Update()">
	   <input type="button" value="삭제" onclick="Delete1()">
	   <input type="button" value="목록" onclick="rollback()">
	    </c:when>
	<c:otherwise>
		<p>비밀번호가 일치하지 않습니다.</p><br>
		<input type="button" value="목록보기" onclick="RollbackList()">
		<input type="button" value="메인페이지로" onclick="ReturnMain()">
	</c:otherwise>
</c:choose>
</body>
</html>