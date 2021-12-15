<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ReturnMain(){
		location.href="${pageContext.request.contextPath }/je/AdminService/AdminBoardList.jsp";
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
<div>
<form action="${pageContext.request.contextPath }/service/admin/comment" method="post" name="inform">
		<input type="hidden" name="service_id" id="service_id" value=<%=service_id %>>
		<input type="hidden" name="ref" id="ref" value=<%=ref %>>
		<input type="hidden" name="lev" id="lev" value=<%=lev %>>
		<input type="hidden" name="step" id="step" value=<%=step %>> 
		<table>
		<tr>
		<td>작성자</td>  
		<td><input type="text" name="writer" id="writer"></td>
		</tr>
		<tr>		
		<td>제목</td>  
		<td><input type="text" name="title" id="title" value=<%=title %> readonly="readonly"></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><textarea rows="5" cols="50" name="content" id="content"></textarea></td>
		</tr>
	    <tr>
	    <td>비밀번호</td>
	    <td><input type="password" name="pwd" id="pwd" value=<%=pwd %> readonly="readonly"></td>
	    </tr>
	    </table>
		<p style="color: red; font-size: 7px">
		*비밀번호는 필수 입력 사항입니다.</p>
		<input type="button" value="등록" onclick="ShowList()">
		<input type="button" value="취소" onclick="ReturnMain()">
</form>
</div>
</body>
</html>