<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<input type="text" value="체크인" id="calendar" onclick="openCalendar()">
<div id="calendarBox" class="calendarBox">
</div>

<script type="text/javascript">
function openCalendar(){
	let calendarBox = document.getElementById("calendarBox");
	if(calendarBox.style.visibility == "" || calendarBox.style.visibility == "hidden") calendarBox.style.visibility = "visible";
	else calendarBox.style.visibility = "hidden";
}
</script>