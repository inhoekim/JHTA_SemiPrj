<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	div#serchid {
		width:300px;
		height:200px;
		border: 2px solid #ff6666;	
		padding:50px;
		border-radius:4px;
		text-align:center;
		position:absolute;
		top:50%;
		left:50%; 
		transform:translate(-50%,-50%);
	}
	#serchid a{
	display: inline-block; 
	line-height: 100px;
	text-decoration:none;
    }
    
</style>
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
				div.innerHTML="해당정보를 가진 아이디를" +"<br>" +"찾을 수 없습니다.";
				
			}  
		}
	};
	xhr.open('get','/semiPrj/hlogin/select/id?jnum=' + jnum,true);
	xhr.send();
} 


</script>
</head>
<body>
  <div id="serchid">
		<span style="font-size:25px">주민번호를 입력해 주세요</span><br><br>
		<input type="text" id="jnum" placeholder="1111111111111">
		<input type="submit" value="찾기" onclick="findId()" style="cursor: pointer;background-color: white; min-width:50px; 
		border-radius: 4px; line-height: 20px; color: #ff6666">
		<p style="color: red; font-size: 13px">
		*주민번호는 "-"를 제외한 13자리를 입력해주세요.</p>
		<div id="result" style="font-size:25px;color:blue;"></div>	
		<a href="${cp}/home?spage=/home/login.jsp" style="background-color: #ff6666; min-width: 82px; 
		border-radius: 4px; line-height: 40px; color: #ffffff; min-width: 82px; ">로그인</a>
  </div>
</body>
</html>