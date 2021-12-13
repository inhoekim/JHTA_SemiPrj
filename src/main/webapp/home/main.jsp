<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div id="interaction">	
	<form action="">
		<div style="width:40%;">
		
			<div class="checkbar" onclick="openCalendar()" style="width:30%;">
				<p>체크인</p>
				<p id="inDate">날짜추가</p>
				<input id="checkInForm" type="hidden" value="">
			</div>
			
			<div class="checkbar">
				<p id="nights">0박</p>
			</div>
			
			<div class="checkbar" onclick="openCalendar()" style="width:30%;">
				<p>체크아웃</p>
				<p id="outDate">날짜추가</p>
				<input id="checkOutForm" type="hidden" value="">
			</div>
			
			<div id="calendarBox" class="calendarBox">
			</div>
			
		</div>
	</form>
</div>





<script type="text/javascript">
function openCalendar(){
	let calendarBox = document.getElementById("calendarBox");
	if(calendarBox.style.visibility == "" || calendarBox.style.visibility == "hidden") calendarBox.style.visibility = "visible";
	else calendarBox.style.visibility = "hidden";
}
</script>