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
	
	#comment_btn {
		width: 100px;
		height: 64px;
	}
	
	#comment_text_area {
		resize: none;
	}
</style>

<div class="review_detail_wrap">
	<div class="review_area">
		<div class="rivew_header">
			<h3>
				<span>여기 별로임</span>
			</h3>
			<div>
				<span>작성자:kth | 작성일:21.10.11</span>
			</div>
		</div>
		<%-- <c:if test="${img != null }"> --%>
			<div class="img_wrap">
				<span>
					<img src="/semiPrj/images/a.jpg" width="400" height="350">
				</span>
			</div>
		<%--</c:if>--%>
		<div class="write_wrap">
			<p>
				어쩌고 저쩌고
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
			<table width="800">
				<colgroup>
					<col style="width: 20%">
					<col style="widht: 60%">
					<col style="width: 20%">
				</colgroup>
				<tbody>
					<tr class="commend_tr">
						<td>kth</td>
						<td>여기 원래 후짐</td>
						<td>21.10.17</td>	
					</tr>
					<tr class="commend_tr">
						<td>kth</td>
						<td>여기 원래 후짐</td>
						<td>21.10.17</td>	
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="comment_write_wrap">
		<div class="comment_area">
			<textarea rows="4" cols="80" id="comment_text_area"></textarea>
		</div>
		<div class="comment_btn">
			<input type="button" value="댓글쓰기" id="comment_btn">
		</div>
	</div>
</div>
<script>
	
</script>