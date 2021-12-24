<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	* {
		margin: 0;
		padding: 0;
	}

	.review_writewrap {
		width: auto;
	    height: auto;
	    margin: auto;
	    
	}
	
	.review_write {
		width: 20%;
		margin: auto;
		border: 2px solid #ff6666;
		width: 228px;
		padding: 30px 30px 30px 30px;
	}
	
	#content {
		resize: none;
		border: 1px solid #ff6666;
		border-radius: 5px;
	}
	
	.title_div {
		margin: 10px 0px 10px 0px;
	}
	
	.content_title_div {
		margin: 10px 0px 10px 0px;
	}
	
	input[type="text"] {
		border: 1px solid #ff6666;
		border-radius: 5px;
		height: 24px;
		width: 140px;
	}
	
	input:focus {
		outline: 1px solid #ff6666;
	}
	
	textarea:focus {
		outline: 1px solid #ff6666;
	}
	
	#add_btn {
		border: 1px solid #ff6666;
		background-color: rgba(0, 0, 0, 0);
		color: #ff6666;
		width: 80px;
		height: 30px;
		border-radius: 10px;
	}
	
	.addbtn_div {
		margin-left: 70px;
	}
	
	#add_btn:hover {
		color: white;
		background-color: #ff6666;
	}
</style>
<c:set var="vo" value="${requestScope.vo }"/>
<div class="review_writewrap">
	<div class="review_write">
		<form id="review_write_form" method="post" action="${pageContext.request.contextPath }/review/update?review_id=${param.review_id }">
			<div class="title_div">
				<label>제목</label>
			</div>
			<input type="text" name="title" id="title" value="${vo.title }" style="width:225px;" onkeyup="titleCheck()">
			<span id="title_err" class="err"></span>
			<div class="content_title_div">
				<label>내용</label>
			</div>
			<textarea rows="5" cols="30" name="content" id="content" maxlength="1999" onkeyup="contentCount()">${vo.content }</textarea>
			<div class="textarea_count">
				<span id="text_count">0</span> / 2000
			</div>
				<span id="content_err" class="err"></span>
			<br>
			<div class="addbtn_div">
				<input type="button" value="등록" id="add_btn" onclick="check()">
			</div>
		</form>
	</div>
</div>
<script>
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
	
	function check() {
		// input
		let title = document.getElementById("title");
		let content = document.getElementById("content");
		// 에러 관련 메시지
		let title_err = document.getElementById("title_err");
		let content_err = document.getElementById("content_err");
		
		// form
		let form = document.getElementById("review_write_form");
		
		// 공백 체크
		let blank = /^\s+|\s+$/g;
		
		if (title.value == "" || title.value.replace(blank, '') == '') {
			title_err.innerHTML = "<br>제목을 입력해주세요.";
			title.focus();
			return;
		}
		
		
		
		if (content.value == "" || content.value.length < 10) {
			content_err.innerText = "10자 이상 입력해주세요.";
			content.focus();
			return;
		}
		
		if (content.value.replace(blank, '') == '') {
			content_err.innerHTML = "내용을 입력해주세요.";
			content.focus();
			return;
		}
		
		form.submit();
	}
	
	getCount();
	
	function getCount() {
		let content = document.getElementById("content").value;
		let span = document.getElementById("text_count");
		span.innerHTML = content.length;
	}
	
	
	/* window.onload = function(){
		getList();
	} */
</script>