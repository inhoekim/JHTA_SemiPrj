<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h3>관리자 회원정보수정</h3>
<body>
<form id="gaip_chk" method="post" action="<%=request.getContextPath() %>/updateid">
아이디<input type="text" name="hlogin_id" value="${vo.hlogin_id }" ><br>
	 
비밀번호 <input placeholder="새로운비밀번호" type="password" value="${vo.pwd }" name="pwd" id="hlogin_pass" ><br>
비밀번호확인 <input placeholder="새로운비밀번호확인" type="password"value="${vo.pwd}"  name="pwdChk" id="hlogin_passcheck">
<small id= "pw_text_check" style="color: blue; display: inline;"></small><br>
이름<input type="text" name="name" value="${vo.name }"><br>
주민번호<input type="text" id="jnum" name="jnum" value="${vo.jnum }" maxlength="13" readonly="readonly"><br>

나이<input type="text" name="age" value="${vo.age }" ><br>
사는곳<input type="text" name="area" value="${vo.area }"><br>
회원상태<input type="text" name="num" value="${vo.num }"><br>
	<input type="submit" value="변경하기">
	<input type="button" value="뒤로가기" onclick="history.back(-1);">
	</form>
</body>
</html>