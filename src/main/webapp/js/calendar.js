function printCalendar(checkIn) {
	let day = 0;
	let month = 0;
	let year = 0;
	if(checkIn == "undefined" || checkIn == null || checkIn == "") {
		let today = new Date();
		month = today.getMonth() + 1;
		year = today.getFullYear();
	}else {
		let checkInForm = document.getElementById("checkInForm");
		let checkOutForm = document.getElementById("checkOutForm");
		year = (new Date(checkIn)).getFullYear();
		month = (new Date(checkIn)).getMonth();
		month += 1;
		day = (new Date(checkOutForm.value) - new Date(checkInForm.value)) / (1000 * 60 * 60 * 24);
		day = Math.ceil(day);
	}
	setCalendar(1,year,month);
	setCalendar(2,year,month+1);
	if(day!="0") {
		document.getElementById("nights").innerText= day + "박";
		highlighting(day);
	}
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

	calHTML = "<table class='calendar'>" +
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
			"<th colspan='5'>"+ year +"년"+ month +"월</th>" +
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
			else {calHTML += "<tr><td id='"+(""+year+numberPad(month)+numberPad(i))+"' class='cdate' style='color:red' onclick='checkin(this," + year + "," + month + ")'>" + i + "</td>";}
			
		}
		else if(new Date(year,month-1,i,23,59) < today) {calHTML += "<td style='color:rgb(205,205,205);'>" + i + "</td>";}
		else {calHTML += "<td id='"+(""+year+numberPad(month)+numberPad(i))+"' class='cdate' onclick='checkin(this," + year + "," + month + ")'>" + i + "</td>"; 	}
		
	}
	calHTML += "</table>";
	let calendarBox = document.getElementById("calendarBox");
	calendarBox.innerHTML += calHTML;
}

function prev(year,month,flag){
	resetAll();
	if(flag) {
		setCalendar(1,year,month-1);
		setCalendar(2,year,month);
	}
	else {
		setCalendar(3,year,month-1);
	}
	

}
function next(year,month,flag){
	resetAll();
	if(flag) {
		setCalendar(1,year,month);
		setCalendar(2,year,month+1);
	}
	else {
		setCalendar(3,year,month+1);
	}
}

function resetAll(){
	//interaction Bar Reset
	document.getElementById("checkInForm").value="";
	document.getElementById("checkOutForm").value="";
	document.getElementById("inDate").innerText="날짜추가";
	document.getElementById("outDate").innerText="날짜추가";
	document.getElementById("nights").innerText="0박";
	//Calendar Reset
	let calendarBox = document.getElementById("calendarBox");
	let calendar = document.getElementsByClassName("calendar");
	calendarBox.removeChild(calendar[1]);
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
		checkInForm.value = year + "-" + numberPad(month) + "-" + numberPad(event.innerText);
		console.log(checkInForm.value);
		inDate.innerHTML = checkInForm.value;
		event.style.backgroundColor = "#FEC5E5";
	//체크아웃 날짜 결정
	}else if(checkOutForm.value == "") {
		//체크아웃 날짜 결정이 미확정된 상태에서 결정한 체크인 날짜보다 이전 날짜를 선택한 경우
		if(new Date(checkInForm.value) > new Date(year,month-1,event.innerText)) {
			let str = checkInForm.value.split("-");
			let td = document.getElementById(str[0]+str[1]+str[2]);
			td.style.backgroundColor = "";
			checkInForm.value = year + "-" + numberPad(month) + "-" + numberPad(event.innerText);
			inDate.innerHTML = checkInForm.value;
			event.style.backgroundColor = "#FEC5E5";
		//체크아웃 날짜 확정
		}else{
			checkOutForm.value = year + "-" + numberPad(month) + "-" + numberPad(event.innerText);
			outDate.innerHTML = checkOutForm.value;
			event.style.backgroundColor = "#FEC5E5";
			let day = (new Date(checkOutForm.value) - new Date(checkInForm.value)) / (1000 * 60 * 60 * 24);
			day = Math.ceil(day);
			nights.innerText = day + "박";
			highlighting(day); //달력에 하이라이팅 표시
			document.getElementById("calendarBox").style.visibility="hidden";
		}
	//새롭게 체크인 날짜 결정
	}else{
		let day = (new Date(checkOutForm.value) - new Date(checkInForm.value)) / (1000 * 60 * 60 * 24);
		day = Math.ceil(day);
		disHighlighting(day); //달력에 표시된 하이라이팅 지우기
		checkInForm.value = year + "-" + numberPad(month) + "-" + numberPad(event.innerText);
		inDate.innerHTML = checkInForm.value;
		checkOutForm.value = "";
		nights.innerText = "0박";
		outDate.innerHTML = "날짜추가";
		event.style.backgroundColor = "#FEC5E5";
	}	
}

function openCalendar(){
	let calendarBox = document.getElementById("calendarBox");
	let peopleBox = document.getElementById("peopleBox");
	if(calendarBox.style.visibility == "" || calendarBox.style.visibility == "hidden") {
		calendarBox.style.visibility = "visible";
		peopleBox.style.visibility = "hidden";
	}
	else calendarBox.style.visibility = "hidden";
}

function openPeopleBox(){
	let calendarBox = document.getElementById("calendarBox");
	let peopleBox = document.getElementById("peopleBox");
	if(peopleBox.style.visibility == "" || peopleBox.style.visibility == "hidden") {
		calendarBox.style.visibility = "hidden";
		peopleBox.style.visibility = "visible";
	}
	else peopleBox.style.visibility = "hidden";
}

function plusPN(){
	let num = Number(document.getElementById("pn").innerText);
	document.getElementById("pn").innerText = num + 1;
	document.getElementById("peopleNum").value = num + 1;
	document.getElementById("people").innerText = (num + 1) + "명";
}

function minusPN(){
	if(document.getElementById("pn").innerText > 1) {
		document.getElementById("pn").innerText -= 1;
		document.getElementById("peopleNum").value -= 1;
		document.getElementById("people").innerText = document.getElementById("peopleNum").value + "명";
	}
}

function highlighting(day) {
	for(let i = 0; i <= day; i++) {
	let temp = new Date(checkInForm.value);
	temp.setDate(temp.getDate() + i);
	let td_str = "" + temp.getFullYear() + numberPad((temp.getMonth() + 1)) + numberPad(temp.getDate());
	let td = document.getElementById(td_str);
	td.style.backgroundColor= "#FEC5E5";
	}
}

function disHighlighting(day){
	for(let i = 0; i <= day; i++) {
	let temp = new Date(checkInForm.value);
	temp.setDate(temp.getDate() + i);
	let td_str = "" + temp.getFullYear() + numberPad((temp.getMonth() + 1)) + numberPad(temp.getDate());
	let td = document.getElementById(td_str);
	td.style.backgroundColor= "";
	}
}

function numberPad(n) {
    n = n + '';
    return n.length >= 2 ? n : '0' + n;
}