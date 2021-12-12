<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<h1>문의 게시판</h1>
<table border="1" width="800">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성날짜</th> 
		<th>수정날짜</th>
		<th>비밀글 여부</th>
	</tr>
<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.service_id }</td>
		<td>${vo.writer }</td>
		<td><c:if test="${vo.lev>0 }">
		<c:forEach var="i" begin="1" end="${vo.lev }">
		    &nbsp;&nbsp;
		      </c:forEach>
		       [답글]
		</c:if>
		<a href="/semiPrj/je/Service/InputPwd.jsp?service_id=${vo.service_id }" >${ vo.title }</a></td>
		<td>${ vo.created_day }</td>
		<td>${ vo.updated_day }</td>
		<td>Y</td><!-- 비밀글여부 따로 표시할것 -->
	</tr>
</c:forEach>
</table>
<div>
<c:if test="${startPage>10 }">
   <a href="${cp }/board/list?pageNum=${startPage-1}">[이전페이지]</a>
     </c:if>
  <c:forEach var="i" begin="${startPage }" end="${endPage }">
     <c:choose>
       <c:when test="${pageNum==i }">
         <a href="${cp }/board/list?pageNum=${i}"><span style="color:black">${i }</span></a>
       </c:when>
         <c:otherwise>
           <a href="${cp }/board/list?pageNum=${i}"><span style="color:gray">${i }</span></a>
          </c:otherwise>
         </c:choose>
        </c:forEach> 
      <c:if test="${endPage<pageCount }">
    <a href="${cp }/board/list?pageNum=${endPage+1}">[다음페이지]</a>
  </c:if>
</div>
<a href="${pageContext.request.contextPath }/je/Service/Boardmain.jsp">메인페이지</a>
</body>
<script type="text/javascript">

</script>
</html>