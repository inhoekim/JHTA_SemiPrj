<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<input type="text" value="체크인" id="calendar" onclick="openCaledar()">
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<c:set var="month"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
<c:set var="day"><fmt:formatDate value="${now}" pattern="dd" /></c:set> 

<div id="calendarBox" class="calendarBox">
	
	<table class="calendar" id="c1">
		<tr>
			<th><input type="button" id="preMonth" value="<"></th>
			<th colspan="6">${year}년 ${month}월</th>
		</tr>
		<tr>
			<td style="color:red;" class="col-md-2">일</td>
			<td  class="col-md-2">월</td>
			<td  class="col-md-2">화</td>
			<td  class="col-md-2">수</td>
			<td  class="col-md-2">목</td>
			<td  class="col-md-2">금</td>
			<td  class="col-md-2">토</td>
		</tr>
	</table>
	
	<table class="calendar" id="c2">
		<tr>
			<th colspan="6">${year}년 ${month}월</th>
			<th><input type="button" id="preMonth" value=">"></th>
		</tr>
		<tr>
			<td style="color:red;">일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
	</table>
</div>
</body>

<script type="text/javascript">
function openCaledar(){
	let calendarBox = document.getElementById("calendarBox");
	if(calendarBox.style.visibility == "" || calendarBox.style.visibility == "hidden") calendarBox.style.visibility = "visible";
	else calendarBox.style.visibility = "hidden";
}
</script>