<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="cp" value="${pageContext.request.contextPath }" />
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
<script type="text/javascript">
	function rollbackList() {
		location.href="${cp }/service/board/list";
	}
	function ReturnMain() {
		location.href = "${cp}/je/Service/Boardmain.jsp";
	}
</script>
</head>
<body>
		<p>비밀번호가 일치하지 않습니다.</p><br>
		<input type="button" value="목록보기" onclick="rollbackList()">
		<input type="button" value="메인페이지로" onclick="ReturnMain()">
</body>
</html>