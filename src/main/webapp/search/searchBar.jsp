<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="searchBar">	
	<div>
		<div class="checkbar" onclick="openCalendar()" style="width:30%;">
			<p>체크인</p>
			<p id="inDate">${param.checkInForm}</p>
			<input id="checkInForm" name="checkInForm" type="hidden" value="${param.checkInForm}">
		</div>
		
		<div class="checkbar">
			<p id="nights">0박</p>
		</div>
		
		<div class="checkbar" onclick="openCalendar()" style="width:30%;">
			<p>체크아웃</p>
			<p id="outDate">${param.checkOutForm}</p>
			<input id="checkOutForm" name="checkOutForm" type="hidden" value="${param.checkOutForm}">
		</div>
		
		<div class="checkbar" onclick="openPeopleBox()">
			<p>인원</p>
			<p id="people">${param.peopleNum}명</p>
		</div>
		
		<input type="submit" value="검색" style="width:50px;font-size:large;margin-left:10px;" onclick="search()">
		<div id="calendarBox" class="calendarBox">
		</div>
		
		<div id="peopleBox" class="peopleBox">
			<p style="margin-top:10px;">인원</p>
			<input type="button" value="-" onclick="minusPN()" style="width:30px;">
			<p id="pn" style="display:inline-block;">${param.peopleNum}</p>
			<input id="peopleNum" name="peopleNum" type="hidden" value="${param.peopleNum}">
			<input type="button" value="+" onclick="plusPN()" style="width:30px;">
		</div>
	</div>

</div>