<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath }" />
	<style type="text/css">
	    *{
		font-family: do hyeon; 
		}
		div#maindiv{
			text-align: center;

		}
		table {
			margin: auto;
			border-radius: 4px;
			border:1px solid #ff6666;
			border-collapse: collapse;
			line-height:1.5;
		}
		td#title {
			text-align:left
		}
		th{
			background-color: #ff6666;
			color:white;
			font-size:20px;
		}
	</style>
	<script type="text/javascript">
		function WriteBoard() {
			location.href = "${cp }/insert/serviceboard";
	
		}
	</script>
</head>
<body>
<div id="maindiv">
<h1>문의 게시판</h1>
<div id="a">
	<form method="post" action="${cp }/service/board/list" name="inform">
	<select name="field">
			<option value="writer" <c:if test="${field=='writer' }">selected</c:if>>작성자</option>
			<option value="title" <c:if test="${field=='title' }">selected</c:if>>제목</option>
		</select>
		<input type="text" name="keyword" value="${keyword }" style="text-align:left">
		<input type="submit" value="검색" style="width:60px;height:25px;color:#ff6666;background-color:white;border-radius:4px;border-color:#ff6666">
		<input type="button" value="글쓰기" onclick="WriteBoard()"style="width:60px;height:25px;color:white;background-color:#ff6666;border-radius:4px;border-color:#ff6666">
	</form>	
</div><br>
<table border="1" width="800">

	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성날짜</th> 
		<th>수정날짜</th>
	</tr>
<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.service_id }</td>
		<td>${vo.writer }</td>
		<td id="title"><c:if test="${vo.lev>0 }">
		<c:forEach var="i" begin="1" end="${vo.lev }">
		    &nbsp;&nbsp;
		      </c:forEach>
		       [답글]
		</c:if>
		<a href="${cp }/service/inputpwd?service_id=${vo.service_id }" ><img src="${cp }/images/password.PNG">${ vo.title }</a></td>
		<td>${ vo.created_day }</td>
		<td>${ vo.updated_day }</td>
	</tr>
</c:forEach> 
</table><br>
<div>
<c:if test="${startPage>10 }">
   <a href="${cp }/service/board/list?pageNum=${startPage-1}">[이전페이지]</a>
     </c:if>
  <c:forEach var="i" begin="${startPage }" end="${endPage }">
     <c:choose>
       <c:when test="${pageNum==i }">
         <a href="${cp }/service/board/list?pageNum=${i}&keyword=${keyword}&field=${field}">
         <span style="color:black">${i }</span></a>
       </c:when>
         <c:otherwise>
           <a href="${cp }/service/board/list?pageNum=${i}&keyword=${keyword}&field=${field}">
           <span style="color:gray">${i }</span></a>
          </c:otherwise>
         </c:choose>
        </c:forEach> 
      <c:if test="${endPage<pageCount }">
    <a href="${cp }/service/board/list?pageNum=${endPage+1}">[다음페이지]</a>
  </c:if>
</div>
<br>
<a href="${cp }/service/board/list">전체글보기</a> | <a href="${cp }/home">메인페이지로</a>
</div>
</body>
</html>