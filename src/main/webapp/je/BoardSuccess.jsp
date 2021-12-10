<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ShowMain(){
	location.href="${pageContext.request.contextPath }/je/Boardmain.jsp";
}
function ShowList(){
	location.href="${pageContext.request.contextPath }/board/list";
}

</script>
</head>
<body>
등록이 완료되었습니다
<input type="button" value="메인페이지" onclick="ShowMain()">
<input type="button" value="목록으로" onclick="ShowList()">
</body>
</html>