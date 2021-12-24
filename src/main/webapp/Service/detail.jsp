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
      *{
		font-family: do hyeon; 
		}
		div#detail{
			text-align: center;	
			margin: auto; 
			
		} 
		table {
		    width:500px;
		    height : 300px; 
			margin: auto;
			border-radius: 4px;
			border:2px solid #ff6666;
			border-collapse: collapse;
			line-height:1.5;
			font-size:20px;
			
		}
		td#title {
			text-align:left
		}
		th{
			background-color: #ff6666;
			color:white;
			font-size:20px;
		}
		input{
			font-size:15px;
		
		}
		td#a{
			background-color: pink;		
		}
		#c{
		width:60px;
		height:25px;
		color:#ff6666;
		background-color:white;
		border-radius:4px;
		border-color:#ff6666;
		cursor: pointer;
		}
		#d{
		width:60px;
		height:25px;
		color:white;
		background-color:#ff6666;
		border-radius:4px;
		border-color:#ff6666;
		cursor: pointer;
		}			
	</style>
	<script type="text/javascript">
	function rollback() {
		location.href="${cp }/service/board/list";
	}
	</script>
  </head> 
<body> 
<div id="detail">
<h3 style="font-size:35px">문의 게시판</h3>
<form method="post">
	<input type="hidden" name="ref" id="ref">
	<input type="hidden" name="lev" id="lev">
	<input type="hidden" name="step" id="step">
	<input type="hidden" name="pwd" id="pwd">
	<table border="1" >
		<tr>
			<td id="a">글번호</td>
			<td><input type="text" value="${vo.service_id }" name="service_id" readonly="readonly" style="font-size:18px;"></td>
			<td id="a">작성날짜</td>
			<td><input type="text" value="${vo.created_day }" name="created_day" readonly="readonly" style="font-size:18px;"></td>
		</tr>
		<tr>
			<td id="a">작성자</td>
			<td><input type="text" value="${vo.writer }" name="writer" readonly="readonly" style="font-size:18px;"></td>
			<td id="a">수정날짜</td>
			<td><input type="text" value="${vo.updated_day }" name="updated_day" readonly="readonly" style="font-size:18px;"></td>
		</tr>
		<tr>
			<td id="a">제목</td>
			<td colspan="3" id="title"><input type="text" value="${vo.title }" name="title" 
			  style="width:95%;text-align:left;font-size:18px;" readonly="readonly"></td>
		</tr>
		<tr>
			<td id="a">내용</td>
			<td colspan="3" id="content"><textarea rows="5" cols="50" name="content" 
			style="white-space:;width:95%;text-align:left;font-size:18px;" readonly="readonly">${vo.content }</textarea></td>
		</tr>
	</table><br>
	   <input type="submit" value="답글" 
	   formaction="${cp}/service/comment?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&title=${vo.title}&pwd=${vo.pwd}" id="c">
	   <input type="submit" value="수정" 
	   formaction="${cp}/service/update?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}&writer=${vo.writer}&title=${vo.title}&content=${vo.content}&pwd=${vo.pwd}" id="d">
	   <input type="submit" value="삭제" 
	   formaction="${cp}/service/board/delete?service_id=${vo.service_id}&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}" id="c">
	   <input type="submit" value="목록" 
	   formaction="${cp }/service/board/list" id="d">
	
</form>
</div>
</body>
</html>