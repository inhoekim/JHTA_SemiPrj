<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	   *{
		font-family: do hyeon; 
		}
	div#result{
		    width:300px; 
		    height : 150px; 
			border-radius: 4px;
			border:2px solid #ff6666;
			padding:50px;
			font-size:20px;
			text-align:center;
			position:absolute;
			top:50%;
			left:50%; 
			transform:translate(-50%,-50%);			
	   }
	   #c{
		width:100px; 
		height:35px;
		color:#ff6666;
		background-color:white;
		border-radius:4px;
		border-color:#ff6666;
		font-size:15px;
		} 
		#d{      
		width:100px;
		height:35px;
		color:white;
		background-color:#ff6666;
		border-radius:4px;
		border-color:#ff6666;
		font-size:15px;
		}	
				
</style>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">

	function rollback(){
		location.href="${cp }/home";
	}
	
	function BoardMain(){
		location.href="${cp }/service/board/list";
	}
</script>
</head>
<body>
<div id="result">
<c:choose>
  <c:when test="${requestScope.result == 'success' }">
  <p></p>
    <span style="font-size:25px">문의 게시글이 삭제 되었습니다.</span><p> </p>
      <input type="button" value="메인페이지" onclick="rollback()" id="c">
      <input type="button" value="게시판" onclick="BoardMain()" id="d">
            </c:when>
		<c:otherwise>
	  <p></p>
     <span style="font-size:25px">문의 게시글의 삭제가 <br> 완료되지 못했습니다.</span><p> </p>
      <input type="button" value="메인페이지" onclick="rollback()" id="c">
      <input type="button" value="게시판" onclick="BoardMain()" id="d">
     </c:otherwise>
</c:choose>
</div>
</body>
</html>