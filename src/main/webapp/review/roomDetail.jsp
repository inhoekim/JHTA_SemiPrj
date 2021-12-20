<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	/* 웹에 있는 모서리에 있는 글씨는 거칠다 그래서
  		 -webkit-font-smoothing: antialised;를 사용하면
  		 부드럽게 바꿔준다.
  		*/
	-webkit-font-smoothing: antialised;
}

li {
	list-style: none;
}

li div {
	margin: auto;
}

.container {
	position: relative;
	width: 100%;
	overflow: hidden;
	padding-top: 80px;
	padding-bottom: 50px;
}

.slider-container {
	position: absolute;
	width: 100%;
	left: 0;
	-webkit-transition: left .3s ease-in;
	transition: left .3s ease-in;
}

.slide {
	position: absolute;
	width: 100%;
	/* padding: 0 10%; */
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	overflow: hidden;
}

.slider-container.animated {
	-webkit-transition: left .3s ease-in;
	transition: left .3s ease-in;
}

/* utility */
.simple-list {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

/* 버튼 위치 */
#prev, #next {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateY(-50%);
	z-index: 999999;
	display: inline-block;
	height: 5em;
	width: 5em;
	border-radius: 50%;
	background-position: center center;
	background-repeat: no-repeat;
	-webkit-transition: all .3s ease-in;
	transition: all .3s ease-in;
}

#prev.disabled, #next.disabled {
	display: none;
}

#prev {
	background-image: url('/semiPrj/images/left-arrow-grey2.png');
	margin-left: -350px;
}

#prev:hover {
	background-image: url('/semiPrj/images/left-arrow-grey.png');
}

#next {
	margin-left: 270px;
	background-image: url('/semiPrj/images/right-arrow-grey2.png');
}

#next:hover {
	background-image: url('/semiPrj/images/right-arrow-grey.png');
}

.pager {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0; 
	padding 0;
	text-align: center;
}

.pager span {
	width: 10px;
	height: 10px;
	background: #ccc;
	border-radius: 50%;
	display: inline-block;
	text-indent: -9999em;
	margin: 0 5px;
}

.pager span.active {
	background: #333;
}

.img_srd_cal {
	width: 1400px;
	height: auto;
	margin: auto;
}

.img_cal_wrap {
	margin-bottom: 10px;
	width: auto;
	height: 700px;
}

.img_change {
	width: 50%;
	height: 700px;
	float: left;
	background-color: #D8D8D8;
}

.cal {
	width: 50%;
	height: 700px;
	float: left;
	background-color: #E6E6E6;
}

/* 슬라이더 css */
.slide_wrap {
	position: realtive;
	width: 400px;
	margin: auto;
	padding-bottom: 30px;
}

.slide_box {
	width: 100%;
	margin: auto;
	overflow-x: hidden;
}

.container .slide_content {
	plspaly: table;
	float: left;
	width: 50px;
	height: 50px;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	margin-top: 10px;
}

tr {
	border-bottom: #D8D8D8 solid 1px;
}

th {
	background-color: #E6E6E6;
	padding: 6px 6px;
}

td {
	padding: 4px 4px;
}

.review_contnet #star_span {
	font-size: 1em; /* 별 크기 */
	color: transparent; /* 기존 별 컬러 제거 */
	text-shadow: 0 0 0 #C80404; /* 새로운 별 이미지 색상 부여 */
}

.review_div {
	border-bottom: #D8D8D8 solid 2px;
	padding-top: 15px;
	padding-bottom: 15px;
}

.review_span, .review_cnt {
	font-weight: bolder;
	font-size: 1.2em;
}

.review_writer {
	float: right;
}

.review_header {
	padding: 5px 10px 5px 10px
}

.review_list {
	margin-bottom: 30px;
}

.review_contnet {
	border-bottom: #D8D8D8 solid 2px;
}

.review_body {
	padding: 5px 10px 15px 10px;
}

.review_cnt {
	font-weight: blod;
}

.cnt_b {
	color: blue;
}

.reservation_btn {
	width: 100px;
	height: 27px;
	border: 1px solid #ff6666;
	border-radius: 5px;
	color: white;
	background-color: #ff6666;
}

.reservation_btn:hover {
	color: #ff6666;
	background-color: white;
}

.show_btn {
	text-align: center;
	margin-bottom: 30px;
}

.more_btn {
	padding: 10 15 10 15;
	border: #ff6666 solid 1px;
	color: #ff6666;
	text-decoration: none;
}

.more_btn:hover {
	box-shadow: inset 0px 0px 3px 0px rgb(77, 71, 71);
}

</style>
<div class="img_srd_cal">
	<div class="img_cal_wrap">
		<div class="img_change">
			<div class="container">
				<ul class="slider-container simple-list" id="slider">
					<li class="slide"><img src="/semiPrj/images/a.jpg"
						width="500px" height="500px"></li>
					<li class="slide"><img src="/semiPrj/images/b.jpg"
						width="500px" height="500px"></li>
					<li class="slide"><img src="/semiPrj/images/c.jpg"
						width="500px" height="500px"></li>
				</ul>
				<p class="pager">
					<!-- <span data-idx="1">1</span>
					<span data-idx="2">2</span>
					<span data-idx="3">3</span>
					<span data-idx="4">4</span>
					<span data-idx="5">5</span>
					<span data-idx="6">6</span>
					<span data-idx="7">7</span>
					<span data-idx="8">8</span> -->
				</p>
				<a href="#" id="prev"></a> <a href="#" id="next"></a>
			</div>
		</div>
		<div class="cal">
		</div>
	</div>
	<div class="reservation_div">
		<h3>객실 예약하기</h3>
		<table>
			<colgroup>
				<col style="width: 40%">
				<col style="width: 20%">
				<col style="width: 20%">
				<col style="width: 20%">
			</colgroup>
			<thead>
				<tr>
					<th>객실</th>
					<th>인원</th>
					<th>객실요금</th>
					<th>예약하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>101호</td>
					<td>2인</td>
					<td>39800</td>
					<td><input type="button" value="예약하기" class="reservation_btn"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="review_div">
		<span class="review_span">객실후기</span> | <span class="review_cnt"><b class="cnt_b">${requestScope.review_cnt }</b>건</span>
	</div>
	<div class="review_list">
		<c:forEach var="list" items="${requestScope.list }">
			<div class="review_contnet">
				<div class="review_header">
					<c:forEach begin="1" end="${list.rate }">
						<span id="star_span">★</span>
					</c:forEach>
					<span class="review_writer">${list.hlogin_id } | ${list.created_day }</span>
				</div>
				<div class="review_body">
					<p>
						${list.content }
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="show_btn">
		<a href="javascript:moreReview()" class="more_btn">후기 더보기</a>
	</div>
</div>
<script>
	// 슬라이더 시작
	var slideWrap = document.querySelector('.container');
	var slideContainer = document.querySelector('.slider-container');
	var slide = document.querySelectorAll('.slide');
	var slideHeight = 0;
	// 이미지 총 개수
	var slideCount = slide.length;
	// 인덱스 번호
	var currentIndex = 0;
	// setInterval 실행 함수의 변수
	var timer = null;
	// 페이저 HTML
	var pagerHTML = '';
	var pager = document.querySelector('.pager');

	// 페이저 버튼
	//var pagerBtn = document.querySelectorAll('.pager span');

	// 버튼
	var navPrev = document.getElementById('prev');
	var navNext = document.getElementById('next');

	// 슬라이드의 높이 확인하여 부모의 높이로 지정하기
	// 대상.offsetHeight (높이 확인)
	slideHeight = slide[0].offsetHeight;
	for (let i = 0; i < slideCount; i++) {
		let slideHei = slide[i].offsetHeight;
		if (slideHeight < slideHei) {
			slideHeight = slideHei;
		}
	}

	slideWrap.style.height = slideHeight + 'px';
	slideContainer.style.height = slideHeight + 'px';

	// 슬라이드가 있으면 가로로 배열하기

	for (let i = 0; i < slideCount; i++) {
		slide[i].style.left = i * 100 + '%';
		pagerHTML += '<span data-idx="' + i + '">' + (i + 1) + '</span>';
		pager.innerHTML = pagerHTML;
	}

	var pagerBtn = document.querySelectorAll('.pager span');

	// 슬라이드 이동 함수
	function goToSlide(idx) {
		slideContainer.classList.add('animated');
		slideContainer.style.left = -100 * idx + '%';
		// 인덱스 번호 업데이트
		currentIndex = idx;
		// 클릭된 요소에만 active 추가
		// 모든 pagerBtn에 active 제거
		for (let j = 0; j < pagerBtn.length; j++) {
			pagerBtn[j].classList.remove('active');
		}
		pagerBtn[idx].classList.add('active');
	}// goToSlide

	// pagerBtn 시작할때 active 적용
	goToSlide(0);

	// 버튼 클릭하면 슬라이드 이동시키기
	// 다음버튼을 클릭, 이전 버튼 클릭
	// 이전
	navPrev.addEventListener('click', function() {
		if (currentIndex == 0) { // 마지막 에서 다음 누르면 0번째 인덱스
			goToSlide(slideCount - 1);
		} else {
			goToSlide(currentIndex - 1);
		}
	});
	// 다음 
	navNext.addEventListener('click', function() {
		if (currentIndex == slideCount - 1) { // 마지막 에서 다음 누르면 0번째 인덱스
			goToSlide(0);
		} else {
			goToSlide(currentIndex + 1);
		}
	});

	// 자동 슬라이드
	// 4초마다 goToSlide(num); 0, 1, 2, 3, ... 5, 0
	// setInterval(function, time);	

	// clearInterval(대상)

	// 자동 슬라이드 함수
	function startAutoSlide() {
		timer = setInterval(function() {
			let nextIdx = (currentIndex + 1) % slideCount;
			goToSlide(nextIdx);
		}, 4000);
	}

	startAutoSlide();

	function stopAutoSlide() {
		clearInterval(timer);
	}

	/*
		slideWrap에 마우스 들어오면 할일, 나가면 할일
	 */
	slideWrap.addEventListener('mouseenter', function() {
		stopAutoSlide();
	});

	slideWrap.addEventListener('mouseleave', function() {
		startAutoSlide();
	});

	// pager로 슬라이드 이동하기
	for (let i = 0; i < pagerBtn.length; i++) {
		pagerBtn[i].addEventListener('click', function(event) {
			console.log(event.target.innerText);
			// innerText 내용 반환
			// innerHTML 태그를 반환
			//let pagerNum = event.target.getAttribute('data-idx');
			let pagerNum = event.target.innerText - 1;
			goToSlide(pagerNum);
		});
	}
	// 슬라이더 끝
	
	var xhr = null;
	// 리뷰 개수
	var review_cnt = 0;
	
	function moreReview() {
		xhr = new XMLHttpRequest();
		let url = '${pageContext.request.contextPath}/room/detail';
		let param = 'room_id=' + ${requestScope.room_id};
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				for (let i = 0; i < json.length; i++) {
					if (typeof json[i].room_id != "undefined") {
						review_cnt = json[0].review_cnt;
						
						let review_id = json[i].review_id;
						let hlogin_id = json[i].hlohin_id;
						let content = json[i].content;
						let rate = json[i].rate;
						let created_day = json[i].created_day;
						
					}
				}
			}
		};
		alert(param);
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);		
	}
</script>