<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="searchBar">	
	<form action="${cp}/search" method="post">
		<div class="checkbar" onclick="openCalendar()" style="width:600px; text-align: center; border-radius: 1em 0em 0em 1em; border: 1px solid black;">
			<img src="${cp}/images/calendar.png" style="width:40px;height:40px;vertical-align:middle;position:relative;left:3%;">
			<div style="width:25%; height:100%; display:inline-block; vertical-align: middle; ">
				<p style="display:inline-block;">
					<span style="font-size: 15px;color: #a5a3a3cc;">체크인</span><br>
					<span id="inDate">날짜추가</span>
				</p>
				<input id="checkInForm" name="checkInForm" type="hidden" value="">
			</div>

			<div style="width:25%; height:100%; display: inline-block; vertical-align: middle;">
				<p id="nights" style="display:inline-block; line-height: 45px; font-size: 20px;">0박</p>
			</div>
			
			<div style="width:20%; height:100%; display:inline-block; vertical-align: middle;">
				<p style="display:inline-block;">
					<span style="font-size: 15px;color: #a5a3a3cc;">체크아웃</span><br>
					<span id="outDate">날짜추가</span>
				</p>
				<input id="checkOutForm" name="checkOutForm" type="hidden" value="">
			</div>
		</div>
		
		<div class="checkbar" onclick="openPeopleBox()" 
		style="height:80px; vertical-align: middle; border: 1px solid black;
		margin-left:-6px;width:40px;height: 80px; border-left: 0;border-right: 0;">
			<p>인원</p>
			<p id="people">0명</p>
		</div>
		
		<div style="background-color : #ff6666; display: inline-block; height:82px; width:70px;
		vertical-align: middle; margin-left:-6px; border-radius: 0em 1em 1em 0em;">
			<input type="image" src="${cp}/images/search3.png" style="width:30px; height: 30px;margin-top:27px;">
		</div>
		
		<div id="calendarBox" class="calendarBox">
		</div>
		
		<div id="peopleBox" class="peopleBox">
			<p style="margin-top:10px;">인원</p>
			<input type="button" value="-" onclick="minusPN()" style="width:30px;">
			<p id="pn" style="display:inline-block;">0</p>
			<input id="peopleNum" name="peopleNum" type="hidden" value="0">
			<input type="button" value="+" onclick="plusPN()" style="width:30px;">
		</div>

	</form>
</div>