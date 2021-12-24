<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		*{ 
	   font-family: do hyeon;  
	   }
	   div#informboard{
	   text-align: center;
	   position:absolute;
	   top:50%;
	   left:50%; 
	   transform:translate(-50%,-50%);
	   }
	   table {
		    width:500px;
		    height : 300px; 
			margin: auto;
			border-radius: 4px;
			border:2px solid #ff6666;
			border-collapse: collapse;
			line-height:1.5;
			font-size:20px;		
		}
		td#b{ 
			background-color:pink;
		}
		td#c{  
			text-align:left;
			padding:5px; 
			width:400px; 
			height :40px;  
		}
	</style>
<script type="text/javascript">
	function ReturnMain(){
		location.href="${pageContext.request.contextPath }/service/admin/list";
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
<div id="informboard">
<form action="${pageContext.request.contextPath }/service/admin/comment" method="post" name="inform">
		<input type="hidden" name="service_id" id="service_id" value=<%=service_id %>>
		<input type="hidden" name="ref" id="ref" value=<%=ref %>>
		<input type="hidden" name="lev" id="lev" value=<%=lev %>>
		<input type="hidden" name="step" id="step" value=<%=step %>> 
		<h3 style="font-size:35px">답글쓰기</h3>
		<table border="1">
		<tr>
		<td id="b">작성자</td>  
		<td id="c"><input type="text" name="writer" id="writer" style="width:400px;height:20px;font-size:18px;"></td>
		</tr>
		<tr>		
		<td id="b">제목</td>  
		<td id="c"><input type="text" name="title" id="title" value=<%=title %> readonly="readonly" style="width:400px;height:20px;font-size:18px;"></td>
		</tr>
		<tr>
		<td id="b">내용</td>
		<td id="c"><textarea rows="5" cols="50" name="content" id="content" style="width:400px;height:80px;font-size:18px;"></textarea></td>
		</tr>
	    <tr>
	    <td id="b">비밀번호</td>
	    <td id="c"><input type="password" name="pwd" id="pwd" value=<%=pwd %> readonly="readonly" style="width:400px;height:20px;font-size:18px;"></td>
	    </tr>
	    </table><br><br>  
		<input type="button" value="등록" onclick="ShowList()" style="width:80px;height:30px;color:#ff6666;background-color:white;border-radius:4px;border-color:#ff6666;font-size:20px;cursor: pointer;">
		<input type="button" value="취소" onclick="ReturnMain()" style="width:80px;height:30px;color:white;background-color:#ff6666;border-radius:4px;border-color:#ff6666;font-size:20px;cursor: pointer;">
</form>
</div>
</body>
</html>