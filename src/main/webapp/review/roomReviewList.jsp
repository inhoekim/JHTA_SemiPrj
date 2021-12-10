<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	thead {
		background-color: #E6E6E6;
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
	}
	
	.review_list {
		margin: auto;
	}
	
	.review_search {
		text-align: center;
		padding: 10px;
	}
	
	.paging {
		text-align: center;
	}
</style>
<!-- background-image: url('/semiPrj/images/search2.png'); -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rs" value="${requestScope }"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div class="review_listwrap">
	<table class="review_list" width="800px">
		<caption>리뷰 리스트</caption>
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
			<c:forEach var="list" items="${requestScope.list }">
				<tr class="review_td">
					<td class="num">${list.review_id }</td>
					<td class="id">${list.hlogin_id }</td>
					<td class="title"><a href="#">${list.title }</a></td>
					<td class="created_day">${list.created_day }</td>
					<td class="views">${list.views }</td>
					<td class="recommend">${list.recommend }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="review_search">
		<form method="post" action="${path }/review/list">
			<select class="search_select" name="field">
				<option value="title_content">제목 + 내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="id">아이디</option>
				<option value="comment">댓글</option>
			</select>
			<input type="text" class="text_search" name="keyword">
			<input type="button" value="검색">
		</form>
	</div>
	<div class="paging">
		<c:forEach var="i" begin="${rs.startPage }" end="${rs.endPage }">
			<c:choose>
				<c:when test="${rs.pageNum == i }">
					<a href="${path }/review/list?pageNum=${i}"><span style="color: red;">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href="${path }/review/list?pageNum=${i}"><span style="color: black;">${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>
<script>
	var xhr = null;
	viewList();
	function viewList() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				// 클래스 접근
				let num = document.getElementByClassName("num");
				let id = document.getElementByClassName("id");
				let title = document.getElementByClassName("title");
				let created_day = document.getElementByClassName("created_day");
				let views = document.getElementByClassName("views");
				let recommend = document.getElementByClassName("recommend");
				
				for (let i = 0; i < json.length; i++) {
					alert(json.id);
				}
			}
		};
		let url = '${pageContext.request.contextPath}/review/list';
		xhr.open('get', url, true);
		xhr.send();
	}
</script>