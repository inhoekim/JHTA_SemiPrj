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
	
	.err {
		font-size: 0.5em;
		color: blue;
	}
	
	#content {
		resize: none;
	}
</style>
<div class="review_writewrap">
	<div class="review_write">
		<!-- ${pageContext.request.contextPath }/review/insert -->
		<form id="review_write_form" action="">
			<label>제목</label>
			<br>
			<input type="text" name="title" id="title" onkeyup="titleCheck()">
			<span id="title_err" class="err"></span>
			<br>
			<fieldset>
				<legend>평점</legend>
				<input type="radio" name="rating" value="5" id="rate1" onclick="rateSelect(event)"><label for="rate1">⭐</label>
				<input type="radio" name="rating" value="4" id="rate2" onclick="rateSelect(event)"><label for="rate2">⭐</label>
				<input type="radio" name="rating" value="3" id="rate3" onclick="rateSelect(event)"><label for="rate3">⭐</label>
				<input type="radio" name="rating" value="2" id="rate4" onclick="rateSelect(event)"><label for="rate4">⭐</label>
				<input type="radio" name="rating" value="1" id="rate5" onclick="rateSelect(event)"><label for="rate5">⭐</label>
			</fieldset>
			<span id="rate_err"></span>
			<br>
			<label>내용</label>
			<br>
			<textarea rows="5" cols="50" name="content" id="content" maxlength="1999" onkeyup="contentCount()"></textarea>
			<div class="textarea_count">
				<span id="text_count">0</span> / 2000
			</div>
				<span id="content_err" class="err"></span>
			<br>
			<label>첨부파일</label>
			<br>
			<input type="file" name="file" id="file">
			<br>
			<input type="button" value="등록"  onclick="check()">
			<input type="reset" value="다시 작성">
		</form>
	</div>
</div>
<script>
	var xhr = null;
	var rate = 0;
	
	function titleCheck() {
		let title = document.getElementById("title").value;
		let title_err = document.getElementById("title_err");
		
		if (title.length > 0) {
			title_err.innerHTML = "";
		}
	}
	
	function contentCount() {
		let content = document.getElementById("content").value;
		let content_err = document.getElementById("content_err");
		let span = document.getElementById("text_count");
		
		if (content.length >= 10) {
			content_err.innerHTML = "";
		}
		
		span.innerHTML = content.length;
	}
	
	function rateSelect(e) {
		rate = e.target.value;
	}
	
	
	function check() {
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		let file = document.getElementById("file").value;
		let title_err = document.getElementById("title_err");
		let content_err = document.getElementById("content_err");
		let rate = e.target.value;
		if (title == "") {
			title_err.innerHTML = "<br>제목을 입력해주세요.";
			return;
		}
		
		if (rate == 0) {
			
		}
		
		if (content == "" || content.length < 11) {
			content_err.innerText = "10자 이상 입력해주세요.";
			return;
		}
		
		
	} 
</script>