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
		height: 64px;
	}
	
	#comment_text_area {
		resize: none;
	}
	
	.comment_edit {
		float: right;
		padding: 10 10;
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
</style>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="vo" value="${requestScope.vo }"/>
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
		<div class="btn_wrap">
			
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
				<input type="button" value="수정" onclick="reviewEdit()">
				<input type="button" value="삭제" onclick="reviewDel()">
			</c:if>
		</div>
	</div>
</div>
<script>
	var xhr = null;
	
	function loginCheck() {
		// 로그인 안 하면 로그인 페이지로
		let check = '<c:out value="${requestScope.id}"/>';
		if (check == 'fail') {
			location.href = '${path}/login';
		}
	}
	
	/* function getCookie() {
		let name = 'hlogin_id';
		// 문서에 있는 쿠키 값 저장
		let cookie = document.cookie.replace(" ", "");
		// ; 기준으로 쿠키 나누기
		cookie = cookie.split(";");
		// 쿠키 길이만큼 루프
		for (let i = 0; i < cookie.length; i++) {
			if (cookie[i].split) {
				
			}
		}
	} */
	
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
				let id = '<c:out value="${requestScope.id}"/>';
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
						  	del = "<a href='javascript:commentDel(" + comment_id + ")' id='reply_delete'>삭제</a></td>";
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
		let check = '<c:out value="${requestScope.id}"/>';
		if (check == 'fail') {
			location.href = '${path}/login';
		}
		
		xhr = new XMLHttpRequest();
		
		let content = document.getElementById("comment_text_area").value;
		
		let url = '${pageContext.request.contextPath}/comments/insert';
		let param = 'review_id=' + ${vo.review_id} + '&content=' + content; 
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
	
	window.onload = function() {
		commentsList();
	}
</script>