function printCalendar() {
	let today = new Date();
	let month = today.getMonth() + 1;
	let year = today.getFullYear();
	setCalendar(1,year,month);
	setCalendar(2,year,month+1);
}

function setCalendar(type,year,month) {
	let today = new Date();
	let today_mm = today.getMonth() + 1;
	let today_yy = today.getFullYear();
	let today_dd = today.getDay();
	let date = today.getDate();

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
		calHTML += "<th><input type='button' id='preMonth' value='<' onclick='prev("+ year + "," + (month) + ")'></th>"+ 			
			"<th colspan='6'>"+ year +"년"+ month +"월</th>";
	}
	else if(type == 2) {
		calHTML += "<th colspan='6'>"+ year +"년"+ month +"월</th>" +
			"<th><input type='button' id='nextMonth' value='>' onclick='next("+ year + "," + (month) + ")'></th>";
	}
		
	calHTML += "</tr><tr>" +
		"<td style='color:red;'>일</td>" + 
		"<td>월</td>" +
		"<td>화</td>" +
		"<td>수</td>" +
		"<td>목</td>" +
		"<td>금</td>" +
		"<td>토</td>" +
		"</tr>";
		
	calHTML += "</table>";
	let calendarBox = document.getElementById("calendarBox");
	calendarBox.innerHTML += calHTML;
}

function prev(year,month){
	let calendarBox = document.getElementById("calendarBox");
	let calendar = document.getElementsByClassName("calendar");
	calendarBox.removeChild(calendar[1]);
	calendarBox.removeChild(calendar[0]);
	setCalendar(year,month-1,1);
	setCalendar(year,month,2);

}
function next(year,month){
	let calendarBox = document.getElementById("calendarBox");
	let calendar = document.getElementsByClassName("calendar");
	calendarBox.removeChild(calendar[1]);
	calendarBox.removeChild(calendar[0]);
	setCalendar(1,year,month);
	setCalendar(2,year,month+1);
}