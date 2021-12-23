<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	*{
	  font-family: do hyeon;   
	  }
			
	div#inputpwd {
	    padding:5px;
		width:300px;
		height:200px;
		border: 2px solid #ff6666;	
		padding:50px;
		border-radius:4px;
	    text-align:center;
		position:absolute;
		top:50%;
		left:50%; 
		transform:translate(-50%,-50%);
	}
	p#a{
		font-size:25px; 
	}

	</style>
<script type="text/javascript">
	function rollback() {
		location.href = "${pageContext.request.contextPath }/service/board/list";
	}
</script>
</head>
<body>
	<%
	String service_id = request.getParameter("service_id");
	%>
	<div id="inputpwd">
		<p id="a">비밀번호를 입력해 주세요.</p>
		<form action="${pageContext.request.contextPath }/service/je/inputpwd" method="post">
			<input type="hidden" name="service_id" value="<%=service_id%>">
			<input type="password" id="pwd" name="pwd" style="text-align:center;"><br><br>
			<div style="color:red">${requestScope.errMsg }</div><br>
			<input type="submit" value="확인" style="width:80px;height:35px;color:#ff6666;background-color:white;border-radius:4px;border-color:#ff6666;font-size:15px;cursor: pointer;"> 
			<input type="button" value="닫기" onclick="rollback()" style="width:80px;height:35px;background-color:#ff6666;border-color:#ff6666;border-radius:4px;font-size:15px;cursor: pointer;" >
		</form>
	</div>
</body>
</html>