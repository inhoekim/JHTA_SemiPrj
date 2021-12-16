<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
	
	.review_left #star_span {
		font-size: 1em; /* 별 크기 */
		color: transparent; /* 기존 별 컬러 제거 */
		text-shadow: 0 0 0 #a00; /* 새로운 별 이미지 색상 부여 */
	}
	
	.review-area {
		width: 600px;
		border: #E6E6E6 solid 1px;
		cursor: pointer;
	}
	
	.review_left {
		width: 79%;
		float: left;
		padding: 2 2 0 20;
	}
	
	.review_right {
		width: 21%;
		float: left;
	}
</style>
<c:set var="rs" value="${requestScope }"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div class="room_detail">
	<h1>객실 정보</h1>
	<div id="room_img">
		<img alt="호텔 이미지" src="/semiPrj/images/a.jpg">
	</div>
	<div class="roow_review">
		<c:forEach var="list" items="${requestScope.list }">
			<div class="review-area" onclick="location.href='#';">
				<div class="review_left">
					<div class="review_rating">
						<c:forEach begin="1" end="${list.rate }">
							<span id="star_span">★</span>
						</c:forEach>
					</div>
					<div>
						<span>${list.hlogin_id }</span>&nbsp;|
						<span>${list.created_day }</span>
						<br>
						<p>
							${list.content }
						</p>
					</div>
				</div>
				<div id="review_right">
						<img src="/semiPrj/images/b.jpg" style="width: 100px; height: 100px;">
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="paging">
		<c:if test="${rs.startPage > 3 }">
			<a href="${path }/room/detail?pageNum=${rs.startPage - 1}&room_id=${rs.room_id}"><span>이전</span></a>
		</c:if>
		<c:forEach var="i" begin="${rs.startPage }" end="${rs.endPage }">
			<c:choose>
				<c:when test="${rs.pageNum == i }">
					<a href="${path }/room/detail?pageNum=${i}&room_id=${rs.room_id}"><span style="red">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href="${path }/room/detail?pageNum=${i}&room_id=${rs.room_id}"><span style="black">${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${rs.endPage < rs.pageCount }">
			<a href="${path }/room/detail?pageNum=${rs.endPage + 1}&room_id=${rs.room_id}"><span>다음</span></a>
		</c:if>
	</div>
</div>
<script>
	
</script>