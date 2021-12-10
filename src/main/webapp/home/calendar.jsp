<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function printCalendar() {
		let today = new Date();
		setCalendar(2021,12,1);
		setCalendar(2021,13,2);
	}

	function setCalendar(let year, let month, let type) {
		if(month == 13) {
			year++;
			month=1;
		}
		else if(month == 0) {
			year--;
			month=12;
		}
		
		calHTML = "<table class='calendar'>" +
			"<colgroup> " +
			"<col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/>" +
			"</colgroup>" +
			"<tr>";
		if(type == 1) {
			calHTML += "<th colspan='6'>"+ year +"년"+ month +"월</th>" +
				"<th><input type='button' id='preMonth' value='<' onclick='prev("+ year, month-1 + ")'></th>";
		}
		else if(type == 2) {
			calHTML += "<th colspan='6'>"+ year +"년"+ month +"월</th>" +
				"<th><input type='button' id='nextMonth' value='>' onclick='next("+ year, month+1 + ")'></th>";
		}
			
		calHTML += "</tr>" +
			"<td style='color:red;'>일</td>" + 
			"<td>월</td>" +
			"<td>화</td>" +
			"<td>수</td>" +
			"<td>목</td>" +
			"<td>금</td>" +
			"<td>토</td>" +
			"</tr></table>";
		let calendarBox = document.getElementById("calendarBox");
		calendarBox.innerHTML = calHTML;
	}

	function prev(let year, let month){
		let calendarBox = document.getElementById("calendarBox");
		let calendar = document.getElementsByClassName("calendar");
		calendarBox.removeChild(calendar[1]);
		calendarBox.removeChild(calendar[0]);
		setCalendar(year,month,1);
		setCalendar(year,month+1,2);

	}
	function next(let year, let month){
		let calendarBox = document.getElementById("calendarBox");
		let calendar = document.getElementsByClassName("calendar");
		calendarBox.removeChild(calendar[1]);
		calendarBox.removeChild(calendar[0]);
		setCalendar(year,month,1);
		setCalendar(year,month+1,2);
	}
</script>