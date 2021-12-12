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
		location.href="${cp }/je/Service/Boardmain.jsp";
	}

    function BoardMain(){
    	location.href="${cp }/board/list";
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.result=='success' }">
           <p>게시판 글이 등록되었습니다.</p>
           <input type="button" value="메인페이지" onclick="rollback()">
           <input type="button" value="게시판" onclick="BoardMain()">
            </c:when>
		<c:otherwise>
           <p>게시판 등록이 실패하였습니다.</p>
           <input type="button" value="메인페이지" onclick="rollback()">
           <input type="button" value="게시판" onclick="BoardMain()">
              </c:otherwise>
	</c:choose>
</body>
</html>