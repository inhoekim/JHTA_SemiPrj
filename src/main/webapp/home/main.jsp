<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0; padding:0;}
li{list-style:none;}

.slide_wrapper{
position:relative;
width:400px;
margin:0 auto;
height:300px;
}
.slides{
position:absolute;
left:0; top:0;
width:1600px;
}
.slides li:not(:last-child){
float:left;
margin-right:30px;
}



</style>
</head>
<body>
	<jsp:include page="/home/membership.html" />
	<div class="slide_wrapper">
		<ul class="clides">
			<li>
				<div class="content">
					<a href="" class="swiper-slide">
						<!-- 해당 룸 예약창으로 --> <span class="image"><img
							src="${cp }/images/room/doubleRoom1.jpg/" alt="사진1"></span> <span
						class="title">
							<h3>연말 가족, 친구와 함께</h3> 추운 겨울 가족과 함께 따뜻한 연말 보내세요.
					</span>
					</a>
				</div>
			</li>
			 <li>
		<div class="content">
			<a href="" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/doubleRoom2.jpg" alt="사진2"></span>
			  <span class="title">
			 <h3>연말 연인과 함께하는</h3>
			 넓은 거실과 패밀리 패키지를 함께 누려보세요!</span>
			</a>
		</div>
		</li>
	   <li>
		<div class="content">
			<a href="" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/singleRoom1.jpg" alt="사진3"></span>
			  <span class="title">
			 <h3>프리미엄 호캉스</h3>
			 연말 맞이 스스로에게 주는 선물 호캉스</span>
			</a>
		</div>
		</li>
		<li>
		<div class="content">
			<a href="" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/singleRoom2.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>크리스마스 맞이 호캉스</h3>
			 스파와 함께 연말 맞이 호캉스를 누려보세요!</span>
			</a>	
		</div>
		</li>
		<li>
		<div class="content">
			<a href="" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/twinRoom1.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>친구와 함께하는 호캉스</h3>
			 넷플릭스와 함께 맞는 연말</span>
			</a>	
		</div>
		</li>
		<li>
		<div class="content">
			<a href="" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/twinRoom2.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>연말 호캉스는 우리우리호텔에서</h3>
			 스파와 함께 연말 맞이 호캉스를 누려보세요!</span>
			</a>	
		</div>
		</li>
		</ul>
			<p class="controls">
				<span class="prev">prev</span>
				<span class="next">next</span>
			</p>
	</div>

</body>
</html>