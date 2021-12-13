<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ReturnMain(){
	location.href="${pageContext.request.contextPath }/je/Service/Boardmain.jsp";
}
function ShowList(){
	var inform=document.inform;
	var service_id=inform.service_id.value;
	var ref=inform.ref.value;
	var lev=inform.lev.value;
	var step=inform.step.value;
	var writer=inform.writer.value;
	var title=inform.title.value;
	var content=inform.content.value;
	var pwd=inform.pwd.value; 
	 
	if(!pwd || !title || !content){
		alert("내용은 필수 입력사항입니다.");
	}else{
		inform.submit();
		
	}
	
}
</script>
</head>
<body>
<%
String title=request.getParameter("title");
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String step=request.getParameter("step");
String service_id=request.getParameter("service_id");
String pwd=request.getParameter("pwd");
%>
<form action="${pageContext.request.contextPath }/service/board/insert" method="post" name="inform">
		<input type="hidden" name="service_id" id="service_id" value=<%=service_id %>>
		<input type="hidden" name="ref" id="ref" value=<%=ref %>>
		<input type="hidden" name="lev" id="lev" value=<%=lev %>>
		<input type="hidden" name="step" id="step" value=<%=step %>> 
		작성자  <input type="text" name="writer" id="writer"><br>
		제목  <input type="text" name="title" id="title" value=<%=title %> readonly="readonly"><br>
		내용<br>
		<textarea rows="5" cols="50" name="content" id="content"></textarea><br>
		비밀번호 <input type="password" name="pwd" id="pwd" value=<%=pwd %> readonly="readonly"><br>
		<p style="color: red; font-size: 7px">
		*비밀번호는 필수 입력 사항입니다.</p>
		<input type="button" value="등록" onclick="ShowList()">
		<input type="button" value="취소" onclick="ReturnMain()">
</form>
</body>
</html>