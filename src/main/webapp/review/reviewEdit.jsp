<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="vo" value="${requestScope.vo }"/>
<div class="review_writewrap">
	<div class="review_write">
		<form id="review_write_form" method="post" action="${pageContext.request.contextPath }/review/update?review_id=${param.review_id }">
			<label>제목</label>
			<br>
			<input type="text" name="title" id="title" value="${vo.title }" onkeyup="titleCheck()">
			<span id="title_err" class="err"></span>
			<br>
			<label>내용</label>
			<br>
			<textarea rows="5" cols="50" name="content" id="content" maxlength="1999" onkeyup="contentCount()">${vo.content }</textarea>
			<div class="textarea_count">
				<span id="text_count">0</span> / 2000
			</div>
				<span id="content_err" class="err"></span>
			<br>
			<input type="button" value="등록"  onclick="check()">
			<input type="reset" value="다시 작성" onclick="reset()">
		</form>
	</div>
</div>
<script>
	function reset() {
		let span = document.getElementById("text_count");
		span.innerHTML = "0";
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
	
	function check() {
		// input
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		// 에러 관련 메시지
		let title_err = document.getElementById("title_err");
		let content_err = document.getElementById("content_err");
		
		// form
		let form = document.getElementById("review_write_form");
		
		if (title == "") {
			title_err.innerHTML = "<br>제목을 입력해주세요.";
			return;
		}
		
		if (content == "" || content.length < 10) {
			content_err.innerText = "10자 이상 입력해주세요.";
			return;
		}
		
		form.submit();
	} 
</script>