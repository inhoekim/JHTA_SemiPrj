<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="text-align: center; width: 100%">
<h1 style="font-size:38px; background-color: #eeeeee;color: #400000; height:90px;line-height:90px;" >나의 예약내역</h1>

<p style="float:right; color: #BBBBBB; position: relative; right: 10%;">※주의: 결제취소의 경우 체크인날짜 이틀전까지만 가능합니다</p>

<table style="margin: auto; width: 80%; border-top: 2px solid black; border-collapse: collapse; clear: both;">
	<tr style="height:60px; border-bottom: 1px solid #DBDBDB;">
		<th>예약ID</th>
		<th>객실정보</th>
		<th>체크인/체크아웃</th>
		<th>예약일</th>
		<th>결제금</th>
		<th>예약상태</th>
	</tr>
		<c:if test="${requestScope.jsonArr.length()-1 >= 0}">
		<c:forEach var="i" begin="0" end="${requestScope.jsonArr.length()-1}">
		<c:set var="json" value="${requestScope.jsonArr.getJSONObject(i)}"/>
		<tr style="height:100px; border-bottom: 1px solid #DBDBDB;">
			<td>
				<p>${json.get("reserve_id")}</p>
			</td>
		
			<td>
				<p>${json.get("room_id")}번객실 (${json.get("kind")}/최대${json.get("capacity")}인)</p>
			</td>
			
			<td>
				<p>${json.get("start_day")}<p>
				<p><span style="border:2px solid #ff6666;border-radius: 0.6em; width:32px; display:inline-block;">
				${json.get("days")}박</span>
				</p>
				<p>${json.get("end_day")}</p>
			</td>
			
			<td>
				<p>${json.get("reserve_date")}</p>
			</td>
			
			<td>
				<p>${json.get("cost")}원</p>
			</td>
			
			<td>
			<c:set var="today" value="<%=java.sql.Timestamp.valueOf(java.time.LocalDate.now().atStartOfDay())%>"/>
			<fmt:parseDate var="checkinDay" value="${json.get('start_day')}" pattern="yyyy-MM-dd"/>
			<fmt:parseDate var="checkoutDay" value="${json.get('end_day')}" pattern="yyyy-MM-dd"/>
			<c:set var="ms" value="${checkinDay.getTime()-today.getTime()}" />
			<c:set var="reviewMs" value="${checkoutDay.getTime()-today.getTime()}" />
			<fmt:parseNumber var="remainDay" integerOnly="true" value="${ms/24*60*60*1000 }"/>
			<fmt:parseNumber var="reviewDay" integerOnly="true" value="${reviewMs/24*60*60*1000 }"/>

			<c:choose>
			<c:when test= "${json.get('statement') == 1}">
				<p>결제대기</p>
				<a href="${cp}/reserve/cancle?reserve_id=${json.get('reserve_id')}" style="text-decoration: none;">
				<button type="button" style="border:1px solid #ff6666; border-radius: 1em; font-family: 'Do Hyeon'; width:50px; height: 25px; cursor: pointer;">
				<span style="font-size: 16px; color : #ff6666">취소</span>
				</button>
				</a>
				<a href="${cp}/reserve/payment?reserve_id=${json.get('reserve_id')}" style="text-decoration: none;">
				<button type="button" style="background-color: #ff6666; border-radius: 1em; border: 0px; font-family: 'Do Hyeon'; width:50px; height: 25px; cursor: pointer;">
				<span style="font-size: 16px; color : white;">결제</span>
				</button>
				</a>

			</c:when>
			<c:when test="${json.get('statement') == 2}">
				<p style="margin: 0;margin-top: 10px;">결제완료</p>
				<c:choose>
				<c:when test="${remainDay gt 1}">
					<a href="${cp}/reserve/cancle?reserve_id=${json.get('reserve_id')}" style="text-decoration: none;">
					<button type="button" style="border:1px solid #ff6666; border-radius: 1em; font-family: 'Do Hyeon'; width:50px; height: 25px; cursor: pointer;">
					<span style="font-size: 16px; color : #ff6666">취소</span>
					</button>
					</a>
				</c:when>
				
				<c:when test="${reviewDay <= 0}">
					<a href="${cp}/review/write?room_id=${json.get('room_id')}" style="text-decoration: none;">
					<button type="button" style="border:1px solid #775CE2; border-radius: 1em; font-family: 'Do Hyeon'; width:70px; height: 25px; cursor: pointer;">
						<span style="font-size: 16px; color : #775CE2">리뷰쓰기</span>
					</button>
					</a>
				</c:when>
				<c:otherwise>
					<p style="color: #BBBBBB;FONT-SIZE: 14px;margin: 0;">(취소불가)</p>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test= "${json.get('statement') == 3}">
				<p>예약취소</p>
			</c:when>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
	</c:if>
</table>

<div id="paging" style="margin:30px">
<a href="${cp}/reserve/record?page=${param.page - 10}"><span style="color:#775CE2">이전</span></a>
<c:forEach var="i" begin="${param.startPage}" end="${param.endPage}">
	<c:choose>
	<c:when test="${i eq param.page}">
		<span style="color : red; font-size: 22px">${i}</span>
	</c:when>
	<c:otherwise>
		<a href="${cp}/reserve/record?page=${i}">${i}</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
<a href="${cp}/reserve/record?page=${param.page + 10}"><span style="color:#775CE2">이후</span></a>
</div>
	
</div>