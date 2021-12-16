<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="${cp}/reserve" method="post">
<div style="float : left;">
		<p>예약자정보</p>
		아이디   <input type="text" disabled="disabled" value="${requestScope.userID}"><br>
		예약자이름 <input type="text" disabled="disabled" value="${requestScope.userName}"><br>
		주민번호  <input type="text" disabled="disabled" value="-*******"><br>
		<p>결제방법</p>
	    <select id="payment" name="payment">
		    <option value="1">카드결제</option>
		    <option value="2">휴대폰결제</option>
		    <option value="3">계좌이체</option>
	    </select>
		
	
</div>

<div style="float:right;">
	<p>예약객실번호: ${room.room_id}</p>
	<p style="display:inline-block">(체크인)${param.checkIn} </p>
	<div id="days" style="display:inline-block; border: 1px solid red; border-radius: 10px 10px 10px 10px;margin-left:5px;margin-right:5px;"></div>
	<p style="display:inline-block">(체크아웃)${param.checkOut} </p>
	<p id="pay"></p>
	<input type="submit" value="예약하기" style="float:right">
</div>
</form>