<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="searchBar">	
	<form action="${pageContext.request.contextPath}/search" method="post">
		<div>
			<div class="checkbar" onclick="openCalendar()" style="width:30%;">
				<p>체크인</p>
				<p id="inDate">날짜추가</p>
				<input id="checkInForm" name="checkInForm" type="hidden" value="">
			</div>
			
			<div class="checkbar">
				<p id="nights">0박</p>
			</div>
			
			<div class="checkbar" onclick="openCalendar()" style="width:30%;">
				<p>체크아웃</p>
				<p id="outDate">날짜추가</p>
				<input id="checkOutForm" name="checkOutForm" type="hidden" value="">
			</div>
			
			<div class="checkbar" onclick="openPeopleBox()">
				<p>인원</p>
				<p id="people">0명</p>
			</div>
			
			<input type="submit" value="검색" style="width:50px;font-size:large;margin-left:10px;">
			<div id="calendarBox" class="calendarBox">
			</div>
			
			<div id="peopleBox" class="peopleBox">
				<p style="margin-top:10px;">인원</p>
				<input type="button" value="-" onclick="minusPN()" style="width:30px;">
				<p id="pn" style="display:inline-block;">0</p>
				<input id="peopleNum" name="peopleNum" type="hidden" value="0">
				<input type="button" value="+" onclick="plusPN()" style="width:30px;">
			</div>
		</div>
	</form>
</div>