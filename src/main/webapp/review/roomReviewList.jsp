<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	thead {
		background-color: #ff6666;
	}
	
	.review_td {
		border-bottom: #D8D8D8 solid 1px;
	}
	
	.review_list {
		border-collapse: collapse;
	}
	
	td {
		text-align: center;
		padding: 4px 4px;
	}
	
	th {
		padding: 6px 4px;
		color: white;
	}
	
	.review_list {
		margin: auto;
	}
	
	.review_search {
		text-align: center;
		margin-top: 5px;
	}
	
	.paging {
		text-align: center;
		margin-top: 10px;
	}
	
	#title {
	  overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
	}
	
	h2 {
		text-align: center;
	}
	
	input[type="text"] {
		border: 1px solid #ff6666;
		border-radius: 5px;
		height: 20px;
		width: 140px;
	}
	
	#search_btn {
		border: 1px solid #ff6666;
		border-radius: 5px;
		color: white;
		background-color: #ff6666;
		height: 24px;
	}
	
	#search_btn:hover {
		background-color: white;
		color: #ff6666;
	}
	
	input:focus {
		outline: 1px solid #ff6666;
	}
	
	select:focus {
		outline: 1px solid #ff6666;
	}
	
	select {
		border: 1px solid #ff6666;
		border-radius: 5px;
		height: 24px;
	}
	
	option {
		outline: 1px solid #ff6666;
	}
	
	a:link {
		color: black;
		text-decoration: none;
	}
	
	a:hover {
		text-decoration: underline;
	}
</style>
<!-- background-image: url('/semiPrj/images/search2.png'); -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="rs" value="${requestScope }"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- 리뷰 댓글수 카운트 -->
<c:set var="list2" value="${requestScope.list2 }"/>
<div class="review_listwrap">
	<h2>리뷰 게시판</h2>
	<table class="review_list" width="800px">
		<!-- col 컬럼  -->
		<colgroup>
			<col style="width: 10%">
			<col style="widht: 10%">
			<col style="width: 40%">
			<col style="widht: 20%">
			<col style="widht: 10%">
			<col style="widht: 10%">
		</colgroup>
		<thead>
			<tr class="review_th">
				<th>No.</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty requestScope.list }">
					<c:set var="chk" value="fail"/>
				</c:when>
				<c:otherwise>
					<c:set var="chk" value="sussess"/>
				</c:otherwise>
			</c:choose>
			<c:forEach var="list" items="${requestScope.list }" varStatus="status">
				<tr class="review_td">
					<%-- <c:choose>
						<c:when test="${empty list }">
							<td colspan="6">검색된 결과가 없습니다.</td>
						</c:when>
						<c:otherwise> --%>
							<c:if test="${chk eq fail }">
								<td colspan="6">검색된 결과가 없습니다.</td>
							</c:if>
							<td id="num">${list.review_id }</td>
							<td id="id">${list.hlogin_id }</td>
							<td id="title"><a href="${path }/review/detail?review_id=${list.review_id}">${list.title }&nbsp;
								<c:if test="${list2[status.index] != 0 }">
									[${list2[status.index] }]
								</c:if>
							</a></td>
							<td id="created_day">${list.created_day }</td>
							<td id="views">${list.views }</td>
							<td id="recommend">${list.recommend }</td>
						<%-- </c:otherwise>
					</c:choose> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">
		<c:if test="${rs.startPage > 10 }">
			<a href="${path }/review/list?pageNum=${rs.startPage - 1}&field=${rs.field}&keyword=${rs.keyword}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${rs.startPage }" end="${rs.endPage }">
			<c:choose>
				<c:when test="${rs.pageNum == i }">
					<a href="${path }/review/list?pageNum=${i}&field=${rs.field}&keyword=${rs.keyword}"><span style="color: red;">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href="${path }/review/list?pageNum=${i}&field=${rs.field}&keyword=${rs.keyword}"><span style="color: black;">${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${rs.endPage < pageCount }">
			<a href="${path }/review/list?pageNum=${rs.endPage + 1}&field=${rs.field}&keyword=${rs.keyword}">다음</a>
		</c:if>
	</div>
	<div class="review_search">
		<form method="post" action="${path }/review/list">
			<select class="search_select" name="field">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="hlogin_id">아이디</option>
			</select>
			<input type="text" class="text_search" name="keyword">
			<input type="submit" id="search_btn" value="검색">
		</form>
	</div>
</div>
<script>
</script>