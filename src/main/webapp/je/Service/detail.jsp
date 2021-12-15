<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cp" value="${pageContext.request.contextPath }" />
<title>Insert title here</title>

   <style type="text/css">
   
			* { text-align: center; margin:5px;}
			table{margin: auto}
			td#content{text-align:left;}
			td#title{text-align:left}
			
	</style>
	<script type="text/javascript">
	function rollback() {
		location.href="${cp }/service/board/list";
	}
	</script>
<%

	pageContext.setAttribute("replaceChar", "\n");

%>
</head>
<body> 

<h3>문의 게시판</h3>
<form method="post">
	<input type="hidden" name="ref" id="ref">
	<input type="hidden" name="lev" id="lev">
	<input type="hidden" name="step" id="step">
	<input type="hidden" name="pwd" id="pwd">
	<table border="1" heigth=100>
		<tr>
			<td>글번호</td>
			<td><input type="text" value="${vo.service_id }" name="service_id" readonly="readonly"></td>
			<td>작성날짜</td>
			<td><input type="text" value="${vo.created_day }" name="created_day" readonly="readonly"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" value="${vo.writer }" name="writer" readonly="readonly"></td>
			<td>수정날짜</td>
			<td><input type="text" value="${vo.updated_day }" name="updated_day"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3" id="title"><input type="text" value="${vo.title }" name="title" style="width:95%;text-align:left" readonly="readonly"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" id="content"><textarea rows="5" cols="50" name="content" style="white-space:;width:95%;text-align:left" readonly="readonly">${vo.content }</textarea></td>
		</tr>
	</table>
	   <input type="submit" value="답글" formaction="${cp}/je/Service/BoardComment.jsp?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&title=${vo.title}&pwd=${vo.pwd}">
	   <input type="submit" value="수정" formaction="${cp}/service/board/select?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&writer=${vo.writer}&title=${vo.title}&content=${vo.content}&pwd=${vo.pwd}">
	   <input type="submit" value="삭제" formaction="${cp}/service/board/delete?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}">
	   <input type="submit" value="목록" formaction="${cp }/service/board/list">
	
</form>
	 
</body>
</html>