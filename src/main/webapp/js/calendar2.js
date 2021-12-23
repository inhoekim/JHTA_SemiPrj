function printCalendar() {
	let today = new Date();
	let month = today.getMonth() + 1;
	let year = today.getFullYear();
	setCalendar(3,year,month);
}

function setCalendar(type,year,month) {
	if(month == 13) {
	year++;
	month=1;
	}
	else if(month == 0) {
		year--;
		month=12;
	}
	let today = new Date();
	let first_date = new Date(year,month-1,1).getDay();
	let endDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);	
	//윤년계산
	if((year%400==0) || ((year%4==0) && year%100 !=0)) {endDay[1]=29;}

	calHTML = "<table class='calendar' style='margin:0; height: 100%'>" +
		"<colgroup> " +
		"<col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/><col width='14%'/>" +
		"</colgroup>" +
		"<tr>";
	if(type == 1) {
		calHTML += "<th><input type='button' id='preMonth' value='<' onclick='prev("+ year + "," + (month) + "," + true + ")'></th>"+ 			
			"<th colspan='6'>"+ year +"년"+ month +"월</th></tr>";
	}
	else if(type == 2) {
		calHTML += "<th colspan='6'>"+ year +"년"+ month +"월</th>" +
			"<th><input type='button' id='nextMonth' value='>' onclick='next("+ year + "," + (month) + "," + true + ")'></th></tr>";
	}else if(type == 3){
		calHTML += "<th><input type='button' value='<' onclick='prev("+ year + "," + (month) + ")'></th>" +
			"<th colspan='5'><span id='year'>"+ year +"</span>년<span id='month'>"+ month +"</span>월</th>" +
			"<th><input type='button' value='>' onclick='next("+ year + "," + (month) + ")'></th></tr>";
	}
		
	calHTML += "<tr>" +
		"<td style='color:red;'>일</td>" + 
		"<td>월</td>" +
		"<td>화</td>" +
		"<td>수</td>" +
		"<td>목</td>" +
		"<td>금</td>" +
		"<td>토</td>" +
		"</tr>";
	calHTML += "<tr>"
	for(let i=0; i < first_date; i++) {
		calHTML += "<td>&nbsp;</td>"
	}
	for(let i=1; i <= endDay[month-1]; i++) {
		if((i+first_date-1)%7 ==0) {
			calHTML += "</tr>";
			if(new Date(year,month-1,i,23,59) < today) {calHTML += "<tr><td style='color:rgb(205,205,205);'>" + i + "</td>";}
			else {calHTML += "<tr><td id='"+(""+year+month+i)+"' class='cdate' style='color:red' onclick='checkin(this," + year + "," + month + ")'>" + i + "</td>";}
			
		}
		else if(new Date(year,month-1,i,23,59) < today) {calHTML += "<td style='color:rgb(205,205,205);'>" + i + "</td>";}
		else {calHTML += "<td id='"+(""+year+month+i)+"' class='cdate' onclick='checkin(this," + year + "," + month + ")'>" + i + "</td>"; 	}
		
	}
	calHTML += "</table>";
	let calendarBox = document.getElementById("calendarBox");
	calendarBox.innerHTML += calHTML;
}

function reset(){
	//Calendar Reset
	let calendarBox = document.getElementById("calendarBox");
	let calendar = document.getElementsByClassName("calendar");
	calendarBox.removeChild(calendar[0]);
}


function checkin(event,year,month){
	let checkInForm = document.getElementById("checkInForm");
	let checkOutForm = document.getElementById("checkOutForm");
	let inDate = document.getElementById("inDate");
	let outDate = document.getElementById("outDate");
	let nights = document.getElementById("nights");
	//체크인 날짜 결정
	if(checkInForm.value == "") {
		checkInForm.value = year + "-" + month + "-" + event.innerText;
		inDate.innerHTML = checkInForm.value;
		event.style.backgroundColor = "#FEC5E5";
	//체크아웃 날짜 결정
	}else if(checkOutForm.value == "") {
		//체크아웃 날짜 결정이 미확정된 상태에서 결정한 체크인 날짜보다 이전 날짜를 선택한 경우
		if(new Date(checkInForm.value) >= new Date(year,month-1,event.innerText)) {
			let str = checkInForm.value.split("-");
			let td = document.getElementById(str[0]+str[1]+str[2]);
			if(td != null) {
				td.style.backgroundColor = "";
			}
			checkInForm.value = year + "-" + month + "-" + event.innerText;
			inDate.innerHTML = checkInForm.value;
			event.style.backgroundColor = "#FEC5E5";
		//체크인 날짜보다 이후 날짜를 선택한 경우
		}else{
			checkOutForm.value = year + "-" + month + "-" + event.innerText;
			let day = (new Date(checkOutForm.value) - new Date(checkInForm.value)) / (1000 * 60 * 60 * 24);
			day = Math.ceil(day);
			nights.innerText = day + "박";
			//체크인 날짜와 체크아웃 날짜 사이에 예약이 불가능한 일자가 존재하는 경우
			if(haveBlockDate()) {
				let str = checkInForm.value.split("-");
				let td = document.getElementById(str[0]+str[1]+str[2]);
				if(td != null) {
					td.style.backgroundColor = "";
				}
				checkInForm.value = year + "-" + month + "-" + event.innerText;
				inDate.innerHTML = checkInForm.value;
				checkOutForm.value = "";
				nights.innerText = "0박";
				event.style.backgroundColor = "#FEC5E5";
			//체크인-체크아웃 날짜가 올바르게 확정된 경우
			}else {
				outDate.innerHTML = checkOutForm.value;
				highlighting(); //달력에 하이라이팅 표시
			}
		}
	//새롭게 체크인 날짜 결정
	}else{
		let day = (new Date(checkOutForm.value) - new Date(checkInForm.value)) / (1000 * 60 * 60 * 24);
		day = Math.ceil(day);
		disHighlighting(); //달력에 표시된 하이라이팅 지우기
		checkInForm.value = year + "-" + month + "-" + event.innerText;
		inDate.innerHTML = checkInForm.value;
		checkOutForm.value = "";
		nights.innerText = "0박";
		outDate.innerHTML = "날짜추가";
		event.style.backgroundColor = "#FEC5E5";
	}	
}


function highlighting() {
	let nights = document.getElementById("nights").innerText;
	let day = nights.split('박')[0];
	for(let i = 0; i <= day; i++) {
	let temp = new Date(checkInForm.value);
	temp.setDate(temp.getDate() + i);
	let td_str = "" + temp.getFullYear() + (temp.getMonth() + 1) + temp.getDate();
	let td = document.getElementById(td_str);
	if(td != null) {td.style.backgroundColor= "#FEC5E5";}
	}
}

function disHighlighting(){
	let nights = document.getElementById("nights").innerText;
	let day = nights.split('박')[0];
	for(let i = 0; i <= day; i++) {
		let temp = new Date(checkInForm.value);
		temp.setDate(temp.getDate() + i);
		let td_str = "" + temp.getFullYear() + (temp.getMonth() + 1) + temp.getDate();
		let td = document.getElementById(td_str);
		if(td != null) {td.style.backgroundColor= "";}
	}
}

function offDate(map){
	let year = document.getElementById("year").innerText;
	let month = document.getElementById("month").innerText;
	let offDays = map[year+''+month];
	for(let i = 0; i < offDays.length; i++) {
		let date = document.getElementById(offDays[i]);
		if(date != "undefined" && date != null) {
			date.className = "";
			date.style.color = "#cdcdcd";
			date.onclick = null;
		}
	}
}

function haveBlockDate() {
	let checkIn = document.getElementById("checkInForm").value;
	let nights = document.getElementById("nights").innerText;
	let day = nights.split('박')[0];
	for(let i = 0; i <= day; i++) {
		let temp = new Date(checkIn);
		temp.setDate(temp.getDate() + i);
		let td_str = "" + temp.getFullYear() + (temp.getMonth() + 1) + temp.getDate();
		let td = document.getElementById(td_str);
		if(td != null && td.className != "cdate") {
			return true;
		}
	}
	return false;
}