<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div style="background-color:#eeeeee; text-align: center; min-height: 800px;">
<form action="${cp}/reserve" method="post">
	<div class="reserveForm" style="display:inline-block;vertical-align: top;text-align:center; padding-right: 20px;">
		<p style="font-size : 25px;">예약자정보</p>
		<label>예약자이름</label> <input type="text" disabled="disabled" value="${user.name}"><br>
		<label>주민번호</label>  <input type="text" disabled="disabled" value="${fn:substring(user.jnum,0,6)}-*******"><br>
		<label>이메일</label> <input type="text" placeholder="uriuri@example.com">
		
		<p style="font-size : 25px;">투숙객정보</p>
		<label>영문이름</label>
		<input type="text" placeholder="영문 성">
		<br>
		<label></label>
		<input type="text" placeholder="영문 이름">
		<br>
		<label>연락처</label>
		<input type="text" placeholder="숫자만 입력해 주세요">
		<br>
		<label style="margin-top: 22px;">결제방법</label>
	    <select id="payment" name="payment">
		    <option value="1">카드결제</option>
		    <option value="2">휴대폰결제</option>
		    <option value="3">계좌이체</option>
	    </select>
	</div>
	
	<div class="reserveForm" style="display:inline-block; width: 400px;border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; padding: 20px; vertical-align: top;">
		<p style="font-size : 25px;">공지사항</p>
		<p>
		1. 조식 : 7시 ~ 10시 (Last Order : 9시 30분) <br>
		<span style="font-size:0.8em;color:#C6CCCE;">※ 조식은 코로나 19확산세에 따른 방역 지침에 의하여 뷔페 → 단품으로 변경 운영 될 수 있습니다.<br></span>
		2. 중식 : 12시 ~ 15시 (휴일 및 공휴일은 2부제로 운영 될 수 있습니다.)<br>
		- 정상가 : 성인 25,000원/소인 13,000원<br>
		- 탄산음료 무료제공<br>
		3. 석식 : 18시 ~ 21시 <br> 
		<span style="font-size:0.8em;color:#C6CCCE;">(사회적 거리두기 단계 격상에 따라 운영시간이 변경 될 수 있습니다.)<br></span>
		<br>[코로나 19 관련 안내]<br>
		<span style="font-size:0.95em">우리우리호텔은 고객여러분께서 편안하고 안전한 투숙을 할 수 있도록 열 화상 카메라를 설치하여 체크 중이오니 입실 시 고객님의 협조를 부탁드립니다.<br></span>
		<br>[셔틀버스 중단 안내]<br>
		<span style="font-size:0.95em">고객님의 건강과 위생을 최우선으로 생각하기에 코로나 19가 안정될 때 까지 호텔 ↔ 공항 셔틀버스 운영이 중단 되오니 고객님의 너그러운 양해 부탁 드립니다.</span>
		</p>
		
	</div>
	
	<div class="reserveForm" style="display:inline-block; padding: 20px;">
		<p>예약객실번호: ${room.room_id}</p>
		<p style="display:inline-block">(체크인)${param.checkIn} </p>
		<div id="days" style="display:inline-block; border: 1px solid red; border-radius: 10px 10px 10px 10px;margin-left:5px;margin-right:5px;"></div>
		<p style="display:inline-block">(체크아웃)${param.checkOut} </p>
		<p id="pay" style="font-size: 2em; color: #1E5672; margin-top: 12px; margin-bottom: 12px;"></p>
		<button type="submit" style="background-color: #ff6666; border-radius: 0.3em; border: 0px; font-family: 'Do Hyeon'; width:70px; height: 36px; cursor: pointer;">
			<span style="color:white; font-size: 18px;">예약하기</span>
		</button>
	</div>
	
<input type="hidden" name="roomID" value="${room.room_id}">
<input type="hidden" name="checkIn" value="${param.checkIn}">
<input type="hidden" name="checkOut" value="${param.checkOut}">
<input type="hidden" name="people" value="${param.people}">
</form>
</div>



<script src="${cp}/js/dateCalc.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("days").innerText = getday("${param.checkIn}", "${param.checkOut}") + "박";
	document.getElementById("pay").innerText = "결제금액: " + getTotalPrice("${param.checkIn}", "${param.checkOut}", ${room.price}).toLocaleString('en') + "원";
}
</script>