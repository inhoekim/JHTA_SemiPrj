<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
	#review-area review_right {
		float: right;
	}
	
	/* 별점 시작 */
	.review_center fieldset {
		display: inline-block;
		border: 0;
	}
	
	.review_center fieldset input[type=radio] {
		display: none; /* 라디오 박스 감추기 */
	}
	
	.review_center fieldset label {
		font-size: 1em; /* 별 크기 */
		color: transparent; /* 기존 별 컬러 제거 */
		text-shadow: 0 0 0 #f0f0f0; /* 새로운 별 이미지 색상 부여 */
	}
	/* 별점 끝 */
</style>

<div class="room_detail">
	<h1>객실 정보</h1>
	<div id="room_img">
		<img alt="호텔 이미지" src="/semiPrj/images/a.jpg">
	</div>
	<div class="roow_review">
		<c:forEach var="list" items="${requestScope.list }">
			<div class="review-area">
				<div class="review_left">
				</div>
				<div class="review_center" style="background-color: #E6E6E6">
					<div class="review_rating">
						<fieldset>
							${list.rate }
							<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
							<input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
							<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
							<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
							<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
						</fieldset>
					</div>
					<div>
						<span>${list.hlogin_id }</span>&nbsp;
						<span>${list.created_day }</span>
						<br>
						<p>
							${list.content }
						</p>
					</div>
				</div>
				<div id="review_right">
					<img src="/images/b.jpg" style="width: 100px; height: 100px;">
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	window.onload = function() {
		dd();
	}
	
	function dd() {
		<c:forEach var="list" items="${requestScope.list}">
			for (let i = 1; i < ${list.rate} + 1; i++) {
				let rate = document.querySelector('label[for="rate' + i + '"]');
				rate.style.textShadow = "0 0 0 #a00";
			}
		</c:forEach>
	}
	
</script>