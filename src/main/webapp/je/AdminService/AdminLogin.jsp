<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rollback(){
		location.href="";//홈페이지 메인 화면으로 이동
	}
</script> 
</head>
<body>
	<form action="${pageContext.request.contextPath }/service/admin/login" method="post">
		<p>관리자 로그인 페이지입니다.</p>
		아이디 <input type="text" name="id" id="id"><br>
		비밀번호 <input type="password" name="pwd" id="pwd"><br><br> 
		<input type="submit" value="로그인하기">
		<input type="button" value="취소" onclick="rollback()"> 
	</form>
</body>
</html>