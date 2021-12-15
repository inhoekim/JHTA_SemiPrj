<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	function rollback(){
		location.href="${cp }/je/AdminService/AdminLogin.jsp";
	}
    function BoardMain(){
    	location.href="${cp}/hj/login_hj.jsp";//홈페이지 메인창으로 넘어가기
	}
    function Logout(){
    	location.href="${cp}/je/AdminService/AdminLogout.jsp";
    }
    function AdminService(){
    	location.href="${cp}/service/admin/list";
    }
    
</script>
</head>
<body>
	<c:choose>
		<c:when test="${requestScope.result=='success' }">
           <p>관리자님 환영합니다!</p>
           <input type="button" value="메인" onclick="BoardMain()">
           <input type="button" value="로그아웃" onclick="Logout()">
           <input type="button" value="문의게시판" onclick="AdminService()">
            </c:when>
		<c:otherwise>
           <p>아이디 또는 비밀번호가 일치하지 않습니다.</p>
           <input type="button" value="재로그인하기" onclick="rollback()">
           <input type="button" value="메인" onclick="BoardMain()">
              </c:otherwise>
	</c:choose>
</body>
</html>