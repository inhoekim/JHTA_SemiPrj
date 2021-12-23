<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
	margin: 0; 
	padding: 10;

	  -webkit-font-smoothing:antialised;
	}
	li {
	list-style: none;
    }
    li div {
	margin: auto;
    }
	.container{
	position: relative;
	width: 100%;     
	overflow: hidden;
	padding-top: 80px;
	padding-bottom: 50px;
	align-content: center;
	}
	.slider-container{
	position:absolute;
	width:100%;
	left: 0;
	-webkit-transition: left .4s ease-in;
	transition: left .4s ease-in;
	}
	.slide{
	position: absolute;
	width: 100%;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
	overflow: hidden;
	}
	.slider-container.animated{
	-webkit-transition:left .5s ease-in;
	transition:left .5s ease-in;
	}
	.simple-list {
	list-style-type: none;
	margin: 0;
	padding: 0;
    } 
	#prev, 
	#next{
		position:absolute;
		top:50%;
		left:50%;
		transform:translateY(-50%);
		z-index:999999;
		display:inline-block;
		height:5em;
		width:5em;
		border-radius:50%;
		background-position: center center;
		background-repeat: no-repeat;
		-webkit-transition:all .3s ease-in;
		transition:all .3s ease-in;
		width:50px;
		height:30px;     
		 
	}
	.pager {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	margin: 0; padding 0;
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
    .img_change {
	width: 100%;
	height: 400px;
	float: left;
	align-content: center;
    }
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
	.swiper-slide{
	text-decoration-line: none;    
	}
	    
	#prev.disabled, #next.disables{display:none;}     
	#prev{background-image:url('/semiPrj/images/left-arrow-grey2.png'); margin-left:-570px;}  
	#prev:hover{background-image:url('/semiPrj/images/left-arrow-grey.png');} 
	#next{margin-left:520px;background-image:url('/semiPrj/images/right-arrow-grey2.png');}
	#next:hover{background-image:url('/semiPrj/images/right-arrow-grey.png)';}
</style>
</head>
<body>
	<jsp:include page="/home/membership.html" />

<div class="img_change">  
<h1 style="text-align: center;font-size:50px;color:#ff6666;">Room Package</h1>                          
	<div class="container">    
		<ul class="slider-container simple-list" id="slider">       
			<li class="slide" style="align-content: center;">
			<div>
				<div class="content" style="width:300px; height;300px;display:inline-block;">  
					<a href="${cp }/room/detail?room_id=1" class="swiper-slide"><!-- 해당 룸 예약창으로 --> 
					<span class="image"><img src="${cp }/images/room/singleRoom1.jpg" alt="사진1"></span> 
					<span class="title">
							<h3>연말 가족, 친구와 함께</h3> 추운 겨울 가족과 함께 따뜻한 연말 보내세요.
					</span>
					</a>
				</div>
				<div class="content" style="width:300px; height;300px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=2" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/doubleRoom1.jpg" alt="사진2"></span>
			  <span class="title">
			 <h3>연말 연인과 함께하는</h3>
			 넓은 거실과 패밀리 패키지를 함께 누려보세요!</span>
			</a>
		</div>
		<div class="content" style="width:300px; height;300px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=3" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/doubleRoom2.jpg"  alt="사진4"></span>
			 <span class="title">
			 <h3>연말 호캉스는 우리우리호텔에서</h3>
			 스파와 함께 연말 맞이 호캉스를 누려보세요!</span>
			</a>	
		</div>
		</div>
			</li>
	   <li class="slide">
	   <div>
		<div class="content" style="width:300px; height;300px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=4" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img src="${cp }/images/room/twinRoom1.jpg" alt="사진3"></span>
			  <span class="title">
			 <h3>프리미엄 호캉스</h3>
			 연말 맞이 스스로에게 주는 선물 호캉스</span>
			</a>
		</div>
		<div class="content" style="width:300px; height;300px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=5" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/twinRoom2.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>크리스마스 맞이 호캉스</h3>
			 스파와 함께 연말 맞이 호캉스를 누려보세요!</span>
			</a>	
		</div>
		<div class="content" style="width:300px; height;300px;display:inline-block;">
			<a href="${cp }/room/detail?room_id=6" class="swiper-slide"><!-- 해당 룸 예약창으로 -->
			 <span class="image"><img  src="${cp }/images/room/familyRoom1.jpg" alt="사진4"></span>
			 <span class="title">
			 <h3>친구와 함께하는 호캉스</h3>
			 넷플릭스와 함께 맞는 연말</span>
			</a>	
		</div>
		</div>
		</li>
		</ul>
		<p class="pager">
		</p>
		<a href="javascript:void(0)" id="prev"></a><a href="javascript:void(0)" id="next"></a>
	</div>
</div>
<div style="top:100px;position:relative;">      
<jsp:include page="/home/promotion.jsp" />   
</div>
	<script type="text/javascript">

		var slideWrap = document.querySelector('.container');
		var slideContainer = document.querySelector('.slider-container');
		var slide = document.querySelectorAll('.slide');
		var slideHeight = 0;
		var slideCount = slide.length;
		var currentIndex = 0;
		var timer = null;
		var pagerHTML='';
		var pager = document.querySelector('.pager');
		
		var navPrev = document.getElementById('prev');
		var navNext = document.getElementById('next');
		
		slideHeight = slide[0].offsetHeight;
		for(let i=0;i<slideCount; i++){
			let slideHei = slide[i].offsetHeight;
			if(slideHeight < slideHei){
				slideHeight = slideHei;
			}
		}
		
		slideWrap.style.height = slideHeight + 'px';
		slideContainer.style.height = slideHeight + 'px';
		
		for(let i=0;i<slideCount;i++){
			slide[i].style.left = i*100 +'%';
			pagerHTML += '<span data-idx="' + i + '">' + ( i + 1) + '</span>';
			pager.innerHTML = pagerHTML;
		}
		var pagerBtn = document.querySelectorAll('.pager span');
		
		function goToSlide(idx){
			slideContainer.classList.add('animated');
			slideContainer.style.left=-100*idx+'%';
			currentIndex = idx;
			for (let j = 0; j < pagerBtn.length; j++) {
				pagerBtn[j].classList.remove('active');
			}
			pagerBtn[idx].classList.add('active');
			
		}
		goToSlide(0);
		
		navPrev.addEventListener('click',function(){
			if(currentIndex == 0){
				goToSlide(slideCount - 1);
			}else{
				goToSlide(currentIndex-1);
			}
		});
		navNext.addEventListener('click',function(){
			if(currentIndex == slideCount - 1){
				goToSlide(0);
			}else{
				goToSlide(currentIndex + 1);
			}
		});
		function startAutoSlide(){
			timer = setInterval(function(){
				let nextIdx = (currentIndex + 1)%slideCount;
				goToSlide(nextIdx);
			},3000);
		}     
		startAutoSlide();
		
		function stopAutoSlide(){
			clearInterval(timer);
		}
		
		slideWrap.addEventListener('mouseenter', function(){
			stopAutoSlide();
		});
		
		slideWrap.addEventListener('mouseleave', function(){
			startAutoSlide();
		});
		
		for(let i = 0; i< pagerBtn.length; i++){
			pagerBtn[i].addEventListener('click', function(event){
				let pagerNum = event.target.innerText - 1;
				goToSlide(pagerNum);
			});
		}
	</script>
</body>
</html>