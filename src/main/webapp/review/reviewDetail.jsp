<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">

<style>
	.review_area {
		margin: auto;
		width: 800px;
		height: auto;
	}
	
	.comment_count {
		margin: auto;
		width: 800px;
		height: 25px;
		padding: 10 0 10 10;
	}
	
	.comment_wrap {
		margin: auto;
		width: 800px;
		border-top: #D8D8D8 solid 2px;
		border-bottom: #D8D8D8 solid 1px;
	}
	
	.comment_paging {
		text-align: center;
	}
	
	.comment_write_wrap {
		width: 800px;
		margin: auto;
	}
	
	.comment_area {
		widht: 60%;
		float: left;
		padding-left: 60px;
		padding-top: 10px;
	}
	
	.id_day_div {
		padding: 5 0 10 0;
	}
	
	#comment_table {
		border-collapse: collapse;
	}
	
	tr {
		border-bottom: #D8D8D8 solid 1px;
	}
	
	.comment_area .comment_btn {
		width: 40%;
		float: left;
	}
	
	.comment_btn {
		padding-top: 10px;
	}
	
	.comments_div {
		float: letf;
	}
	
	#comment_btn {
		width: 100px;
		height: 66px;
	}
	
	#comment_text_area {
		resize: none;
	}
	
	.comment_edit {
		float: right;
		padding: 10 10;
		margin-top: 10px;
	}
	
	#reply {
		color: black;
		font-weight: bold;
		text-decoration: none;
		padding-right: 10px;
	}
	
	#reply_edit {
		padding-left: 5px;
	}
	
	textarea {
		border: 1px solid #ff6666;
	}
	
	textarea:focus {
		outline: 1px solid #ff6666;
	}
	
	
	.edit_btn:hover {
		color: #ff6666;
		background-color: white;
	}
	
	.edit_btn {
		width: 100px;
		height: 40px;
		border: 1px solid #ff6666;
		color: white;
		background-color: #ff6666;
	}
	
	#comment_btn {
		border: 1px solid #ff6666;
		color: white;
		background-color: #ff6666;
	}
	
	#comment_btn:hover {
		border: 1px solid #ff8080;
		background-color:#ff8080;
	}
	
	a:link {
		color: black; 
		text-decoration: none;
		font-weight: bold;
	}
	
	.comment_td {
		padding-top: 10px;
		padding-bottom: 10px;
	}
	
	.thumb_btn {
		text-align: center;
		margin-top: 12.5px;
		margin-bottom: 12.5px;
	}
	
	#thumb_up_btn, #thumb_down_btn {
		display:inline-block;
		height: 50px;
		width: 50px;
	}
	
	#thumb_up_btn {
		background-image: url('/semiPrj/images/thumb-up-50.png');
		margin-right: 50px;
	}
	
	#thumb_down_btn {
		background-image: url('/semiPrj/images/thumb-down-50.png');
		margin-left: 50px;
	}
	
	#thumb_up_span {
		margin-right: 70px;
	}
	
	#thumb_down_span {
		margin-left: 70px;
	}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="vo" value="${requestScope.vo }"/>
<c:set var="rvo" value="${requestScope.rVo }"/>
<div class="review_detail_wrap">
	<div class="review_area">
		<div class="rivew_header">
			<h3>
				<span>${vo.title }</span>
			</h3>
			<div class="id_day_div">
				<span>${vo.hlogin_id }&nbsp;&nbsp;|&nbsp;&nbsp;${vo.created_day }</span>
			</div>
		</div>
		<c:if test="${requestScope.src_name != null }">
			<div class="img_wrap">
				<span>
					<img src="${requestScope.src }" width="400" height="350">
				</span>
			</div>
		</c:if>
		<div class="write_wrap">
			<p>
				${vo.content   }
			</p>
		</div>
		<div class="thumb_btn">
			<a href="javascript:recommend(1)" id="thumb_up_btn"></a>
			<a href="javascript:recommend(-1)" id="thumb_down_btn"></a>
			<br>
			<span id="thumb_up_span">${rvo.thumb_up }</span>
			<span id="thumb_down_span">${rvo.thumb_down }</span>
		</div>
	</div>
	<div class="comment_count">
		댓글 | <span id="comment_max">0</span>개
	</div>
	<div class="comment_wrap">
		<div class="comment_list">
			<!-- <div id="hlogin_id_div">
			</div>
			<div id="content_div">
			</div>
			<div id="created_day">
			</div> -->
			<table width="800" id="comment_table">
				<colgroup>
					<col style="width: 20%">
					<col style="widht: 60%">
					<col style="width: 20%">
				</colgroup>
				<tbody id="comment_tbody">
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="comment_paging" id="comment_paging">
	</div>
	<div class="comment_write_wrap">
		<div class="comment_area">
			<textarea rows="4" cols="80" id="comment_text_area" onclick="loginCheck()"></textarea>
		</div>
		<div class="comment_btn">
			<input type="button" value="댓글쓰기" id="comment_btn" onclick="commentsBtn()">
		</div>
		<div class="comment_edit">
			<c:if test="${sessionScope.hlogin_id == vo.hlogin_id }">
				<input type="button" value="수정" class="edit_btn" onclick="reviewEdit()">
				<input type="button" value="삭제" class="edit_btn" onclick="reviewDel()">
			</c:if>
		</div>
	</div>
</div>
<script>
	var xhr = null;
	// 추천수 업데이트
	var cookieCheck = '<c:out value="${requestScope.cookieCheck}"/>';
	
	function recommend(num) {
		let check = '<c:out value="${requestScope.hlogin_id}"/>';
		if (check == 'guest' || check == '') {
			alert("로그인을 해주세요.");
			return;
		}
		
		if (cookieCheck == 'fail') {
			alert("추천은 일주일에 한번만 가능합니다.");
			return;
		}
		let	param = 'review_id=' + ${vo.review_id} + '&recommendNum=' + num; 
		let url = '${pageContext.request.contextPath}/recommend/update';
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				let thumb_up_span = document.getElementById('thumb_up_span');
				let thumb_down_span = document.getElementById('thumb_down_span');
				
				let thumb_up = json.thumb_up;
				let thumb_down = json.thumb_down;
				cookieCheck = json.cookieCheck;
				
				thumb_up_span.innerText = thumb_up;
				thumb_down_span.innerText = thumb_down;
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	
	function loginCheck() {
		// 로그인 안 하면 로그인 페이지로
		let check = '<c:out value="${requestScope.hlogin_id}"/>';
		if (check == 'guest' || check == '') {
			location.href = '${path}/home?spage=/home/login.jsp';
		}
	}
	
	function commentsList(i, review_id) {
		xhr = new XMLHttpRequest();
		let content = document.getElementById("comment_text_area").value;
		let url = '${pageContext.request.contextPath}/comments/list';
		let param = "";
		
		if (i == null && review_id == null) {
			param = 'review_id=' + ${vo.review_id}; 
		} else {
			param = 'pageNum=' + i + "&review_id=" + review_id;
		}
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let comment_cnt = document.getElementById("comment_max");
				let id = '<c:out value="${requestScope.hlogin_id}"/>';
				// 부모 태그
				let tbody = document.getElementById("comment_tbody");
				let comment_paging = document.getElementById("comment_paging");
				// 자식 태그
				let tChild = tbody.childNodes;
				let pChild = comment_paging.childNodes;
				//  tbody 자식 tr 제거
				for (let i = tChild.length - 1; i >= 0; i--) {
					let item = tChild.item(i);
					tbody.removeChild(item);
				}
				// comment_paging 자식 a 제거
				for (let i = pChild.length - 1; i >= 0; i--) {
					let item2 = pChild.item(i);
					comment_paging.removeChild(item2);
				}
				// 페이징 관련
				let count = 0;
				let pageNum = 0;
				let pageCount = 0;
				let startPage = 0;
				let endPage = 0;
				let review_id = 0;
				
				for (let i = 0; i < json.length; i++) {
					if (typeof json[i].comment_id != "undefined") {
						count = json[0].count;
						pageNum = json[0].pageNum;
						pageCount = json[0].pageCount;
						startPage = json[0].startPage;
						endPage = json[0].endPage;
						review_id = json[0].review_id;
						
						let comment_id = json[i].comment_id;
						let hlogin_id = json[i].hlogin_id;
						let content = json[i].content;
						let created_day = json[i].created_day;
					
						
						let tbody = document.getElementById("comment_tbody");
						let comm_tr = document.createElement("tr");
						
						let del = "</td>";
						if (hlogin_id == id) {
						  	del = "<a href='javascript:commentDel(" + comment_id + ")' id='reply_delete'>&nbsp;&nbsp;삭제</a></td>";
						}
						
						comm_tr.innerHTML = "<td class='comment_td'>" + hlogin_id + "</td>"
										  + "<td class='comment_td'>" + content + "</td>"
										  + "<td class='comment_td'>" + created_day
										  + del;
										  //+ "<a href='#' id='reply_edit'>수정</a></td>";
						
						tbody.appendChild(comm_tr);
					}
				}
					
				comment_cnt.innerText = count;
				// 이전 페이지
				if (startPage > 5) {
					let comment_paging = document.getElementById("comment_paging");
					let a_tag = document.createElement("a");
					
					a_tag.innerHTML = "<span>" + 이전 + "</span>";
					a_tag.href = "javascript:commentsList(" + (startPage - 1) + ", " + review_id + ")";
				}
				// 다음 페이지
				if (endPage < pageCount) {
					let comment_paging = document.getElementById("comment_paging");
					let a_tag = document.createElement("a");
					
					a_tag.innerHTML = "<span>" + 다음 + "</span>";
					a_tag.href = "javascript:commentsList(" + (startPage + 1) + ", " + review_id + ")";
				}
				// 페이징 처리
				for (let i = startPage; i <= endPage; i++) {
					let comment_paging = document.getElementById("comment_paging");
					let a_tag = document.createElement("a");
					
					if (pageNum != 0 && pageNum == i) {
						a_tag.innerHTML = "<span>" + i + "</span>";
						a_tag.style.color = "red";
						a_tag.href = "javascript:commentsList(" + i + ", " + review_id + ")";
						
					} else if (pageNum != 0) {
						a_tag.innerHTML = "<span>" + i + "</span>";
						a_tag.style.color = "black";
						//a_tag.href = "${path}/comments/list?pageNum=" + i + "&review_id=" + review_id;
						a_tag.href = "javascript:commentsList(" + i + ", " + review_id + ")";
					}
					
					comment_paging.appendChild(a_tag);
				}
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	// 댓글 등록
	function commentsBtn() {
		// 로그인 안 하면 로그인 페이지로
		let check = '<c:out value="${requestScope.hlogin_id}"/>';
		let con = document.getElementById("comment_text_area");
		
		if (check == 'guest' || check == '') {
			location.href = '${path}/home?spage=/home/login.jsp';
			return;
		}
		
		// 공백 체크
		let blank = /^\s+|\s+$/g;
		
		// form
		let comment = document.getElementById("comment_text_area");
		if (comment.value.replace(blank, '') == '') {
			alert("내용을 입력하세요.");
			title.focus();
			return;
		}
		
		if(con.value == "") {
			alert("내용을 입력하세요.");
			con.focus();
			return;
		}
		
		
		
		xhr = new XMLHttpRequest();
		
		let content = document.getElementById("comment_text_area").value;
		
		let url = '${pageContext.request.contextPath}/comments/insert';
		let param = 'review_id=' + ${vo.review_id} + '&content=' + content; 
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				let comment_text_area = document.getElementById("comment_text_area");
				comment_text_area.value = '';
				
				commentsList();
				
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	
	// 댓글 삭제
	function commentDel(comment_id) {
		xhr = new XMLHttpRequest();
		
		let content = document.getElementById("comment_text_area").value;
		
		let url = '${pageContext.request.contextPath}/comments/delete';
		let param = 'comment_id=' + comment_id; 
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				commentsList();
				
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	
	// 리뷰 수정
	function reviewEdit() {
		location.href = "${path}/review/update?review_id=${vo.review_id}"
	}
	
	// 리뷰 삭제
	function reviewDel() {
		location.href = "${path}/review/delete?review_id=${vo.review_id}";
	}
</script>