<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ReturnMain(){
		location.href="${pageContext.request.contextPath }/hj/login_hj.jsp";//홈페이지 메인 페이지로 돌아가기
	}
    function ReturnLogin(){
        location.href="${pageContext.request.contextPath }/je/AdminService/AdminLogin.jsp";	
    }


</script>
</head>
<body>
    <%
		session.invalidate();
	%>
<p>로그아웃 되었습니다.</p>
<input type="button" value="메인페이지로" onclick="ReturnMain()">
<input type="button" value="재로그인하기" onclick="ReturnLogin()">

</body>
</html>