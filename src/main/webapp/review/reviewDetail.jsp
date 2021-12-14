<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">

<style>
	.review_area {
		margin: auto;
		width: 800px;
		height: 800px;
	}
	
	.comment_count {
		margin: auto;
		width: 800px;
		height: 25px;
	}
	
	.comment_wrap {
		margin: auto;
		width: 800px;
		border-top: #D8D8D8 solid 1px;
		border-bottom: #D8D8D8 solid 1px;
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
	
	.comment_list {
		border-collapse: collapse;
	}
	
	.commend_tr {
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
</style>
<c:set var="vo" value="${requestScope.vo }"/>
<div class="review_detail_wrap">
	<div class="review_area">
		<div class="rivew_header">
			<h3>
				<span>${vo.title }</span>
			</h3>
			<div>
				<span>작성자:${vo.hlogin_id } | 작성일:${vo.created_day }</span>
			</div>
		</div>
		<c:if test="${requestScope.src_name != null }">
			<div class="img_wrap">
				<span>
					<img src="/semiPrj/images/img.png" width="400" height="350">
				</span>
			</div>
		</c:if>
		<div class="write_wrap">
			<p>
				${vo.content }
			</p>
		</div>
		<div class="btn_wrap">
			
		</div>
	</div>
	<div class="comment_count">
		<span>댓글 | 0 개</span>
	</div>
	<div class="comment_wrap">
		<div class="comment_list">
			<!-- <div id="hlogin_id_div">
			</div>
			<div id="content_div">
			</div>
			<div id="created_day">
			</div> -->
			<table width="800">
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
	<div class="comment_write_wrap">
		<div class="comment_area">
			<textarea rows="4" cols="80" id="comment_text_area"></textarea>
		</div>
		<div class="comment_btn">
			<input type="button" value="댓글쓰기" id="comment_btn" onclick="commentsBtn()">
		</div>
	</div>
</div>
<script>
	var xhr = null;
	
	function commentsBtn() {
		xhr = new XMLHttpRequest();
		
		let content = document.getElementById("comment_text_area").value;
		
		let url = '${pageContext.request.contextPath}/review/comments';
		let param = 'review_id=' + ${vo.review_id} + '&content=' + content; 
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				for (let i = 0; i < json.length; i++) {
					let comment_id = json[i].comment_id;
					let hlogin_id = json[i].hlogin_id;
					let content = json[i].content;
					let ref = json[i].ref;
					let lev = json[i].lev;
					let step = json[i].step;
					let created_day = json[i].created_day;
					
					let tbody = document.getElementById("comment_tbody");
					let comm_tr = document.createElement("tr");
					
					comm_tr.innerHTML = "<td>" + hlogin_id + "</td>"
									  + "<td>" + content + "</td>"
									  + "<td>" + created_day + "</td>";
						
					
					tbody.appendChild(comm_tr);
				}
				 
			}
		};
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
</script>