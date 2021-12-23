<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		    *{
		text-align: center;
		font-family: do hyeon; 
		}
		table {
			font-size: 20px;
			margin: auto;
			border-radius: 4px;
			border:1px solid #ff6666;
			border-collapse: collapse;
			line-height:1.5;
		}
		.serach{
			text-align: center;
			font-family: do hyeon; 
		}
		
		th{
			font-size: 5px;
			background-color: #ff6666;
			color:white;
			font-size:20px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<div class="listadmin">

<h2 >회원정보관리     </h2>


<table border="1">
	<tr>
		<th>아이디</th><th>비밀번호</th><th>이름</th><th>주민번호</th><th>나이</th><th>주소</th><th>가입일</th><th>회원상태</th>
<th>회원정보수정</th>    <th>회원탈퇴</th>
	</tr>
	<c:forEach var="vo" items="${ list }">
		<tr>
			<td>${vo.hlogin_id}</td>
			<td>${vo.pwd }</td>
			<td>${vo.name }</td>
			<td>${vo.jnum }</td>
			<td>${vo.age }</td>
			<td>${vo.area }</td>
			<td>${vo.regdate }</td>
			<td>${vo.num }</td>
		  
		
		<td><a href="<%=request.getContextPath()%>/Admin/update?hlogin_id=${vo.hlogin_id}">수정</a></td>
		  <td><a href="<%=request.getContextPath()%>/Admin/delete?hlogin_id=${vo.hlogin_id}">탈퇴</a></td> 
		</tr>
		
	</c:forEach>
</table>
<div>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${i==pageNum }">
				<a href="${cp }/sh/Adminlist?pageNum=${i}&keyword=${keyword}&field=${field}">
				<span style="color=red">${i }</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/sh/Adminlist?pageNum=${i}&keyword=${keyword}&field=${field}">
				<span style="color=gray">${i }</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<div class ="serach">
	<form method="post" action="${cp }/sh/Adminlist">
		<select name="field">
			<option value="hlogin_id" <c:if test="${field=='hlogin_id' }">selected</c:if>>아이디</option>
			<option value="name" <c:if test="${field=='name' }">selected</c:if>>이름</option>
			<option value="num" <c:if test="${field=='num' }">selected</c:if>>회원상태</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색" >
	</form>
	
</div>
</div>

</body>
</html>