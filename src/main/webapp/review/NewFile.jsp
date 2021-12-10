<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String snum = request.getParameter("num");
	
	int num = 0;
	
	if (writer == null) {
		writer = "";
		title = "";
		content = "";
	}
	
	if (snum != null) {
		num = Integer.parseInt(snum);
	}
%>
<body>
	<form method="post" action="insert.jsp">
		<label>작성자</label>
		<br>
		<input type="text" name="writer" value="<%=writer %>">
		<br>
		<label>제목</label>
		<br>
		<input type="text" name="title" value="<%=title %>">
		<br>
		<label>내용</label>
		<br>
		<textarea name="content" rows="5" cols="50"><%=content %></textarea>
		<br>
		<label>첨부파일 개 수</label>
		<input type="text" name="num" value="<%=num %>">
		<br>
		<input type="submit" value="확인">
	</form>
	<form method="post" action="insertOk.jsp" enctype="multipart/form-data">
		<input type="hidden" name="writer" value="<%=writer %>">
		<input type="hidden" name="writer" value="<%=title %>">
		<input type="hidden" name="writer" value="<%=content %>">
		<%
			for (int i = 1; i <= num; i++) {
		%>
			<label>첨부파일<%=i %></label>
			<input type="file" name="file<%=i %>"><br>
		<%
			}
		%>
		<input type="submit" value="전송">
	</form>
</body>
</html>