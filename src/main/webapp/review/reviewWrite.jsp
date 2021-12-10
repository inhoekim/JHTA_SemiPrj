<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<style>
	/* 별점 시작 */
	#review_write_form fieldset {
		display: inline-block;
		direction: rtl; /* 좌우 순서 반전 */
		border: 0;
	}
	
	#review_write_form fieldset legend {
		text-align: left;
	}
	
	#review_write_form fieldset input[type=radio] {
		display: none; /* 라디오 박스 감추기 */
	}
	
	#review_write_form fieldset label {
		font-size: 2em; /* 별 크기 */
		color: transparent; /* 기존 별 컬러 제거 */
		text-shadow: 0 0 0 #f0f0f0; /* 새로운 별 이미지 색상 부여 */
	}
	
	#review_write_form fieldset label:hover {
		text-shadow: 0 0 0 #a00; /* 마우스 호버 */
	}
	
	#review_write_form fieldset label:hover ~ label {
		text-shadow: 0 0 0 #a00;	/* 마우스 호버 뒤에오는 별 색상 */
	}
	
	#review_write_form fieldset input[type=radio]:checked ~ label {
		text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
	}
	/* 별점 끝 */
	
</style>
<div class="review_writewrap">
	<div class="review_write">
		<form id="review_write_form" action="${pageContext.request.contextPath }/review/insert">
			<label>제목</label>
			<br>
			<input type="text" name="title" id="title">
			<span id="title_err"></span>
			<br>
			<fieldset>
				<legend>평점</legend>
				<input type="radio" name="rating" value="5" id="rate1" onclick="check(event)"><label for="rate1">⭐</label>
				<input type="radio" name="rating" value="4" id="rate2" onclick="check(event)"><label for="rate2">⭐</label>
				<input type="radio" name="rating" value="3" id="rate3" onclick="check(event)"><label for="rate3">⭐</label>
				<input type="radio" name="rating" value="2" id="rate4" onclick="check(event)"><label for="rate4">⭐</label>
				<input type="radio" name="rating" value="1" id="rate5" onclick="check(event)"><label for="rate5">⭐</label>
			</fieldset>
			<br>
			<label>내용</label>
			<br>
			<textarea rows="5" cols="50" name="content"></textarea>
			<br>
			<label>첨부파일</label>
			<br>
			<input type="file" name="file">
			<br>
			<input type="button" value="등록"  onclick="check()">
			<input type="reset" value="다시 작성">
		</form>
	</div>
</div>
<script>
	function check(e) {
		let rate = e.target.value;
		let title = document.getElementById("title").value;
		let content = document.getElementById("content");
		let title_err = document.getElementById("title_err");
		if (title == "") {
			
		}
		
		if (content == "") {
			
		}
		
	} 
</script>