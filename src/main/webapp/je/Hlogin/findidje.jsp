<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function findId(){
	let xhr=new XMLHttpRequest();
	let jnum=document.getElementById("jnum").value;
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			let data=xhr.responseText;
			let json=JSON.parse(data);
			let div=document.getElementById("result");
			let find=json.find;
			if(find==true){
				div.innerHTML="아이디 : " + json.hlogin_id;
			}else{
				div.innerHTML="해당정보를 가진 아이디를 찾을 수 없습니다.";
				
			}  
		}
	};
	xhr.open('get','/semiPrj/hlogin/select/id?jnum=' + jnum,true);
	xhr.send();
} 


</script>
</head>
<body>
	주민번호
	<input type="text" id="jnum" placeholder="1111111111111">
	<input type="submit" value="찾기" onclick="findId()">
	<p style="color: red; font-size: 7px">*주민번호는 "-"를 제외한 13자리를 입력해
		주세요.</p>
	<div id="result"></div>
	<a href="${pageContext.request.contextPath }/hj/login_hj.jsp">로그인하러가기</a>
</body>
</html>