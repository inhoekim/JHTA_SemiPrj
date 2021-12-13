<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function rollback(){
		location.href="";//관리자 메인페이지 만들기
	}

    function AdminBoardMain(){
    	location.href="${cp }/service/admin/list";
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.result=='success' }">
           <p>답글이 등록되었습니다.</p>
           <input type="button" value="메인페이지" onclick="rollback()">
           <input type="button" value="게시판" onclick="AdminBoardMain()">
            </c:when>
		<c:otherwise>
           <p>답글 등록에 실패하였습니다.</p>
           <input type="button" value="메인페이지" onclick="rollback()">
           <input type="button" value="게시판" onclick="AdminBoardMain()">
              </c:otherwise>
	</c:choose>
</body>
</html>