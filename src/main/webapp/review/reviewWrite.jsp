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
		text-shadow: 0 0 0 #E4E018; /* 마우스 호버 */
	}
	
	#review_write_form fieldset label:hover ~ label {
		text-shadow: 0 0 0 #E4E018;	/* 마우스 호버 뒤에오는 별 색상 */
	}
	
	#review_write_form fieldset input[type=radio]:checked ~ label {
		text-shadow: 0 0 0 #E4E018; /* 마우스 클릭 체크 */
	}
	/* 별점 끝 */
	
	.err {
		font-size: 1em;
		color: #ff6666;
	}
	
	#content {
		resize: none;
	}
	
	.review_write {
		margin: auto;
		width: 600px;
	}
	
	#star_field {
		margin-left: 0;
		padding-left: 0;
	}
	
	#title_div {
		margin: 10px 0px 10px 0px;
	}
	
	.content_label_div {
		margin: 10px 0px 10px 0px;
	}
	
	#add_btn_div {
		clear: both;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	#add_btn {
		border: 1px solid #ff6666;
		background-color: rgba(0, 0, 0, 0);
		color: #ff6666;
		width: 80px;
		height: 30px;
		border-radius: 10px;
	}
	
	#add_btn:hover {
		color: white;
		background-color: #ff6666;
	}
	
	#content {
		border: 1px solid #ff6666;
		border-radius: 5px;
	}
	
	
	input[type="text"] {
		border: 1px solid #ff6666;
		border-radius: 5px;
		height: 24px;
		width: 140px;
	}
	
	input[type="file"] {
		display: none;
	}
	
	input:focus {
		outline: 1px solid #ff6666;
	}
	
	textarea:focus {
		outline: 1px solid #ff6666;
	}
	
	.input_file_btn {
		border: 1px solid #ff6666;
		background-color: white;
		border-radius: 8px;
		color: #ff6666;
		cursor: pointer;
		padding: 4px 21px;
		float: left;
	}
	
	.input_file_btn:hover {
		color: white;
		background-color: #ff6666;
	}
	
	.file_name_div {
		float: left;
		margin-right: 5px;
	}
	
	#file_err {
		clear: both;
	}
	
</style>
<div class="review_writewrap">
	<div class="review_write">
		<form id="review_write_form" method="post" action="${pageContext.request.contextPath }/review/write" enctype="multipart/form-data">
			<div id="title_div">
				<label id="title_label">제목</label>
			</div>
			<div>
				<input type="text" name="title" id="title" style="width:225px;" onkeyup="titleCheck()">
				<span id="title_err" class="err"></span>
			</div>
			<br>
			<fieldset id="star_field">
				<legend>평점</legend>
				<input type="radio" name="rating" value="5" id="rate1" onclick="rateSelect(event)"><label for="rate1">⭐</label>
				<input type="radio" name="rating" value="4" id="rate2" onclick="rateSelect(event)"><label for="rate2">⭐</label>
				<input type="radio" name="rating" value="3" id="rate3" onclick="rateSelect(event)"><label for="rate3">⭐</label>
				<input type="radio" name="rating" value="2" id="rate4" onclick="rateSelect(event)"><label for="rate4">⭐</label>
				<input type="radio" name="rating" value="1" id="rate5" onclick="rateSelect(event)"><label for="rate5">⭐</label>
			</fieldset>
			<input type="hidden" name="rate" id="rate">
			<span id="rate_err" class="err"></span>
			<div class="content_label_div">
				<label>내용</label>
			</div>
			<textarea rows="5" cols="30" name="content" id="content" id="content" maxlength="1999" onkeyup="contentCount()"></textarea>
			<div class="textarea_count">
				<span id="text_count">0</span> / 2000
			</div>
				<span id="content_err" class="err"></span>
			<br>
			<label>첨부파일</label>
			<br>
			<div class="file_name_div">
				<input type="text" id="file_name" readonly>
			</div>
			<label class="input_file_btn" for="input_file">업로드</label>
			<div class="file_input_div">
				<input type="file" class="file" id="input_file" name="file" onchange="fileName()">
			</div>
			<br>
			<span id="file_err" class="err"></span>
			<div id="add_btn_div">
				<input type="button" value="등록" id="add_btn" onclick="check()">
			</div>
		</form>
	</div>
</div>
<script>
	var rate = 0;
	
	function fileName() {
		let fileName = document.getElementById("input_file").value;
		let file_val = document.getElementById("file_name");
		let sub = fileName.substring(fileName.lastIndexOf('\\') + 1);
		
		file_val.value = sub;
		
	}
	
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
		let title = document.getElementById("title");
		let content = document.getElementById("content");
		let file = document.getElementById("input_file");
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
		
		if (title.value == "") {
			title_err.innerHTML = "<br>제목을 입력해주세요.";
			title.focus();
			return;
		}
		
		if (rating == 0) {
			rate_err.innerHTML = "<br>객실에 대한 평가를 선택해주세요.";
			return;
		}
		// 히든에 rate 값 넣기
		hRate.value = rating;
		
		if (content.value == "" || content.value.length < 10) {
			content_err.innerText = "10자 이상 입력해주세요.";
			content.focus();
			return;
		}
		
		let fileName = file.value.substring(file.value.lastIndexOf(".") + 1);
		
		if (fileName != "" && fileName != 'png' && fileName != 'jpg') {
			file_err.innerHTML = "<br>png 또는 jpg 파일을 선택해주세요.";
			return;
		}
		form.submit();
	} 
</script>