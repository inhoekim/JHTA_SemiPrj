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
		<form id="review_write_form" method="post" action="${pageContext.request.contextPath }/review/write" enctype="multipart/form-data">
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
			<input type="hidden" name="rate" id="rate">
			<span id="rate_err" class="err"></span>
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
			<span id="file_err" class="err"></span>
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
		let rate_err = document.getElementById("rate_err");
		rate = e.target.value;
		if (rate > 0) {
			rate_err.innerHTML = "";
		}
	}
	
	
	function check() {
		// input
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		let file = document.getElementById("file").value;
		let hRate = document.getElementById("rate");
		// 에러 관련 메시지
		let title_err = document.getElementById("title_err");
		let content_err = document.getElementById("content_err");
		let rate_err = document.getElementById("rate_err");
		let file_err = document.getElementById("file_err");
		// 평점
		let rating = rate;
		
		// form
		let form = document.getElementById("review_write_form");
		
		if (title == "") {
			title_err.innerHTML = "<br>제목을 입력해주세요.";
			return;
		}
		
		if (rating == 0) {
			rate_err.innerHTML = "<br>객실에 대한 평가를 선택해주세요.";
			return;
		}
		// 히든에 rate 값 넣기
		hRate.value = rating;
		
		if (content == "" || content.length < 10) {
			content_err.innerText = "10자 이상 입력해주세요.";
			return;
		}
		
		let fileName = file.substring(file.lastIndexOf(".") + 1);
		
		if (fileName != "" && fileName != 'png' && fileName != 'jpg') {
			file_err.innerHTML = "<br>png 또는 jpg 파일을 선택해주세요.";
			return;
		}
		form.submit();
	} 
</script>