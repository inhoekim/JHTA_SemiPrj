<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
function ReturnList(){
	location.href="${cp }/service/board/list";
}
function Update(){
		var inform=document.inform;
		var service_id=inform.service_id.value;
	    var ref = inform.ref.value;
		var lev = inform.lev.value;
		var step = inform.step.value;
		var writer = inform.writer.value;
		var title = inform.title.value;
		var content = inform.content.value;
		var pwd = inform.pwd.value;

		if (!pwd || !title || !content) {
			alert("제목과 내용, 비밀번호는 필수 입력사항입니다.");
		} else {
			inform.submit();
		}
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/service/board/update" method="post" name="inform">
		<input type="hidden" name="service_id" id="service_id" value="${vo.service_id }">
		<input type="hidden" name="ref" id="ref" value="${vo.ref }">
		<input type="hidden" name="lev" id="lev" value="${vo.lev }">
		<input type="hidden" name="step" id="step" value="${vo.step }"> 
		<table>
		<tr>
		<td>작성자</td>  
		<td><input type="text" name="writer" id="writer" value="${vo.writer }"></td>
		</tr>
		<tr>
		<td>제목</td>  
		<td><input type="text" name="title" id="title" value="${vo.title }"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea rows="5" cols="50" name="content" id="content">${vo.content}</textarea></td>
		</tr>
		<tr>
		<td>비밀번호</td> 
		<td><input type="password" name="pwd" id="pwd" value="${vo.pwd }"></td>
		</tr>
		</table>
		<p style="color: red; font-size: 7px">
		*비밀번호는 필수 입력 사항입니다.</p>
		<input type="button" value="수정하기" onclick="Update()">
		<input type="button" value="목록으로 돌아가기" onclick="ReturnList()">
		
</form>

</body>
</html>